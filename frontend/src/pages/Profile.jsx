import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import './Profile.css';

function Profile() {
  const [userData, setUserData] = useState(null);
  const [errorMessage, setErrorMessage] = useState('');
  const [loading, setLoading] = useState(true);
  const [sprzety, setSprzety] = useState({}); // Mapowanie sprzetId na nazwy
  const navigate = useNavigate();

  useEffect(() => {
    const fetchUserData = async () => {
      const token = localStorage.getItem('authToken');
      if (!token) {
        setErrorMessage('Brak tokena, użytkownik nie jest zalogowany.');
        setLoading(false);
        return;
      }

      try {
        const response = await fetch('https://localhost:7065/api/account/profile', {
          method: 'GET',
          headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${token}`,
          },
        });

        if (response.ok) {
          const data = await response.json();
          setUserData(data);
          fetchSprzety(data.wypozyczenia.$values); // Fetch sprzety na podstawie wypożyczeń
        } else {
          setErrorMessage('Nie udało się pobrać danych użytkownika.');
        }
      } catch (error) {
        setErrorMessage('Błąd połączenia z serwerem.');
      } finally {
        setLoading(false);
      }
    };

    const fetchSprzety = async (wypozyczenia) => {
      const sprzetyMap = {};
      for (const wyp of wypozyczenia) {
        const sprzetId = wyp.sprzetId;
        if (!sprzetyMap[sprzetId]) {
          try {
            const response = await fetch(`https://localhost:7065/api/Sprzet/${sprzetId}`);
            if (response.ok) {
              const sprzetData = await response.json();
              sprzetyMap[sprzetId] = sprzetData.nazwa;
            }
          } catch (error) {
            console.error(`Błąd pobierania sprzętu o id ${sprzetId}:`, error);
          }
        }
      }
      setSprzety(sprzetyMap); // Aktualizujemy stan
    };

    fetchUserData();
  }, []);

  const handleLogout = () => {
    localStorage.removeItem('authToken');
    navigate('/login'); // lub na inną stronę logowania
  };

  const goHome = () => {
    navigate('/');
  };

  return (
    <div className="profile">
      <div className="profile-actions">
        <button className="btn" onClick={goHome}>🏠 Strona główna</button>
        <button className="btn logout" onClick={handleLogout}>🔒 Wyloguj się</button>
      </div>

      {loading && <p>Ładowanie danych...</p>}
      {errorMessage && <p className="error">{errorMessage}</p>}

      {!loading && !errorMessage && userData && (
        <div>
          <h2>Profil użytkownika</h2>
          <p><strong>Imię:</strong> {userData.klient.imie}</p>
          <p><strong>Nazwisko:</strong> {userData.klient.nazwisko}</p>
          <p><strong>Email:</strong> {userData.klient.email}</p>
          <p><strong>Telefon:</strong> {userData.klient.telefon}</p>

          <h3>Aktualne wypożyczenia</h3>
          {userData.wypozyczenia.$values && userData.wypozyczenia.$values.length > 0 ? (
            <ul>
              {userData.wypozyczenia.$values.map((wypozyczenie, index) => (
                <li key={index}>
                  <p><strong>Sprzęt:</strong> {sprzety[wypozyczenie.sprzetId] || 'Ładowanie...'} </p>
                  <p><strong>Data wypożyczenia:</strong> {new Date(wypozyczenie.dataOd).toLocaleDateString()} - {new Date(wypozyczenie.dataDo).toLocaleDateString()}</p>
                  <p><strong>Data rezerwacji:</strong> {new Date(wypozyczenie.dataRezerwacji).toLocaleDateString()}</p>
                  <p><strong>Anulowane:</strong> {wypozyczenie.czyAnulowana ? 'Tak' : 'Nie'}</p>
                </li>
              ))}
            </ul>
          ) : (
            <p>Brak aktywnych wypożyczeń.</p>
          )}
        </div>
      )}
    </div>
  );
}

export default Profile;
