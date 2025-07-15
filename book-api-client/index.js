const express = require("express")

const app = express()
const PORT = 5000

// Middleware to parse JSON bodies
app.use(express.json())// Middleware to parse URL-encoded bodies
app.use(express.urlencoded({ extended: true })) // Middleware to form data URL-urlencoded support


app.listen(PORT, ()=>{
console.log(`server is running ${PORT}`);
})

// GET/books/ ->
// POST/books/ ->
// GET/books/:id ->
// PUT /books/:id ->
// Delete/books/:id ->

app.get("/book-api", async(req, res)=>{
    try {
        res.status(200).json({message: "Return all books"})
    } catch (error) {
    //    res.json(500)
    res.status(500).json({error: error.message}) 
    }
})