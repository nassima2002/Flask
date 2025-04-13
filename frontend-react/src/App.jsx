import React from 'react';
import { Route, Routes } from 'react-router-dom';
import HomePage from './components/HomePage';  // Page d'accueil
import SignupPage from './components/SignupPage';  // Page d'inscription

const App = () => {
  return (
    <Routes>
      <Route path="/" element={<HomePage />} />
      <Route path="/signup" element={<SignupPage />} />
    </Routes>
  );
};

export default App;
