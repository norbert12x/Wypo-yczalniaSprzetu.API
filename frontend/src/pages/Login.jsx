import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import './Login.css';

function Login() {
  const [email, setEmail] = useState('');
  const [haslo, setHaslo] = useState('');
  const [errorMessage, setErrorMessage] = useState('');
  const navigate = useNavigate();

  useEffect(() => {
    if (localStorage.getItem('loggedIn')) {
      navigate('/');
    }
  }, [navigate]);

  const handleSubmit = async (event) => {
    event.preventDefault();
    setErrorMessage('');
    
    try {
      const response = await fetch('https://localhost:7065/api/account/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ email, haslo }),
      });

      if (response.ok) {
        const data = await response.json();
        const receivedToken = data.token;  

        localStorage.setItem('authToken', receivedToken);
        localStorage.setItem('loggedIn', true);
        localStorage.setItem('userEmail', email);
        navigate('/');
      } else {
        const error = await response.text();
        setErrorMessage(error || 'Błąd logowania');
      }
    } catch (err) {
      setErrorMessage('Błąd połączenia z serwerem');
    }
  };

  return (
    <div className="login">
      <h2>Logowanie</h2>
      <form onSubmit={handleSubmit}>
        <div className="input-group">
          <label>Email:</label>
          <input
            type="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
          />
        </div>
        <div className="input-group">
          <label>Hasło:</label>
          <input
            type="password"
            value={haslo}
            onChange={(e) => setHaslo(e.target.value)}
            required
          />
        </div>
        <p className="register-link">
          Nie masz konta? <span onClick={() => navigate('/register')}>Zarejestruj się</span>
        </p>

        {errorMessage && <div className="error">{errorMessage}</div>}
        <button type="submit">Zaloguj</button>
      </form>
    </div>
  );
}

export default Login;
