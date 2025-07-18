CREATE DATABASE book_db;
\c book_db;

-- Create the book table-  টেবিল এর ভিতরে তৈরি করতে হবে।
CREATE TABLE book (
  id UUID PRIMARY KEY,  -- Use UUID for unique identifiers
  name VARCHAR(25),
  description VARCHAR(255),
  author VARCHAR(255) NOT NULL
);

-- Insert sample data into the book table -এটি Terminal এ দিতে হয় না।
INSERT INTO book (id, name, description, author) VALUES
 ('1', 'Book One', 'Description of Book One', 'Author One'),
 ('2', 'Book Two', 'Description of Book Two', 'Author Two'),
 ('3', 'Book Three', 'Description of Book Three', 'Author Three');

-- Query to select all books from the book table -এটি Terminal এ দিতে হয় না।
 SELECT * FROM book

-- This will select the specifac  book with id 1
  SELECT * FROM book WHERE id = '1'; 

-- update the book with id 1
UPDATE book SET name = 'Updated Book One', description = 'Updated Description of Book One', author = 'Updated Author One' WHERE id = '1'; -- This will update the book with id 1

 -- delete from book where id = '1'; -- This will delete the book with id 1
 DELETE FROM book WHERE id = '1'; -- This will delete the book with id 1