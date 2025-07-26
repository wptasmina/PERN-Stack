-- npm i pg --- PostgreSQL client for Node.js
-- npm i uuid --- For generating unique IDs
--F5----Refash--

psql -U postgres -d postgres


-- create a new PostgreSQL database named bookApi;
CREATE DATABASE bookApi; --ডাটাবেজ তৈরি করা হয়।--

--NOTE CRUD (ডাটাবেজ নাম চেঞ্জ):  Database (ডাটাবেজ তৈরি, নাম চেঞ্জ(Update) এবং Delete করা) = create, update, delete--
CREATE DATABASE bookApi; ----(1) create
ALTER DATABASE bookApi RENAME TO bookDB; --(2) (Update) নাম চেঞ্জ--
DROP DATABASE bookDB; ---(3) Delete করা|



 \c bookApi;   -- Connect to the bookApi database -এর ভিতরে টেবিল তৈরি করতে হবে।

-- Create the book table 
CREATE TABLE books (
  id UUID PRIMARY KEY,  --or,-- id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  username VARCHAR(50) UNIQUE NOT NULL,
  description VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE,
  comment VARCHAR(255),
  age INTEGER CHECK (age >= 18),
  is_active BOOLEAN,
  dob DATE,
  author VARCHAR(255) NOT NULL
);

--Note (id): id UUID PRIMARY KEY (--Use UUID for unique identifiers)
--or,
--  id SERIAL PRIMARY KEY (id কে অটো-ইনক্রিমেন্ট ইনটিজার রাখতে চাও, তাহলে লিখবে|)
--OR,
--  id VARCHAR(55) PRIMARY KEY (আর যদি id একটি string (text) হয় যেমন: COL-001 তাহলে)


--NOTE: CRUD Table -এর নাম চেঞ্জ:
ALTER TABLE books RENAME TO users; --update
DROP TABLE books; --Delete করা


----- Insert sample data into the book table
INSERT INTO books (id, name, description, author) VALUES
('1', 'Book One', 'This is the first E-book description', 'Author One'),
('2', 'Book Two', 'This is the second E-book description', 'Author Two'),
('3', 'Book Three', 'This is the third book description', 'Author Three');



-- Create the book table Forent key
CREATE TABLE person (
  person_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  user_name VARCHAR(50) NOT NULL UNIQUE,
  email VARCHAR(100) UNIQUE,
  age INTEGER CHECK (age >= 18),
  is_active BOOLEAN DEFAULT true
);

--create table and multipul use:
CREATE TABLE person2 (
  id SERIAL,
  first_name VARCHAR(50) NOT NULL,
  user_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE,
  PRIMARY KEY(id, user_name),  -- id, user_name মিলে হবে প্রাইমারী কী(key)
  UNIQUE(user_name, age)
);

-- Create the book table Foreign key
CREATE TABLE books (
  order_id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers(customer_id) --FK
);

-- Create the book table Default
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  age INTEGER CHECK (age >= 18)
);

-- Create the book table CHECK
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  status BOOLEAN DEFAULT true
);

INSERT INTO person4 (id, user_name, age, email) VALUES
('1', 'John Doe', 25, 'Author One'),
('2', 'Semi deb', 26, 'semi@gmail.com'),
('3', 'BokerThre', 30, 'thre@gmail.com'),
('4', 'Doe John', 25, 'tasmi@gmail.com');

next,
--multtpul data insert:
INSERT INTO person4 VALUES
('5', 'deb Semi', 26, 'deb@gmail.com'),
('6', 'Boker', 30, 'boker@gmail.com');


-- Get all books
SELECT * FROM books;  ----দেখার জন্য। -----

-- Get a specific book by ID
SELECT * FROM books WHERE id = '1'

-- Update a specific book by ID
UPDATE books SET name = 'Updated Book One', description = 'Updated description for book One', author = 'Updated Author One' WHERE id = '1';

--delete a specific book by ID
DELETE FROM books WHERE id = '1';



--🔓 ALL PRIVILEGES মানে কী?
-- এর মানে হলো:
-- SELECT → ডেটা পড়তে পারবে
-- INSERT → ডেটা যোগ করতে পারবে
-- UPDATE → ডেটা আপডেট করতে পারবে
-- DELETE → ডেটা মুছতে পারবে
-- REFERENCES, TRIGGER (এছাড়াও যদি applicable হয়)


