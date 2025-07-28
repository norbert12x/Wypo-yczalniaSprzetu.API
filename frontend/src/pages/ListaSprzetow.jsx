import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { useParams, Link } from 'react-router-dom';
import './ListaSprzetow.css';

function ListaSprzetow() {
  const { categoryId } = useParams();
  const [equipment, setEquipment] = useState([]);
  const [categoryName, setCategoryName] = useState('');  // Nowy stan do przechowywania nazwy kategorii

  useEffect(() => {
    // Pobierz sprzęt z danej kategorii
    const url = `https://localhost:7065/api/Sprzet/kategoria/${categoryId}`;

    axios
      .get(url)
      .then((response) => {
        setEquipment(response.data.$values);
      })
      .catch((error) => {
        console.error("Błąd podczas pobierania sprzętów:", error);
      });

    // Pobierz nazwę kategorii
    const categoryUrl = `https://localhost:7065/api/KategorieSprzetu/${categoryId}`;
    axios
      .get(categoryUrl)
      .then((response) => {
        setCategoryName(response.data.nazwa);  // Zakładamy, że odpowiedź zawiera pole 'nazwa'
      })
      .catch((error) => {
        console.error("Błąd podczas pobierania nazwy kategorii:", error);
      });
  }, [categoryId]);

  // Funkcja do generowania ścieżki do zdjęcia
  const generateImagePath = (name) => {
    return `/images/${name.toLowerCase().replace(" ", "_")}.jpg`;
  };

  return (
    <div className="equipment-page">
      <div className="header">
        <Link to="/" className="store-name">SportZone</Link>
        <div className="header-buttons">
          <Link to="/profil" className="profile-button">Profil</Link>
          <button 
            className="logout-button" 
            onClick={() => {
              localStorage.removeItem('loggedIn');
              window.location.href = '/login'; // Wylogowanie i przekierowanie na login
            }}
          >
            Wyloguj
          </button>
          <Link to={`/`} className="back-button">Powrót</Link>
        </div>
      </div>

      {/* Nagłówek z nazwą kategorii */}
      <h1 className="category-header">{categoryName}</h1>

      <div className="equipment-list">
        {equipment.length > 0 ? (
          equipment.map((item) => (
            <Link
              key={item.id}
              to={`/sprzet/${item.id}`}
              className="equipment-item"
            >
              {/* Używamy tej samej funkcji generateImagePath */}
              <img
                src={generateImagePath(item.nazwa)}
                alt={item.nazwa}
                className="equipment-image"
              />
              <div className="equipment-info">
                <h2>{item.nazwa}</h2>
                <p>Cena: {item.cena ? `${item.cena} PLN` : 'Brak ceny'}</p>
              </div>
            </Link>
          ))
        ) : (
          <p>Brak sprzętu w tej kategorii.</p>
        )}
      </div>
    </div>
  );
}

export default ListaSprzetow;
