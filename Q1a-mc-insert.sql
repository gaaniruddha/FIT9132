/* FIT9132 2019 S2 Assignment 3 Q1-Part A ANSWERS

   Student Name: Gayatri Aniruddha 
    Student ID: 30945305 

   Comments to your marker: I have inserted values into resort, cabin, booking and review. I have added 5 resorts, 20 cabins, 26 bookings and 15 reviews the tables.
   
*/

/* 5 resorts */
INSERT INTO resort VALUES (
    1,
    'Byron Bay Exclusive Resort',
    '1 Karma Road',
    2481,
    NULL,
    'Y',
    1,
    3
);

INSERT INTO resort VALUES (
    2,
    'Amazing Resort',
    '5B Lincoln Way',
    3564,
    2,
    'Y',
    2,
    3
);

INSERT INTO resort VALUES (
    3,
    'Alice Springs Reosrt',
    '1 Wonderful Road',
    0870,
    3,
    'Y',
    3,
    3
);

INSERT INTO resort VALUES (
    4,
    'Byron Bay Super Reosrt',
    '675 Lennon Street',
    2481,
    5,
    'Y',
    4,
    4
);

INSERT INTO resort VALUES (
    5,
    'Gympie Luxury Reosrt',
    '1234 Gympie Hwy Gympie',
    2481,
    NULL,
    'Y',
    5,
    5
);

/* 20 cabins */

INSERT INTO cabin VALUES (
    1,
    1,
    1,
    1,
    'Free wi-Fi. kitchen with 280 ltr refrigerator,stove, pots, pans, silverware, toaster, electric kettle, TV and utensils'
);

INSERT INTO cabin VALUES (
    2,
    1,
    2,
    4,
    'Free wi-Fi. kitchen with 280 ltr refrigerator,stove, pots, pans, silverware, toaster, electric kettle, TV and utensils'
);

INSERT INTO cabin VALUES (
    3,
    1,
    3,
    6,
    'Free wi-Fi. kitchen with 280 ltr refrigerator,stove, pots, pans, silverware, toaster, electric kettle, TV and utensils'
);

INSERT INTO cabin VALUES (
    4,
    1,
    3,
    6,
    'Free wi-Fi. kitchen with 280 ltr refrigerator,stove, pots, pans, silverware, toaster, electric kettle, TV and utensils'
);

INSERT INTO cabin VALUES (
    5,
    2,
    1,
    1,
    'Free wi-Fi. kitchen with 280 ltr refrigerator,stove, pots, pans, silverware, toaster, electric kettle, TV'
);

INSERT INTO cabin VALUES (
    6,
    2,
    2,
    4,
    'Free wi-Fi. kitchen with 280 ltr refrigerator,stove, pots, pans, silverware, toaster, electric kettle, TV'
);

INSERT INTO cabin VALUES (
    7,
    2,
    3,
    6,
    'Free wi-Fi. kitchen with 280 ltr refrigerator,stove, pots, pans, silverware, toaster, electric kettle, TV'
);

INSERT INTO cabin VALUES (
    8,
    2,
    3,
    6,
    'Free wi-Fi. kitchen with 280 ltr refrigerator,stove, pots, pans, silverware, toaster, electric kettle, TV'
);

INSERT INTO cabin VALUES (
    9,
    3,
    1,
    1,
    'Free wi-Fi. kitchen with 280 ltr refrigerator,stove, pots, pans, toaster, electric kettle, TV'
);

INSERT INTO cabin VALUES (
    10,
    3,
    2,
    4,
    'Free wi-Fi. kitchen with 280 ltr refrigerator,stove, pots, pans, toaster, electric kettle, TV'
);

INSERT INTO cabin VALUES (
    11,
    3,
    3,
    6,
    'Free wi-Fi. kitchen with 280 ltr refrigerator,stove, pots, pans, toaster, electric kettle, TV'
);

INSERT INTO cabin VALUES (
    12,
    3,
    3,
    6,
    'Free wi-Fi. kitchen with 280 ltr refrigerator,stove, pots, pans, toaster, electric kettle, TV'
);

INSERT INTO cabin VALUES (
    13,
    5,
    1,
    1,
    'Free wi-Fi. kitchen with 280 ltr refrigerator,stove, pots, pans, silverware, toaster, electric kettle, TV'
);

INSERT INTO cabin VALUES (
    14,
    5,
    2,
    4,
    'Free wi-Fi. kitchen with 280 ltr refrigerator,stove, pots, pans, silverware, toaster, electric kettle, TV'
);

INSERT INTO cabin VALUES (
    15,
    5,
    3,
    6,
    'Free wi-Fi. kitchen with 280 ltr refrigerator,stove, pots, pans, silverware, toaster, electric kettle, TV'
);

INSERT INTO cabin VALUES (
    16,
    5,
    3,
    6,
    'Free wi-Fi. kitchen with 280 ltr refrigerator,stove, pots, pans, silverware, toaster, electric kettle, TV'
);

