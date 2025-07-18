
const express = require('express') //npm install express
const { v4: uuidv4 } = require('uuid'); //npm install uuid
const pool = require('./db'); // Import the database connection

// const bodyParser = require('body-parser') //npm install body-parser
// const cors = require('cors') //npm install cors

const app = express()

const PORT = process.env.PORT || 5000


// Middleware to parse JSON bodies
app.use(express.json())
app.use(express.urlencoded({ extended: true })) // middleware to form data url- unencoded

//GET/books => Get all books
app.get('/books', async (req, res) => {
    try {
        res.status(200).json({message: 'List of all books'})
    } catch (error) {
        res.status(500).json({ message: 'Server Error'})
    }
})

//POST/books => Add a new book //pool requires a connection to the database
 app.post  ('/books', async (req, res) => {
     try {
         const { name, description, author} = req.body
         const id = uuidv4(); // Generate a unique ID for the book
         // Insert the new book into the database
         const newBook = await pool.query(
             'INSERT INTO book (id, name, description, author) VALUES ($1, $2, $3, $4) RETURNING *',
             [id, name, description, author])

        res.status(201).json({ message: `Book added successfully`, data: newBook.rows[0]})
        // res.status(201).json({ message: 'Book added successfully', book: req.body})
        console.log(req.body)
    } catch (error) {
        // res.status(500).json({ message: 'Server Error'})
        res.json({ error: error.message }) // Return the error message
        // console.error('Error adding book:', error.message) // Log the error message
    }
 })

//GET/books/:id => Get details of a specific book by ID
 app.get('/books/:id', async (req, res) => {
    const {id} = req.params
    try {
        res.status(200).json({ message: `Details of book with ID: ${id}`})
    } catch (error) {
        res.status(500).json({ message: 'Server Error'})
    }
 })

//  app.get('/books/:id', async (req, res) => {
//     const bookId = req.params.id
//     try {
//         res.status(200).json({ message: `Details of book with ID ${bookId}`})
//     } catch (error) {
//         res.status(500).json({ message: 'Server Error'})
//     }
//  })

 //PUT/books/:id => Update a specific book by ID
    app.put('/books/:id', async (req, res) => {
        try {
            const {id} = req.params
            const { name, description } = req.body
            res.status(200).json({ message: `Book with ID:${id} updated successfully ${name}, ${description}`})
        } catch (error) {
            res.status(500).json({ message: 'Server Error'})
        }
    })

    // app.put('/books/:id', async (req, res) => {
    //     const bookId = req.params.id
    //     try {
    //         res.status(200).json({ message: `Book with ID: ${bookId} updated successfully`, book: req.body})
    //     } catch (error) {
    //         res.status(500).json({ message: 'Server Error'})
    //     }
    // })

//DELETE/books/:id => Delete a specific book by ID
    app.delete('/books/:id', async (req, res) => {
        const {id} = req.params
        try {
            res.status(200).json({ message: `Book with ID:${id} deleted successfully`})
        } catch (error) {
            res.status(500).json({ message: 'Server Error'})
        }
    })

    // app.delete('/books/:id', async (req, res) => {
    //     const bookId = req.params.id
    //     try {
    //         res.status(200).json({ message: `Book with ID: ${bookId} deleted successfully`})
    //     } catch (error) {
    //         res.status(500).json({ message: 'Server Error'})
    //     }
    // })


app.listen(PORT, ()=> {
    console.log(`Server is running on port ${PORT}`)
})
