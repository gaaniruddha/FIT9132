/* FIT9132 2019 S2 Assignment 3 Q2 ANSWERS

   Student Name: Gayatri Aniruddha
    Student ID: 30945305

   Comments to your marker: 
   i - Displayed the resort and manager details for the resorts which do not have a resort star rating and which have a live in manager.
   ii - Displayed the resort details whose total booking charges are graeter than the average total booking charges.
   iii - Displays a list of all the invalid reviews.
   iv - Displays total number of cabins which have more than 2 bedrooms.
   v - Displays the most popular resort.
   vi - Displays a list of points close to various resorts.
   
*/

/* (i) */
SELECT
    r.resort_name,
    r.resort_street_address
    || ' '
    || r.resort_pcode AS resort_address,
    m.manager_name,
    m.manager_phone
FROM
    resort    r
    JOIN town      t
    ON r.town_id = t.town_id
    JOIN manager   m
    ON r.manager_id = m.manager_id
WHERE
    r.resort_star_rating IS NULL
    AND r.resort_livein_manager = 'Y'
ORDER BY
    r.resort_pcode DESC,
    r.resort_name;

/* (ii)*/

SELECT
    r.resort_id,
    r.resort_name,
    r.resort_street_address,
    t.town_name,
    t.town_state,
    r.resort_pcode,
    SUM(b.booking_charge) AS "Total_Booking_Charge"
FROM
    resort    r
    JOIN town      t
    ON r.town_id = t.town_id
    JOIN booking   b
    ON r.resort_id = b.resort_id
GROUP BY
    r.resort_id,
    r.resort_name,
    r.resort_street_address,
    t.town_name,
    t.town_state,
    r.resort_pcode
HAVING
    SUM(booking_charge) > (
        SELECT
            AVG(booking_charge)
        FROM
            booking
    )
ORDER BY
    r.resort_id;

/* (iii)*/
/*UPDATE review
SET
    review_date = TO_DATE('01-02-19', 'DD-MM-YY')
WHERE
    guest_no = 1
    AND resort_id = 1;*/

SELECT
    review_id,
    review.guest_no,
    guest.guest_name,
    review.resort_id,
    resort.resort_name,
    review_comment,
    review_date AS date_reviewed
FROM
    review
    JOIN booking
    ON review.guest_no = booking.guest_no
    JOIN resort
    ON resort.resort_id = booking.resort_id
    JOIN guest
    ON guest.guest_no = booking.resort_id
WHERE
    TO_CHAR(review.review_date, 'DD-MM-YY') < TO_CHAR(booking.booking_to, 'DD-MM-YY'
    )
    AND review.resort_id = booking.resort_id
    AND review.guest_no = guest.guest_no
    OR guest.guest_no NOT IN (
        SELECT
            guest_no
        FROM
            booking
    );

/* (iv)*/

SELECT DISTINCT
    r.resort_id,
    r.resort_name,
    'Has '
    || (
        SELECT
            COUNT(c.cabin_no)
        FROM
            cabin c
        WHERE
            c.resort_id = r.resort_id
    )
    || ' '
    || 'cabins in total with'
    || ' '
    || (
        SELECT
            COUNT(cc.cabin_bedrooms)
        FROM
            cabin cc
        WHERE
            cc.cabin_bedrooms > 2
            AND cc.resort_id = r.resort_id
    )
    || ' '
    || 'having more than 2 bedrooms' AS "accomodation_available"
FROM
    resort   r
    JOIN cabin    c
    ON r.resort_id = c.resort_id
WHERE
    (
        SELECT
            COUNT(c.cabin_bedrooms)
        FROM
            cabin    c
            JOIN resort   r
            ON r.resort_id = c.resort_id
        WHERE
            c.cabin_bedrooms > 2
            AND r.resort_id = c.resort_id
    ) > 2
GROUP BY
    r.resort_id,
    r.resort_name,
    c.cabin_bedrooms
ORDER BY
    r.resort_name;
 
/* (v)*/

SELECT
    r.resort_id,
    r.resort_name,
    (
        CASE
            WHEN r.resort_livein_manager = 'Y' THEN
                'Yes'
            WHEN r.resort_livein_manager = 'N' THEN
                'No'
        END
    ) AS live_in_manager,
    (
        CASE
            WHEN r.resort_star_rating IS NULL THEN
                'No Ratings'
            WHEN r.resort_star_rating IS NOT NULL THEN
                TO_CHAR(r.resort_star_rating)
        END
    ) AS star_rating,
    m.manager_name,
    m.manager_phone,
    COUNT(b.booking_id) AS number_of_bookings
FROM
    resort    r
    JOIN booking   b
    ON r.resort_id = b.resort_id
    JOIN manager   m
    ON m.manager_id = r.manager_id
GROUP BY
    r.resort_id,
    r.resort_name,
    r.resort_livein_manager,
    r.resort_star_rating,
    m.manager_name,
    m.manager_phone
HAVING
    COUNT(b.booking_id) = (
        SELECT
            MAX(COUNT(b.booking_id))
        FROM
            booking
        GROUP BY
            resort_id
    )
ORDER BY
    r.resort_name;
    
/* (vi)*/

SELECT
    r.resort_id,
    r.resort_name,
    p.poi_name,
    p.poi_street_address,
    (
        SELECT
            t.town_name
        FROM
            town t
        WHERE
            t.town_id = p.town_id
    ) AS "POI_TOWN",
    (
        SELECT
            t.town_state
        FROM
            town t
        WHERE
            t.town_id = p.town_id
    ) AS "POI_STATE",
    (
        CASE
            WHEN TO_CHAR(p.poi_open_time, 'HH:MM AM') IS NULL THEN
                'Not applicable'
            WHEN TO_CHAR(p.poi_open_time, 'HH:MM AM') IS NOT NULL THEN
                TO_CHAR(p.poi_open_time, 'HH:MM AM')
        END
    ) AS poi_opening_time,
    TO_CHAR(round((geodistance(t.town_lat, t.town_long,(
        SELECT
            t2.town_lat
        FROM
            town t2
        WHERE
            t2.town_id = p.town_id
    ),(
        SELECT
            t2.town_long
        FROM
            town t2
        WHERE
            t2.town_id = p.town_id
    ))), 1), '90.9') AS separation_in_kms
FROM
    point_of_interest   p
    JOIN town                t
    ON p.town_id = p.town_id
    JOIN resort              r
    ON t.town_id = r.town_id
WHERE
    round((geodistance(t.town_lat, t.town_long,(
        SELECT
            t2.town_lat
        FROM
            town t2
        WHERE
            t2.town_id = p.town_id
    ),(
        SELECT
            t2.town_long
        FROM
            town t2
        WHERE
            t2.town_id = p.town_id
    ))), 1) <= 100
ORDER BY
    r.resort_name;

COMMIT;