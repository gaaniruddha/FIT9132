/* FIT9132 2019 S2 Assignment 3 Q4 ANSWERS

   Student Name: Gayatri Aniruddha
    Student ID: 30945305

   Comments to your marker: 
   i - Updates completed_bookings attribute in guest when a new booking is added in booking.
   ii - Prevents a guest to write a review if the guest has not completed his/her stay at the resort.
   iii - Prevents insertion of bookings if it creates a conflict. Have considered all cases of conflict and overlaps.
   
*/

/* (i)*/
CREATE OR REPLACE TRIGGER update_completed_bookings AFTER
    INSERT OR UPDATE OF flag_booking_state ON booking
BEGIN
    UPDATE guest
    SET
        completed_bookings = (
            SELECT
                COUNT(booking_id)
            FROM
                booking
            WHERE
                flag_booking_state = 'C'
                AND guest.guest_no = booking.guest_no
        );

END;

/*Test Harness*/

SET SERVEROUTPUT ON

SET ECHO ON

/* Prior State*/

SELECT
    *
FROM
    booking;

SELECT
    *
FROM
    guest;

/* Test Trigger*/
/* UPDATE A VALUE */

UPDATE booking
SET
    booking_to = TO_DATE(('07-02-2019'), 'dd-mm-yyyy'),
    flag_booking_state = 'C'
WHERE
    booking_id = 1;

/* Post State */

SELECT
    *
FROM
    booking;

SELECT
    *
FROM
    guest;

/* Undo Changes*/

ROLLBACK;

SET ECHO OFF;

/* (ii)*/

DROP TRIGGER prevent_invalid_reviews;

CREATE OR REPLACE TRIGGER prevent_invalid_reviews BEFORE
    INSERT ON review
    FOR EACH ROW
DECLARE
    booking_end DATE;
BEGIN
    SELECT
        booking_to
    INTO booking_end
    FROM
        booking
    WHERE
        resort_id = :new.resort_id
        AND guest_no = :new.guest_no;

    IF :new.review_date < booking_end THEN
        raise_application_error(-20000, 'Review cannot be added until the guest completed the stay'
        );
    END IF;

END;
/

/*Test Harness*/

SET SERVEROUTPUT ON

SET ECHO ON

/* Prior State*/

SELECT
    *
FROM
    review;

/* Test Trigger*/

INSERT INTO review VALUES (
    16,
    'Amazing Service',
    TO_DATE('01-02-19', 'DD-MM-YY'),
    3.5,
    1,
    1
);

INSERT INTO review VALUES (
    17,
    'Amazing Service',
    TO_DATE('08-02-19', 'DD-MM-YY'),
    3.5,
    1,
    1
);

/* Post State */

SELECT
    *
FROM
    review;

/* Undo Changes*/

ROLLBACK;

SET ECHO OFF;

/* (iii)*/

CREATE OR REPLACE TRIGGER cabin_occupied BEFORE
    INSERT ON booking
    FOR EACH ROW
DECLARE
    temp NUMBER DEFAULT 0;
BEGIN
    SELECT
        COUNT(*)
    INTO temp
    FROM
        booking
    WHERE
        cabin_no = :new.cabin_no
        AND resort_id = :new.resort_id
        AND ( :new.booking_from >= booking_from
              AND booking_to >= :new.booking_from )
        OR ( :new.booking_to >= booking_from
             AND booking_to >= :new.booking_to )
        OR ( :new.booking_to > booking_to
             AND :new.booking_from < booking_from );

    IF ( temp > 0 ) THEN
        raise_application_error(-20000, 'This cabin in the resort is already booked!'
        );
    END IF;
END;
/

/*Test Harness*/

SET SERVEROUTPUT ON

SET ECHO ON

/* Prior State*/

SELECT
    *
FROM
    booking;

/* Test Trigger*/

DELETE FROM booking
WHERE
    booking_id IN (
        51,
        52,
        53,
        54
    );

INSERT INTO booking VALUES (
    51,
    TO_DATE('06-01-19', 'dd-mm-yy'),
    TO_DATE('08-02-19', 'dd-mm-yy'),
    2,
    1,
    1000,
    6,
    1,
    1,
    'C'
);

INSERT INTO booking VALUES (
    52,
    TO_DATE('06-01-19', 'dd-mm-yy'),
    TO_DATE('08-02-19', 'dd-mm-yy'),
    2,
    1,
    1000,
    7,
    1,
    1,
    'C'
);

INSERT INTO booking VALUES (
    53,
    TO_DATE('06-02-19', 'dd-mm-yy'),
    TO_DATE('08-02-19', 'dd-mm-yy'),
    2,
    1,
    1000,
    8,
    1,
    1,
    'C'
);

INSERT INTO booking VALUES (
    54,
    TO_DATE('05-02-19', 'dd-mm-yy'),
    TO_DATE('08-02-19', 'dd-mm-yy'),
    2,
    1,
    1000,
    9,
    1,
    1,
    'C'
);    

/* Post State */

SELECT
    *
FROM
    booking;

/* Undo Changes*/

ROLLBACK;

SET ECHO OFF;

COMMIT;