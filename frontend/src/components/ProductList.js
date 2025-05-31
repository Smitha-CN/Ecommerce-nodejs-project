import React, { useEffect, useState } from 'react';
import axios from 'axios';

function ProductList() {
  const [products, setProducts] = useState([]);

  useEffect(() => {
    axios.get('http://99.79.72.41:5000/api/products')
      .then(res => setProducts(res.data))
      .catch(err => console.error(err));
  }, []);

  const containerStyle = {
    padding: '40px',
    textAlign: 'center',
    fontFamily: 'Arial, sans-serif'
  };

  const gridStyle = {
    display: 'grid',
    gridTemplateColumns: 'repeat(auto-fill, minmax(220px, 1fr))',
    gap: '30px',
    marginTop: '20px'
  };

  const cardStyle = {
    border: '1px solid #ddd',
    borderRadius: '10px',
    padding: '20px',
    background: '#fff',
    transition: 'box-shadow 0.3s ease'
  };

  const imageStyle = {
    maxWidth: '100%',
    height: '150px',
    objectFit: 'contain',
    marginBottom: '15px'
  };

  const buttonStyle = {
    backgroundColor: '#0070f3',
    color: '#fff',
    border: 'none',
    padding: '10px 20px',
    borderRadius: '5px',
    cursor: 'pointer'
  };

  return (
    <div style={containerStyle}>
      <h2>Our Products</h2>
      <div style={gridStyle}>
        {products.map(p => (
          <div key={p.id} style={cardStyle}>
            <img src={p.image_url} alt={p.name} style={imageStyle} />
            <h3>{p.name}</h3>
            <p>${p.price}</p>
            <button style={buttonStyle}>Add to Cart</button>
          </div>
        ))}
      </div>
    </div>
  );
}

export default ProductList;
