namespace WypozyczalniaSprzetu.API.DTOs
{
    public class SprzetReadDto
    {
        public int Id { get; set; }
        public string Nazwa { get; set; }
        public string Opis { get; set; }
        public bool Dostepny { get; set; }

        public int KategorieSprzetuId { get; set; }  // Dodanie tej właściwości
        public KategorieSprzetuReadDto KategorieSprzetu { get; set; }  // Możesz również dodać kategorię sprzętu, jeżeli chcesz
    }
}
