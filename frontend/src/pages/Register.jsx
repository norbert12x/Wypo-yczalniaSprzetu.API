import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import './Login.css'; // używamy tych samych stylów co logowanie

function Register() {
  const [formData, setFormData] = useState({
    imie: '',
    nazwisko: '',
    email: '',
    telefon: '',
    haslo: ''
  });

  const [errorMessage, setErrorMessage] = useState('');
  const [successMessage, setSuccessMessage] = useState('');
  const navigate = useNavigate();

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setErrorMessage('');
    setSuccessMessage('');

    try {
      const response = await fetch('https://localhost:7065/api/account/register', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData),
      });

      if (response.ok) {
        const data = await response.json();
        setSuccessMessage(data.message || 'Rejestracja zakończona sukcesem!');
        setTimeout(() => navigate('/login'), 2000); // przekierowanie po 2 sek
      } else {
        const error = await response.text();
        setErrorMessage(error || 'Błąd podczas rejestracji');
      }
    } catch (err) {
      setErrorMessage('Błąd połączenia z serwerem');
    }
  };

  return (
    <div className="login">
      <h2>Rejestracja</h2>
      <form onSubmit={handleSubmit}>
        <div className="input-group">
          <label>Imię:</label>
          <input
            type="text"
            name="imie"
            value={formData.imie}
            onChange={handleChange}
            required
          />
        </div>
        <div className="input-group">
          <label>Nazwisko:</label>
          <input
            type="text"
            name="nazwisko"
            value={formData.nazwisko}
            onChange={handleChange}
            required
          />
        </div>
        <div className="input-group">
          <label>Email:</label>
          <input
            type="email"
            name="email"
            value={formData.email}
            onChange={handleChange}
            required
          />
        </div>
        <div className="input-group">
          <label>Telefon:</label>
          <input
            type="text"
            name="telefon"
            value={formData.telefon}
            onChange={handleChange}
            required
          />
        </div>
        <div className="input-group">
          <label>Hasło:</label>
          <input
            type="password"
            name="haslo"
            value={formData.haslo}
            onChange={handleChange}
            required
          />
        </div>

        {errorMessage && <div className="error">{errorMessage}</div>}
        {successMessage && <div className="success">{successMessage}</div>}

        <button type="submit">Zarejestruj się</button>

        <p className="register-link">
          Masz już konto? <span onClick={() => navigate('/login')}>Zaloguj się</span>
        </p>
      </form>
    </div>
  );
}

export default Register;
