const express = require('express');
const pool = require('./db'); // Import the database pool from db.js
const { v4: uuidv4 } = require('uuid');
const app = express();

const PORT = 3000;

// Middleware to parse JSON bodies
app.use(express.json());





// GET/books/ ->
// POST/books/ ->
// GET/books/:id ->
// PUT /books/:id ->
// Delete/books/:id ->

//GET/books => Get all books
 app.get("/books", async (req, res) =>{
    try {
        const books = await pool.query('SELECT * FROM book')
        res.status(200).json({message: "fetched all books successfully", book: books.rows });
    } catch (error) {
        res.status(500).json({message: "Error fetching books", error: error.message })
    }
 })

//POST/books => Add a new book
 app.post("/books", async (req, res) =>{
    try {
       const { name, description, author } = req.body;
       const id = uuidv4(); // Generate a unique ID for the book
    //    newBook.id = id; // Assign the generated ID to the new book

    const result = await pool.query(
        'INSERT INTO book (id, name, description, author) VALUES ($1,$2, $3, $4) RETURNING *',
        [id, name, description, author] 
    ) 

       res.status(201).json({message: `Book added successfully`, book: result.rows[0]})

    } catch (error) {
        res.status(500).json({message: "Error adding book", error: error.message})
    }
 })

//GET/books/:id => Get a book by ID
app.get('/books/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const result = await pool.query('SELECT * FROM book WHERE id = $1', [id])
    res.status(200).json({ message: `Details of book with successfully`, book: result.rows[0] });
  } catch (error) {
    res.status(500).json({ message: "Error fetching book", error: error.message });
  }
});


//PUT/books/:id => Update a book by ID
 app.put('/books/:id', async (req, res) => {
    const { id } = req.params;
    const { name, description, author } = req.body;
    try {
        const updatedBook = await pool.query(
            "UPDATE book SET name = $1, description = $2, author = $3 WHERE id = $4 RETURNING *",
            [name, description, author, id]
        )

    res.status(200).json({ message: "Book updated successfully", data: updatedBook.rows[0] });
    } catch (error) {
        res.status(500).json({ message: "Error updating book", error: error.message });
    }
 })





//DELETE/books/:id => Delete a book by ID
// app.delete('/books/:id', async (req, res) => {
//   const { id } = req.params;
//   try {
//     const result = await pool.query('DELETE FROM book WHERE id = $1 RETURNING *', [id]);

//     if (result.rowCount === 0) {
//       return res.status(404).json({ message: `No book found with ID: ${id}` });
//     }

//     res.status(200).json({ message: `Book deleted successfully`, deletedBook: result.rows[0] });
//   } catch (error) {
//     res.status(500).json({ message: "Error deleting book", error: error.message });
//   }
// });
app.delete('/books/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const result = await pool.query('DELETE FROM book WHERE id = $1', [id]);

    if (result.rowCount === 0) {
      return res.status(404).json({ message: `No book found with ID: ${id}` });
     }
    res.status(200).json({ message: `Book deleted successfully with`, deletedBook: result.rows[0] });
  } catch (error) {
    res.status(500).json({ message: "Error deleting book", error: error.message });
  }
});


//listen for requests on port 3000  Start the server
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
})
