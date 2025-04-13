import React from 'react';

const SignupPage = () => {
  return (
    <div>
      <h1>Inscription</h1>
      <form>
        <label>Nom :</label>
        <input type="text" placeholder="Entrez votre nom" />
        <br />
        <label>Email :</label>
        <input type="email" placeholder="Entrez votre email" />
        <br />
        <button type="submit">S'inscrire</button>
      </form>
    </div>
  );
};

export default SignupPage;
