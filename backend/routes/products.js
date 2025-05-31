const express = require('express');
const router = express.Router();
const db = require('../db');

router.get('/', (req, res) => {
  db.query('SELECT * FROM products', (err, results) => {
    if (err) {
      console.error('DB error:', err);
      return res.status(500).json({ error: 'DB failed' });
    }
    res.json(results);
  });
});

module.exports = router;
