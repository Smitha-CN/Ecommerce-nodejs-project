const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');

dotenv.config(); // Load .env file

const app = express();
const port = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json());

// Routes
const productsRouter = require('./routes/products');
app.use('/api/products', productsRouter);

// Root route
app.get('/', (req, res) => {
  res.send('E-Commerce Backend API is running...');
});

// Start server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
