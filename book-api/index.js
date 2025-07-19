
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
        const allBooks = await pool.query('SELECT * FROM books'); // Query to get all books from the database
        res.status(200).json({message: `SELECT List of all books successfully retrieved`, data: allBooks.rows})
    } catch (error) {
        res.status(500).json({ message: 'Server Error'})
    }
})

//POST/books => Add a new book //pool requires a connection to the database
 app.post  ('/books', async (req, res) => {
     try {
        const { name, description, author} = req.body
        const id = uuidv4() // Generate a unique ID for the book
        // Insert the new book into the database
        const newBook =await pool.query(
            'INSERT INTO books (id, name, description, author) VALUES ($1, $2, $3, $4) RETURNING *',
            [id, name, description, author]
        )
        res.status(201).json({ message: `Book added successfully`,data: newBook.rows[0]})
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
     try {
        const { id } = req.params
        // Query to get the book by ID from the database
        const book = await pool.query('SELECT * FROM books WHERE id = $1', [id]);
        res.status(200).json({ message: `Details of book with ID`, data: book.rows})
    } catch (error) {
        res.status(500).json({ error: error.message })
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
            const { id } = req.params
            const { name, description, author } = req.body

            // Query to update the book in the database
            const updatedBook = await pool.query(
                'UPDATE books SET name = $1, description =$2, author = $3 WHERE id = $4 RETURNING *',
                [name, description, author, id]
            )
                res.status(200).json({ message: `updated Book successfully`, data: updatedBook.rows[0]})
            } catch (error) {
                res.status(500).json({ error: error.message })
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
        try {
            const {id} = req.params
            // Query to specific delete the book from the database
            await pool.query('DELETE FROM books WHERE id = $1', [id]);
            res.status(200).json({ message: `Book with deleted successfully`, data: { id }})
        } catch (error) {
            res.status(500).json({ error: error.message })
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