INSERT INTO cabin VALUES (
    17,
    4,
    1,
    1,
    'Free wi-Fi. kitchen with 280 ltr refrigerator,stove, pots, pans, silverware, toaster, electric kettle, TV and utensils'
);

INSERT INTO cabin VALUES (
    18,
    4,
    2,
    4,
    'Free wi-Fi. kitchen with 280 ltr refrigerator,stove, pots, pans, silverware, toaster, electric kettle, TV and utensils'
);

INSERT INTO cabin VALUES (
    19,
    4,
    3,
    6,
    'Free wi-Fi. kitchen with 280 ltr refrigerator,stove, pots, pans, silverware, toaster, electric kettle, TV and utensils'
);

INSERT INTO cabin VALUES (
    20,
    4,
    3,
    6,
    'Free wi-Fi. kitchen with 280 ltr refrigerator,stove, pots, pans, silverware, toaster, electric kettle, TV and utensils'
);

/* 26 bookings */

INSERT INTO booking VALUES (
    1,
    TO_DATE('07-01-19', 'dd-mm-yy'),
    TO_DATE('07-02-19', 'dd-mm-yy'),
    2,
    1,
    1000,
    1,
    1,
    1
);

INSERT INTO booking VALUES (
    2,
    TO_DATE('07-02-19', 'dd-mm-yy'),
    TO_DATE('07-03-19', 'dd-mm-yy'),
    2,
    1,
    1000,
    2,
    1,
    1
);

INSERT INTO booking VALUES (
    3,
    TO_DATE('07-03-19', 'dd-mm-yy'),
    TO_DATE('07-04-19', 'dd-mm-yy'),
    2,
    2,
    2000,
    3,
    2,
    1
);

INSERT INTO booking VALUES (
    4,
    TO_DATE('07-04-19', 'dd-mm-yy'),
    TO_DATE('07-05-19', 'dd-mm-yy'),
    2,
    2,
    3000,
    4,
    3,
    1
);

INSERT INTO booking VALUES (
    5,
    TO_DATE('07-05-19', 'dd-mm-yy'),
    TO_DATE('07-06-19', 'dd-mm-yy'),
    2,
    3,
    4000,
    5,
    4,
    1
);

INSERT INTO booking VALUES (
    26,
    TO_DATE('07-06-19', 'dd-mm-yy'),
    TO_DATE('07-07-19', 'dd-mm-yy'),
    2,
    3,
    4000,
    6,
    4,
    1
);

INSERT INTO booking VALUES (
    6,
    TO_DATE('08-01-19', 'dd-mm-yy'),
    TO_DATE('08-02-19', 'dd-mm-yy'),
    2,
    1,
    1000,
    6,
    5,
    2
);

INSERT INTO booking VALUES (
    7,
    TO_DATE('08-02-19', 'dd-mm-yy'),
    TO_DATE('08-03-19', 'dd-mm-yy'),
    2,
    1,
    1000,
    7,
    5,
    2
);

INSERT INTO booking VALUES (
    8,
    TO_DATE('08-03-19', 'dd-mm-yy'),
    TO_DATE('08-04-19', 'dd-mm-yy'),
    2,
    2,
    2000,
    8,
    6,
    2
);

INSERT INTO booking VALUES (
    9,
    TO_DATE('08-04-19', 'dd-mm-yy'),
    TO_DATE('08-05-19', 'dd-mm-yy'),
    2,
    2,
    3000,
    9,
    7,
    2
);

INSERT INTO booking VALUES (
    10,
    TO_DATE('08-05-19', 'dd-mm-yy'),
    TO_DATE('08-06-19', 'dd-mm-yy'),
    2,
    3,
    4000,
    10,
    8,
    2
);

INSERT INTO booking VALUES (
    11,
    TO_DATE('09-06-19', 'dd-mm-yy'),
    TO_DATE('16-06-19', 'dd-mm-yy'),
    2,
    1,
    1000,
    1,
    9,
    3
);

INSERT INTO booking VALUES (
    12,
    TO_DATE('09-07-19', 'dd-mm-yy'),
    TO_DATE('16-07-19', 'dd-mm-yy'),
    2,
    1,
    1000,
    2,
    9,
    3
);

INSERT INTO booking VALUES (
    13,
    TO_DATE('09-08-19', 'dd-mm-yy'),
    TO_DATE('16-08-19', 'dd-mm-yy'),
    2,
    2,
    2000,
    3,
    10,
    3
);

INSERT INTO booking VALUES (
    14,
    TO_DATE('09-09-19', 'dd-mm-yy'),
    TO_DATE('16-09-19', 'dd-mm-yy'),
    2,
    2,
    3000,
    4,
    11,
    3
);

INSERT INTO booking VALUES (
    15,
    TO_DATE('09-10-19', 'dd-mm-yy'),
    TO_DATE('16-10-19', 'dd-mm-yy'),
    2,
    3,
    4000,
    5,
    12,
    3
);

