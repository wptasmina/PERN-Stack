-- npm i pg --- PostgreSQL client for Node.js
-- npm i uuid --- For generating unique IDs


-- create a new PostgreSQL database named bookApi;
CREATE DATABASE bookApi; --ডাটাবেজ তৈরি করা হয়।--

 \c bookApi;   -- Connect to the bookApi database -এর ভিতরে টেবিল তৈরি করতে হবে।

-- Create the book table 
CREATE TABLE books (
  id UUID PRIMARY KEY,  -- Use UUID for unique identifiers--  or  id VARCHAR(255) PRIMARY KEY,
  name VARCHAR(25),
  description VARCHAR(255),
  author VARCHAR(255) NOT NULL
);

----- Insert sample data into the book table
INSERT INTO books (id, name, description, author) VALUES
('1', 'Book One', 'This is the first E-book description', 'Author One'),
('2', 'Book Two', 'This is the second E-book description', 'Author Two'),
('3', 'Book Three', 'This is the third book description', 'Author Three');


-- Get all books
SELECT * FROM books;

-- Get a specific book by ID
SELECT * FROM books WHERE id = '1'

-- Update a specific book by ID
UPDATE books SET name = 'Updated Book One', description = 'Updated description for book One', author = 'Updated Author One' WHERE id = '1';

--delete a specific book by ID
DELETE FROM books WHERE id = '1';