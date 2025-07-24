namespace WypozyczalniaSprzetu.API.Models.DTO
{
    public class SprzetCreateDto
    {
        public string Nazwa { get; set; }
        public string Opis { get; set; }
        public bool Dostepny { get; set; }
        public int KategorieSprzetuId { get; set; }
    }
}
