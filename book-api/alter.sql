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

UPDATE person2 SET age = 0 WHERE age IS NULL; --NULL value update করে দিতে চাইলে:

ALTER TABLE person2 ALTER COLUMN age SET NOT NULL; --ভবিষ্যতে NULL না আসতে চাওলে:
