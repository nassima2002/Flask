import React from 'react';
import { Link } from 'react-router-dom';  // Si tu veux utiliser React Router pour la navigation

const HomePage = () => {
  return (
    <div>
      {/* Navbar */}
      <nav className="navbar">
        <div className="container">
          <a href="#" className="navbar-brand">DEVOPS</a>
          <ul className="navbar-nav">
            <li><a href="#home">Accueil</a></li>
            <li><a href="#services">Services</a></li>
            <li><Link to="/signup">Inscription</Link></li>
          </ul>
        </div>
      </nav>

      {/* Hero Section */}
      <header id="home" className="hero-section">
        <div className="container">
          <h1>Bienvenue sur notre site web</h1>
          <p>Découvrez nos services et apprenez-en plus sur nous.</p>
          <a href="#services" className="btn">Nos Services</a>
        </div>
      </header>
    </div>
  );
};

export default HomePage;
