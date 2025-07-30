namespace WypozyczalniaSprzetu.API.DTOs
{
    public class KlientReadDto
    {
        public int IdKlienta { get; set; } 
        public string Imie { get; set; }  
        public string Nazwisko { get; set; } 
        public string Email { get; set; } 
        public string Telefon { get; set; } 
    }
}
