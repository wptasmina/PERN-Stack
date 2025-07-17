const express = require("express")
const pool = require('./db')
const { v4: uuidv4 } = require('uuid'); // Import uuid for generating unique IDs
const app = express()
const PORT = 5000

// Middleware to parse JSON bodies
app.use(express.json())// Middleware to parse URL-encoded bodies
app.use(express.urlencoded({ extended: true })) // Middleware to form data URL-urlencoded support



// GET/books/ ->
// POST/books/ ->
// GET/books/:id ->
// PUT /books/:id ->
// Delete/books/:id ->

//GET/books => Get all books
app.get("/book-api", async(req, res)=>{
    try {
        res.status(200).json({message: "Get all books (Return all books in the database)"})
    } catch (error) {
    //    res.json(500)
    res.status(500).json({error: error.message}) 
    }
})

//POST/books => Add a new book
 app.post("/book-api", async(req, res) =>{
    try {
        const { name, description, author } = req.body
        const id = uuidv4() // Generate a unique ID for the book
        // Insert the new book into the database
        const newBook = await pool.query(
            'INSERT INTO books (id, name, description, author) VALUES ($1, $2, $3, $4) RETURNING *',
            [ id, name, description, author ]
        )
        res.status(201).json({ message: `Book added successfully`, data: newBook.rows[0]})
    } catch (error) {
        res.status(500).json({error: error.message})
    }
 })

//GET/books/:id => Get a book by ID
 app.get("/book-api/:id", async(req, res) =>{
    try {
        const { id } =req.params
        res.status(200).json({message: `Get book with ID: ${id}`})
    } catch (error) {
        res.status(500).json({error: error.message}) 
    }
 })

//PUT/books/:id => Update a book by ID
  app.put("/book-api/:id", async(req, res) =>{
    try {
        const { id} = req.params
        const { name, description, author} = req.body
        res.status(200).json({message: `Book with ID: ${id} updated successfully ${name}, ${description}, ${author}`})
    } catch (error) {
        res.status(500).json({error: error.message})
    }
  })

//DELETE/books/:id => Delete a book by ID
  app.delete("/book-api/:id", async(req, res) =>{
    const {id } = req.params
    try {
        res.status(200).json({message: `Book with ID: ${id} deleted successfully`})
    } catch (error) {
        res.status(500).json({error: error.message})
    }
  })


// Start the server
app.listen(PORT, ()=>{
console.log(`server is running ${PORT}`);
})
