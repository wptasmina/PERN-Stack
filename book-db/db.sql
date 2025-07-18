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