-- Connect to PostgreSQL as the default user
--1-- 
psql -U postgres -d postgres
--OR--

--অথবা,
psql -U postgres -d bookApi -- Connect to the bookApi database as the default user postgres -- bookApi ডাটাবেজে ডিফল্ট ইউজার postgres হিসাবে সংযোগ করা হয়।--

-- অথবা,
psql -U postgres -d bookApi -h localhost -- Connect to the bookApi database on localhost as the default user postgres -- bookApi ডাটাবেজে লোকালহোস্টে ডিফল্ট ইউজার postgres হিসাবে সংযোগ করা হয়।--


--2-- Create a new PostgreSQL user named user1 with password 'password123
CREATE USER user1 WITH LOGIN ENCRYPTED PASSWORD '123456'; -- user1 তৈরি করা হয়।--
--OR--
CREATE USER user1 WITH PASSWORD 'password123'; --// user1 তৈরি করা হয়।--

--3--
psql -U user1 -d postgres -- Connect to the database as user1 -- user1 হিসাবে ডাটাবেজে সংযোগ করা হয়।--



-- Grant all privileges on the books table to user1 -- user1 কে books টেবিলের উপর সব অনুমতি দেওয়া হয়েছে।--
GRANT ALL PRIVILEGES ON TABLE books TO user1; -- PRIVILEGES-কে এটা  books নামক টেবিলে tasmina ইউজারকে সকল privilege- SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER--ইত্যাদি) দিবে।


-- user1 কে public স্কিমার সব টেবিলের উপর সব অনুমতি দেওয়া হয়েছে।--
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO tasmina;


-- user1 কে public স্কিমার সব সিকিউরিটি ডিফাইনড ফাংশনের উপর সব অনুমতি দেওয়া হয়েছে।--
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO tasmina; -- user


--ℹ️ আরও কিছু দরকার হলে: শুধু future টেবিলগুলোর privileges দিতে চাইলে, আলাদা করে করতে হয় (default privileges):
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO tasmina;


-- user1 কে public স্কিমার সব সিকিউরিটি ডিফাইনড ফাংশনের উপর সব অনুমতি দেওয়া হয়েছে।--
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO tasmina;


-- Grant SELECT permission on the books table to user1
GRANT SELECT ON TABLE books TO user1; --GRANT করতে হলে মেইন Table থেকে পারমিশন দিতে হয় হয়। user1 কে books টেবিল থেকে ডেটা দেখতে পারবে। --


--- user1 কে public স্কিমার সব টেবিলের উপর SELECT ->(শুধু দেখার জন্য।) পারমিশন/অনুমতি দেওয়া হয়েছে।--
GRANT SELECT ON ALL TABLES IN SCHEMA public TO role1; 


--🧪 যদি ৩ জনকেই দিতে চাও:
GRANT SELECT ON ALL TABLES IN SCHEMA public TO user1, user2, tasmina; --এটা দিয়ে ৩ জনকেই public স্কিমার সব টেবিলের উপর SELECT পারমিশন/অনুমতি দেওয়া হয়েছে।


--user3 কে role1 রোল এর অনুমতি দেওয়া হয়েছে। --
GRANT role1 TO user3;  

\dp books --এটা চালিয়ে চেক করতে পারো tasmina এখন books টেবিলে কী কী privilege পেয়েছে।


-- user1 কে books টেবিল থেকে ডেটা দেখতে পারবে না। --
REVOKE SELECT ON TABLE books FROM user1; --REVOKE করতে হলে মেইন Table থেকে করতে হয়।-






--প্রয়োজনে জানতে চাইলে বলতে পারেন:
--> কে কোন privilege পেয়েছে → \z books
--> টেবিলের owner কে → \dt+ books
-- টেবিলের owner কে → \d books
--> টেবিলের schema কে → \dn
-- টেবিলের schema কে → \dn+
--> টেবিলের schema কে → SELECT nspname FROM pg_namespace;
-- টেবিলের schema কে → SELECT * FROM information_schema.schemata;
-- টেবিলের schema কে → SELECT * FROM pg_tables WHERE schemaname = 'public';
-- টেবিলের schema কে → SELECT * FROM pg_catalog.pg_tables WHERE schemaname = 'public';
-- টেবিলের schema কে → SELECT * FROM pg_namespace;
-- টেবিলের schema কে → SELECT * FROM pg_namespace WHERE nspname = 'public';
-- টেবিলের schema কে → SELECT * FROM pg_roles;