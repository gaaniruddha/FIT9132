/* FIT9132 2019 S2 Assignment 3 Q3 ANSWERS

   Student Name: Gayatri Aniruddha
    Student ID: 30945305

   Comments to your marker: 
   i - Adding an additional attribute to the booking to flag the state of booking.
   ii - Adding an additional attribute to guest to record completed bookings.
   iii - Here, my most popular resort is Byron Bay Exclusive Resort. Hence, I have added 3 additional managers along with their roles for this resort itself.I have added Adding 2 tables - role and manager_role, 
   role has role_id and role_description.
   manager_role has details about resort_id, role_id and manager_id.
   Then, we added 3 roles for the the 3 managers assigned to our popular resort.
   
*/
/* (i)*/
ALTER TABLE booking DROP COLUMN flag_booking_state;

ALTER TABLE booking ADD flag_booking_state VARCHAR(1);

ALTER TABLE booking
    ADD CONSTRAINT check_flag_booking CHECK ( flag_booking_state IN (
        'C',
        'D',
        'F',
        'P'
    ) );

UPDATE booking
SET
    flag_booking_state = 'F'
WHERE
    resort_id IN (
        SELECT
            resort_id
        FROM
            resort
    );

UPDATE booking
SET
    flag_booking_state =
        CASE
            WHEN SYSDATE > booking_to   THEN
                'C'
            WHEN SYSDATE < booking_from THEN
                'F'
            WHEN SYSDATE > booking_from
                 AND SYSDATE < booking_to THEN
                'P'
        END;
 
/* (ii)*/

ALTER TABLE guest DROP COLUMN completed_bookings;

ALTER TABLE guest ADD completed_bookings NUMBER(8);

UPDATE guest
SET
    completed_bookings = (
        SELECT
            COUNT(guest_no)
        FROM
            booking
        WHERE
            flag_booking_state = 'C'
            AND guest.guest_no = booking.guest_no
        GROUP BY
            guest_no
    )
WHERE
    guest_no IN (
        SELECT
            guest_no
        FROM
            guest
    );

/* (iii)*/

/* 1. Create table ROLE */

DROP TABLE role CASCADE CONSTRAINTS;

CREATE TABLE role (
    role_id            VARCHAR(2) NOT NULL,
    role_description   CHAR(500) NOT NULL
);

COMMENT ON COLUMN role.role_id IS
    'Role ID';

COMMENT ON COLUMN role.role_description IS
    'Role Description';

ALTER TABLE role ADD CONSTRAINT role_pk PRIMARY KEY ( role_id );

/* 2. Insert values into role */

INSERT INTO role VALUES (
    'BM',
    'Bookings Manager'
);

INSERT INTO role VALUES (
    'CM',
    'Cleaning Manager'
);

INSERT INTO role VALUES (
    'MM',
    'Maintenance Manager'
);
        
/* 3 Create TABLE manager_role */

DROP TABLE manager_role CASCADE CONSTRAINTS;

CREATE TABLE manager_role (
    resort_id    NUMBER(4) NOT NULL,
    role_id      VARCHAR(2) NOT NULL,
    manager_id   NUMBER(4) NOT NULL,
    CONSTRAINT manager_role_pk PRIMARY KEY ( resort_id,
                                             manager_id )
);

COMMENT ON COLUMN manager_role.resort_id IS
    'Resort ID';

COMMENT ON COLUMN manager_role.role_id IS
    'Role ID';

COMMENT ON COLUMN manager_role.manager_id IS
    'Manager ID';

ALTER TABLE manager_role
    ADD CONSTRAINT manager_role_resort FOREIGN KEY ( resort_id )
        REFERENCES resort ( resort_id );

ALTER TABLE manager_role
    ADD CONSTRAINT manager_role_manager FOREIGN KEY ( manager_id )
        REFERENCES manager ( manager_id );

ALTER TABLE manager_role
    ADD CONSTRAINT manager_role_role FOREIGN KEY ( role_id )
        REFERENCES role ( role_id );
        
/* 4 Update the required resort */       
/* There is no need to add attributes to resort,
as repeating groups are remobved. We only need to update manager_role */

INSERT INTO manager_role VALUES (
    (
        SELECT
            resort_id
        FROM
            resort
        WHERE
            resort_name = 'Byron Bay Exclusive Resort'
    ),
    (
        SELECT
            role_id
        FROM
            role
        WHERE
            role_description = 'Bookings Manager'
    ),
    (
        SELECT
            manager_id
        FROM
            resort
        WHERE
            resort_name = 'Byron Bay Exclusive Resort'
    )
);

INSERT INTO manager_role VALUES (
    (
        SELECT
            resort_id
        FROM
            resort
        WHERE
            resort_name = 'Byron Bay Exclusive Resort'
    ),
    (
        SELECT
            role_id
        FROM
            role
        WHERE
            role_description = 'Cleaning Manager'
    ),
    (
        SELECT
            manager_id
        FROM
            manager
        WHERE
            manager_name = 'Garrott Gooch'
    )
);

INSERT INTO manager_role VALUES (
    (
        SELECT
            resort_id
        FROM
            resort
        WHERE
            resort_name = 'Byron Bay Exclusive Resort'
    ),
    (
        SELECT
            role_id
        FROM
            role
        WHERE
            role_description = 'Maintenance Manager'
    ),
    (
        SELECT
            manager_id
        FROM
            manager
        WHERE
            manager_name = 'Fonsie Tillard'
    )
);

/* 5. Remove attributes from table */
/* Need to remove manager_id and resort_livein_manager from resort table as it's a repeating group */

ALTER TABLE resort DROP COLUMN manager_id;

/*ALTER TABLE resort
DROP COLUMN resort_livein_manager;*/

/* 6 Need to DROP the constraints which link RESORT and MANAGER */
/*ALTER TABLE resort
DROP CONSTRAINT manager_resort;*/

COMMIT;