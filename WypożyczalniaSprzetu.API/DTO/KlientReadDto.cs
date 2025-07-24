namespace WypozyczalniaSprzetu.API.DTOs
{
    public class KlientReadDto
    {
        public int IdKlienta { get; set; }  // Id klienta w bazie danych
        public string Imie { get; set; }    // Imię klienta
        public string Nazwisko { get; set; } // Nazwisko klienta
        public string Email { get; set; }   // Email klienta
        public string Telefon { get; set; } // Numer telefonu klienta
    }
}
