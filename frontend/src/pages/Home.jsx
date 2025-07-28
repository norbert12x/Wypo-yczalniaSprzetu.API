import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import './Home.css';

function Home() {
  const [categories, setCategories] = useState([]);
  const navigate = useNavigate();

  useEffect(() => {
    // Sprawdź, czy użytkownik jest zalogowany
    if (!localStorage.getItem('loggedIn')) {
      // Jeśli nie jest zalogowany, przekieruj go do logowania
      navigate('/login');
    }

    // Pobierz kategorie sprzętu
    axios
      .get('https://localhost:7065/api/KategorieSprzetu')
      .then((response) => {
        const filteredCategories = response.data.$values.map((category) => ({
          id: category.id,
          nazwa: category.nazwa,
        }));
        setCategories(filteredCategories);
      })
      .catch((error) => {
        console.error("Błąd podczas pobierania kategorii:", error);
      });
  }, [navigate]);

  return (
    <div className="home">
      <div className="header">
        <h1 className="store-name" onClick={() => navigate('/')}>
          SportZone
        </h1>
        <div className="header-buttons">
          <a href="/profil" className="profile-button">
            Profil
          </a>
          <button
            className="logout-button"
            onClick={() => {
              localStorage.removeItem('loggedIn');
              navigate('/login');
            }}
          >
            Wyloguj
          </button>
        </div>
      </div>
      <div className="category-list">
        {categories.map((category) => (
          <a
            key={category.id}
            href={`/sprzety/${category.id}`}
            className="category-card"
            style={{
              backgroundImage: `url('/images/${category.nazwa.toLowerCase().replace(' ', '_')}.jpg')`,
            }}
          >
            <h2>{category.nazwa}</h2>
          </a>
        ))}
      </div>
    </div>
  );
}

export default Home;
