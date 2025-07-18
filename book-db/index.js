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
        res.status(200).json({message: "fetched all books successfully"})
    } catch (error) {
        res.status(500).json({message: "Error fetching books", error: error.message })
    }
 })

//POST/books => Add a new book
 app.post("/books", async (req, res) =>{
    try {
       const newBook = req.body; 
       const id = uuidv4(); // Generate a unique ID for the book
    //    newBook.id = id; // Assign the generated ID to the new book

    const newBook1 = await pool.query(
        'INSERT INTO book (id, name, description, author) VALUES ($1,$2, $3, $4) RETURNING *',
        [id, newBook.name, newBook.description, newBook.author] 
    ) 

       res.status(201).json({message: `Book added successfully`, book: newBook})

    } catch (error) {
        res.status(500).json({message: "Error adding book", error: error.message})
    }
 })

//GET/books/:id => Get a book by ID
app.get('/books/:id', async (req, res) => {
  const { id } = req.params;
  try {
    res.status(200).json({ message: `Details of book with ID: ${id} successfully`});
  } catch (error) {
    res.status(500).json({ message: "Error fetching book", error: error.message });
  }
});


//PUT/books/:id => Update a book by ID
 app.put('/books/:id', async (req, res) => {
    const { id } = req.params;
    const updateBook = req.body;
    try {
        res.status(200).json({message: `Book with ID: ${id} updated successfully`, book: updateBook})
    } catch (error) {
        res.status(500).json({ message: "Error updating book", error: error.message });
    }
 })

//DELETE/books/:id => Delete a book by ID


//listen for requests on port 3000  Start the server
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
})
