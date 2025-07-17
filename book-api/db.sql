CREATE DATABASE bookApi;

-- npm i pg --- PostgreSQL client for Node.js
-- npm i uuid --- For generating unique IDs


CREATE TABLE book (
  id UUID PRIMARY KEY,  -- Use UUID for unique identifiers--  or,  id VARCHAR(255) PRIMARY KEY,
  name VARCHAR(25),
  description VARCHAR(255),
  author VARCHAR(255) NOT NULL
);

INSERT INTO book (id, name, description, author) VALUES
('1', 'Book One', 'This is the first E-book description', 'Author One'),
('2', 'Book Two', 'This is the second E-book description', 'Author Two'),
('3', 'Book Three', 'This is the third book description', 'Author Three');