INSERT INTO booking VALUES (
    16,
    TO_DATE('11-06-19', 'dd-mm-yy'),
    TO_DATE('17-06-19', 'dd-mm-yy'),
    2,
    1,
    1000,
    1,
    13,
    5
);

INSERT INTO booking VALUES (
    17,
    TO_DATE('11-07-19', 'dd-mm-yy'),
    TO_DATE('17-07-19', 'dd-mm-yy'),
    2,
    1,
    1000,
    2,
    13,
    5
);

INSERT INTO booking VALUES (
    18,
    TO_DATE('11-08-19', 'dd-mm-yy'),
    TO_DATE('17-08-19', 'dd-mm-yy'),
    2,
    2,
    2000,
    3,
    14,
    5
);

INSERT INTO booking VALUES (
    19,
    TO_DATE('11-09-19', 'dd-mm-yy'),
    TO_DATE('17-09-19', 'dd-mm-yy'),
    2,
    2,
    3000,
    4,
    15,
    5
);

INSERT INTO booking VALUES (
    20,
    TO_DATE('11-10-19', 'dd-mm-yy'),
    TO_DATE('17-10-19', 'dd-mm-yy'),
    2,
    3,
    4000,
    5,
    16,
    5
);

INSERT INTO booking VALUES (
    21,
    TO_DATE('10-06-19', 'dd-mm-yy'),
    TO_DATE('16-06-19', 'dd-mm-yy'),
    2,
    1,
    1000,
    1,
    17,
    4
);

INSERT INTO booking VALUES (
    22,
    TO_DATE('10-07-19', 'dd-mm-yy'),
    TO_DATE('16-07-19', 'dd-mm-yy'),
    2,
    1,
    1000,
    2,
    17,
    4
);

INSERT INTO booking VALUES (
    23,
    TO_DATE('10-08-19', 'dd-mm-yy'),
    TO_DATE('16-08-19', 'dd-mm-yy'),
    2,
    2,
    2000,
    3,
    18,
    4
);

INSERT INTO booking VALUES (
    24,
    TO_DATE('10-09-19', 'dd-mm-yy'),
    TO_DATE('16-09-19', 'dd-mm-yy'),
    2,
    2,
    3000,
    4,
    19,
    4
);

INSERT INTO booking VALUES (
    25,
    TO_DATE('10-10-19', 'dd-mm-yy'),
    TO_DATE('16-10-19', 'dd-mm-yy'),
    2,
    3,
    4000,
    5,
    20,
    4
);

/* 15 reviews */

INSERT INTO review VALUES (
    1,
    'Moderate',
    TO_DATE('01-02-19', 'DD-MM-YY'),
    3,
    1,
    1
);

INSERT INTO review VALUES (
    2,
    'Good',
    TO_DATE('07-04-19', 'DD-MM-YY'),
    4,
    2,
    1
);

INSERT INTO review VALUES (
    3,
    'Excellent',
    TO_DATE('07-05-19', 'DD-MM-YY'),
    5,
    3,
    1
);

INSERT INTO review VALUES (
    4,
    'Moderate',
    TO_DATE('08-02-19', 'DD-MM-YY'),
    3,
    6,
    2
);

INSERT INTO review VALUES (
    5,
    'Good',
    TO_DATE('08-03-19', 'DD-MM-YY'),
    4,
    7,
    2
);

INSERT INTO review VALUES (
    6,
    'Excellent',
    TO_DATE('08-04-19', 'DD-MM-YY'),
    5,
    8,
    2
);

INSERT INTO review VALUES (
    7,
    'Moderate',
    TO_DATE('16-06-19', 'DD-MM-YY'),
    3,
    1,
    3
);

INSERT INTO review VALUES (
    8,
    'Good',
    TO_DATE('16-07-19', 'DD-MM-YY'),
    4,
    2,
    3
);

INSERT INTO review VALUES (
    9,
    'Excellent',
    TO_DATE('16-08-19', 'DD-MM-YY'),
    5,
    3,
    3
);

INSERT INTO review VALUES (
    13,
    'Moderate',
    TO_DATE('16-06-19', 'DD-MM-YY'),
    3,
    1,
    5
);

INSERT INTO review VALUES (
    14,
    'Good',
    TO_DATE('16-07-19', 'DD-MM-YY'),
    4,
    2,
    5
);

INSERT INTO review VALUES (
    15,
    'Excellent',
    TO_DATE('16-08-19', 'DD-MM-YY'),
    5,
    3,
    5
);

INSERT INTO review VALUES (
    10,
    'Moderate',
    TO_DATE('16-06-19', 'DD-MM-YY'),
    3,
    1,
    4
);

INSERT INTO review VALUES (
    11,
    'Good',
    TO_DATE('16-07-19', 'DD-MM-YY'),
    4,
    2,
    4
);

INSERT INTO review VALUES (
    12,
    'Excellent',
    TO_DATE('16-08-19', 'DD-MM-YY'),
    5,
    3,
    4
);

COMMIT;