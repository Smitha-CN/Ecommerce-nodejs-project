const express = require("express");
const cors = require("cors");
require("dotenv").config();

const app = express();
app.use(cors());
app.use(express.json());

const PORT = process.env.PORT || 5000;

app.get("/api/products", (req, res) => {
  res.json([
    { id: 1, name: "Laptop", price: 999 },
    { id: 2, name: "Headphones", price: 199 },
    { id: 3, name: "Phone", price: 799 }
  ]);
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
