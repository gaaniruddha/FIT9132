/* FIT9132 2019 S2 Assignment 3 Q1-Part B ANSWERS

   Student Name: Gayatri Aniruddha
    Student ID: 30945305

   Comments to your marker: I have created a sequence named sequence_1 that starts with the value 100 and goes up in steps of 1.
   Then, I have inserted a new resort named 'Awesome Resort' based on the specifications provided.
   Then, I have replaced the manager of this resort. Finally, I have removed this resort from the database.
   
*/

/* (i)*/
DROP SEQUENCE sequence_1;

CREATE SEQUENCE sequence_1 START WITH 100 INCREMENT BY 1;

/* (ii)*/

INSERT INTO resort VALUES (
    sequence_1.NEXTVAL,
    'Awesome Resort',
    '50 Awesome Road',
    '4830',
    5,
    'N',
    (
        SELECT
            town_id
        FROM
            town
        WHERE
            town_lat = - 20.7256
            AND town_long = 139.4927
    ),
    5
);

INSERT INTO cabin VALUES (
    21,
    (
        SELECT
            resort_id
        FROM
            resort
        WHERE
            resort_name = 'Awesome Resort'
    ),
    3,
    6,
    'Free wi-Fi, kitchen with 400 ltr refrigerator, stove, microwave, pots, pans, silverware'
);

INSERT INTO cabin VALUES (
    22,
    (
        SELECT
            resort_id
        FROM
            resort
        WHERE
            resort_name = 'Awesome Resort'
    ),
    2,
    4,
    'Free wi-Fi, kitchen with 280 ltr refrigerator, stove, pots, pans, silverware, toaster, electric kettle, TV and utensils'
);

/* (iii)*/

UPDATE resort
SET
    resort_livein_manager = 'Y',
    manager_id = (
        SELECT
            manager_id
        FROM
            manager
        WHERE
            manager_name = 'Fonsie Tillard'
            AND manager_phone = 9636535741
    )
WHERE
    resort_name = 'Awesome Resort';

/* (iv)*/

DELETE FROM cabin
WHERE
    resort_id IN (
        SELECT
            resort_id
        FROM
            resort
        WHERE
            resort_name = 'Awesome Resort'
    );

DELETE FROM resort
WHERE
    resort_name = 'Awesome Resort';

COMMIT;