const express = require("express")
const app = express()
const PORT = 5000


app.listen(PORT, ()=>{
    console.log(`Server is running at http://localhost:${PORT}`);
    
})

//GET/books  -> return all the books
//POST/books  -> Create a book
//GET/books/:id   -> return a Specific book
//Delete/books/:id  -> delete a book
//PUT/books/:id  -> Update a book

app.get("/books", async (req, res) => {
    try {
        res.status(200).json({ message: "Return all the books" });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});
