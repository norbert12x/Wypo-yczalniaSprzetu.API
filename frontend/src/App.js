import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Home from "./pages/Home";
import ListaSprzetow from "./pages/ListaSprzetow";
import EquipmentDetails from "./pages/EquipmentDetails";
import Login from "./pages/Login";
import Profile from './pages/Profile';
import Register from "./pages/Register";

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/login" element={<Login />} />
        <Route path="/" element={<Home />} />
        <Route path="/sprzety/:categoryId" element={<ListaSprzetow />} />
        <Route path="/sprzet/:equipmentId" element={<EquipmentDetails />} />
        <Route path="/profil" element={<Profile />} />
        <Route path="/register" element={<Register />} />

      </Routes>
    </Router>
  );
}

export default App;
