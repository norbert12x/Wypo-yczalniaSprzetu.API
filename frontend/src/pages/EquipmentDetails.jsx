import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { useParams, Link, useNavigate } from 'react-router-dom';
import './EquipmentDetails.css';

function EquipmentDetails() {
  const { equipmentId } = useParams();
  const [equipment, setEquipment] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [clientId, setClientId] = useState(null);
  const [showForm, setShowForm] = useState(false);
  const [reservationDates, setReservationDates] = useState({ dataOd: '', dataDo: '' });
  const [availabilityError, setAvailabilityError] = useState('');
  const [blockedRanges, setBlockedRanges] = useState([]);
  const navigate = useNavigate();

  useEffect(() => {
    axios.get(`https://localhost:7065/api/Sprzet/${equipmentId}`)
      .then(res => {
        setEquipment(res.data);
        setLoading(false);
      })
      .catch(err => {
        console.error(err);
        setLoading(false);
      });
  }, [equipmentId]);

  useEffect(() => {
    const fetchUserData = async () => {
      const token = localStorage.getItem('authToken');
      if (!token) {
        setError("Brak tokenu, użytkownik nie jest zalogowany.");
        setLoading(false);
        return;
      }

      try {
        const response = await fetch('https://localhost:7065/api/account/profile', {
          headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${token}`,
          },
        });

        if (response.ok) {
          const data = await response.json();
          setClientId(data.klient.idKlienta);
        } else {
          setError('Nie udało się pobrać danych użytkownika.');
        }
      } catch (error) {
        setError('Błąd połączenia z serwerem.');
      } finally {
        setLoading(false);
      }
    };

    fetchUserData();
  }, []);

  useEffect(() => {
    axios.get(`https://localhost:7065/api/Rezerwacje/sprzet/${equipmentId}/daty`)
      .then(res => {
        const ranges = res.data.$values.map(d => ({
          from: new Date(d.dataOd),
          to: new Date(d.dataDo)
        }));
        setBlockedRanges(ranges);
      })
      .catch(err => console.error("Błąd ładowania dat rezerwacji:", err));
  }, [equipmentId]);

  const isDateBlocked = (dateStr) => {
    const date = new Date(dateStr);
    return blockedRanges.some(range => date >= range.from && date <= range.to);
  };

  const handleDateChange = (e) => {
    const { name, value } = e.target;
    if (isDateBlocked(value)) {
      setAvailabilityError("Wybrana data jest niedostępna.");
    } else {
      setAvailabilityError('');
      setReservationDates(prev => ({ ...prev, [name]: value }));
    }
  };

  const handleReserve = () => {
    const { dataOd, dataDo } = reservationDates;
    if (!dataOd || !dataDo) {
      setError("Proszę podać daty rezerwacji.");
      return;
    }

    if (isDateBlocked(dataOd) || isDateBlocked(dataDo)) {
      setAvailabilityError("Wybrany zakres zawiera zarezerwowane daty.");
      return;
    }

    const token = localStorage.getItem('authToken');
    if (!token || !clientId || !equipment) {
      setError("Brak danych użytkownika lub sprzętu.");
      return;
    }

    const reservationData = {
      dataOd: new Date(dataOd).toISOString(),
      dataDo: new Date(dataDo).toISOString(),
      klientId: clientId,
      sprzetId: equipmentId
    };

    axios.post('https://localhost:7065/api/account/Zarezerwuj', reservationData, {
      headers: {
        Authorization: `Bearer ${token}`
      }
    })
      .then(() => {
        alert('Rezerwacja została dokonana.');
        navigate('/');
      })
      .catch(err => {
        if (err.response?.data?.dataDo) {
          setAvailabilityError(`W tym terminie sprzęt jest zarezerwowany. Spróbuj po: ${err.response.data.dataDo}`);
        } else {
          setAvailabilityError("Błąd przy rezerwacji sprzętu.");
        }
      });
  };

  // Funkcja do generowania ścieżki do zdjęcia
  const generateImagePath = (name) => {
    return `/images/${name.toLowerCase().replace(" ", "_")}.jpg`;
  };

  if (loading) return <div className="loading">Ładowanie...</div>;
  if (!equipment) return <div className="not-found">Nie znaleziono sprzętu.</div>;

  return (
    <div className="equipment-details">
      <div className="header-row">
        <Link to="/" className="store-name">SportZone</Link>
        <div className="header-buttons">
          <Link to="/profil" className="btn blue-btn">Profil</Link>
          <button className="logout" onClick={() => {
            localStorage.removeItem('loggedIn');
            window.location.href = '/login';
          }}>Wyloguj</button>
          <button className="btn blue-btn" onClick={() => navigate(-1)}>Powrót</button>
        </div>
      </div>

      <div className="product-container">
        <div className="image-section">
          {/* Używamy funkcji generateImagePath do uzyskania ścieżki obrazu */}
          <img
            src={generateImagePath(equipment.nazwa)}
            alt={equipment.nazwa}
          />
        </div>
        <div className="info-section">
          <h1 className="product-title">{equipment.nazwa}</h1>
          <p className="product-desc">{equipment.opis}</p>
          <div className="product-price">Cena: <span>{equipment.cena} PLN</span></div>
          {!showForm ? (
            <button className="btn reserve-btn" onClick={() => setShowForm(true)}>Zarezerwuj</button>
          ) : (
            <div className="reservation-form">
              <h2>Wybierz daty rezerwacji</h2>
              <div className="form-group">
                <label>Data od:</label>
                <input
                  type="date"
                  name="dataOd"
                  value={reservationDates.dataOd}
                  onChange={handleDateChange}
                  min={new Date().toISOString().split("T")[0]}
                />
              </div>
              <div className="form-group">
                <label>Data do:</label>
                <input
                  type="date"
                  name="dataDo"
                  value={reservationDates.dataDo}
                  onChange={handleDateChange}
                  min={reservationDates.dataOd || new Date().toISOString().split("T")[0]}
                />
              </div>
              {error && <div className="error-message">{error}</div>}
              {availabilityError && <div className="error-message">{availabilityError}</div>}
              <button className="btn reserve-btn" onClick={handleReserve}>Zarezerwuj sprzęt</button>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

export default EquipmentDetails;
