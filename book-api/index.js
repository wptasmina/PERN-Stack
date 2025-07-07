const express = require("express")
const app = express()
const PORT = 5000


//middleware
app.use(express.json())  //must lagbe
app.use(express.urlencoded({extended: true}))

app.listen(PORT, ()=>{
    console.log(`Server is running at http://localhost:${PORT}`);
    
})

//GET/books  -> return all the books
app.get("/books", async (req, res) => {
    try {
        res.status(200).json({ message: "Return all the books" });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

//GET/books/:id   -> return a Specific book
app.get("/books/:id", async(req, res)=>{
    try {
        const {id} = req.params;
        res.status(200).json({message: `Specific book id: ${id}`})
    } catch (error) {
        res.status(500).json({error: error.message})
    }
})

//POST/books  -> Create a book
app.post("/books", (req, res)=>{
    try {
        const {name, description} = req.body
        res.status(201).json({message: `create a new book ${name}, ${description}`})
    } catch (error) {
        res.status(500).json({error: error.message})
    }
})

//Delete/books/:id  -> delete a book
app.delete("/books/:id", async(req, res)=>{
    try {
        const {id} = req.params
        res.status(200).json({message: `Specific book delete id: ${id}`})
    } catch (error) {
        res.status(500).json({error: error.message})
    }
})

//PUT/books/:id  -> Update a book
app.put("/books/:id", async(req, res)=>{
    try {
        const {id} = req.params
        const {name, description} = req.body
        res.status(200).json({message: `Specific book Updated id: ${id}`})
    } catch (error) {
        res.status(500).json({error: error.message})
    }
})

//PUT/books/:id  -> Update a book

