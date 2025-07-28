-- Active: 1753686259397@@127.0.0.1@5432@bookdb

SELECT * FROM person2;

ALTER TABLE person2
    ADD COLUMN lest_name VARCHAR(25); --কলাম add

INSERT INTO person2 values(1, 'Ayaan', 'ayaanislam', 'ayaan@gamil.com','Islam')

ALTER TABLE person2
    ADD COLUMN email VARCHAR(25) DEFAULT 'default@gmail.com' NOT NULL; 

ALTER TABLE person2
    DROP COLUMN email;

INSERT INTO person2 values(2, 'Aryan', 'aryaanislam', 'Islam','aryaan@gamil.com')

DELETE FROM person2; --সম্পূর্ণ টেবিল delete

DELETE FROM person2
    WHERE id = 2;  --একটি নির্দিষ্ট row ডিলিট করতে

ALTER TABLE person2
    DROP COLUMN lest_name;

SELECT * FROM person2;

ALTER TABLE person2 
    RENAME COLUMN user_name to lest_name;

ALTER TABLE person2
    DROP COLUMN lest_name;

ALTER TABLE person2
    ADD COLUMN user_name VARCHAR(25);

DELETE FROM person2
    WHERE name = 'John';    --একাধিক row ডিলিট করতে (যেমন name অনুসারে):

ALTER TABLE person2 
    ADD COLUMN age VARCHAR(2);

SELECT * FROM person2 WHERE age IS NULL;

UPDATE person2 
    SET age = 0 WHERE age IS NULL; --NULL value update করে দিতে চাইলে:

ALTER TABLE person2 
    ALTER COLUMN age SET NOT NULL; --ভবিষ্যতে NULL না আসতে চাওলে:

ALTER TABLE person2 
    RENAME COLUMN age to user_age;
ALTER TABLE person2 
    ALTER COLUMN user_name TYPE VARCHAR(50); --varchar(50) change

SELECT * FROM person2;

SELECT * FROM person2 
    WHERE user_name IS NULL;  --user_name কলামে  NULL value আছে কিনা চেক করতে:

UPDATE person2 
    SET user_name = 'ayaanIslam' WHERE user_name IS NULL;  --যদি NULL থাকে, তাহলে আগে ঠিক করে নাও:


SELECT * FROM person2 
    WHERE user_age IS NULL;  --NULL value আছে কিনা চেক করতে:


UPDATE person2 
    SET user_age = 19 WHERE user_age IS NULL;  --NULL value update করে দিতে চাইলে:

ALTER TABLE person2 
    ALTER COLUMN user_age SET NOT NULL;  -- ভবিষ্যতে NULL না আসতে চাওলে:


ALTER TABLE person2
    ALTER COLUMN user_name SET NOT NULL;  --(বা তোমার ইচ্ছামতো কোনো default value দাও: NOT NULL/DEFAULT/UNIQUE) 
ALTER TABLE person2
    ALTER COLUMN user_age SET DEFAULT;
ALTER TABLE person2
    ALTER COLUMN user_age SET UNIQUE;

ALTER TABLE person2
    ALTER COLUMN user_age drop NOT NULL; --delete NOT NULL 

SELECT * FROM person2;

SELECT * FROM person2 
    WHERE first_name IS NULL;

UPDATE person2
    SET lest_name = 'islam' WHERE lest_name IS NULL;

ALTER TABLE person2
    ALTER COLUMN lest_name SET NOT NULL;

ALTER TABLE person2
   ALTER  COLUMN lest_name drop NOT NULL;

SELECT * FROM person2;

ALTER TABLE person2
    ADD COLUMN test_exam VARCHAR(25);

UPDATE person2
    SET test_exam = 'Bangla' WHERE test_exam IS NULL;

ALTER TABLE person2
    ALTER COLUMN test_exam SET NOT NULL;

ALTER TABLE person2
    RENAME user_age to age;

ALTER TABLE person2
    ADD constraint unique_person2_user_age UNIQUE(first_name);

ALTER TABLE person2
    ADD constraint age UNIQUE(age);

ALTER TABLE person2
    DROP constraint age;

DROP TABLE person2;  --folder delete hobe

TRUNCATE TABLE person2; --table takbe but vitore koso takbe na--