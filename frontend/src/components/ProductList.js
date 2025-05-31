import React, { useEffect, useState } from 'react';
import axios from 'axios';

function ProductList() {
  const [products, setProducts] = useState([]);

  useEffect(() => {
   axios.get("http://99.79.72.41:5000/api/products") // proxy to backend
      .then(res => setProducts(res.data))
      .catch(err => console.error(err));
  }, []);

  return (
    <div>
      <h2>Product List</h2>
      <ul>
        {products.map(p => (
          <li key={p.id}>
            <img
              src={p.image_url}
              alt={p.name}
              style={{ width: '100px', height: '100px', objectFit: 'cover' }}
            />
            <br />
            {p.name} - ${p.price}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default ProductList;
