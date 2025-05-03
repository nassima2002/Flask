import React from 'react';
import ReactDOM from 'react-dom';
import './App.css';  // Les styles globaux
import App from './App';  // Le composant principal
import { BrowserRouter } from 'react-router-dom';  // Pour React Router

ReactDOM.render(
  <BrowserRouter>
    <App />
  </BrowserRouter>,
  document.getElementById('root')
);
