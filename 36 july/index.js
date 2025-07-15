const express = require("express")

const app = express()
const PORT = 5000


app.listen(PORT, ()=>{
console.log(`server is running ${PORT}`);
})

// GET/books/ ->
// POST/books/ ->
// GET/books/:id ->
// Delete/books/:id ->
// PUT /books/:id ->

app.get("/book-api", async(req, res)=>{
    try {
        res.status(200).json({message: "Return all books"})
    } catch (error) {
    //    res.json(500)
    res.status(500).json({error: error.message}) 
    }
})