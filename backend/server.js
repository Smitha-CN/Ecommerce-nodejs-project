const express = require('express');
const cors = require('cors');
const app = express();
const port = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

// Routes
const productsRouter = require('./routes/products.js');
app.use('/api/products', productsRouter);

app.get('/', (req, res) => {
  res.send('E-Commerce Backend API');
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
