using WypozyczalniaSprzetu.API.Models;


namespace WypozyczalniaSprzetu.API.Models
{
    public class Sprzet
    {
        public int Id { get; set; }
        public string Nazwa { get; set; }
        public string Opis { get; set; }
        public bool Dostepny { get; set; }

        public int KategorieSprzetuId { get; set; }
        public KategorieSprzetu KategorieSprzetu { get; set; }

        public ICollection<Rezerwacja> Rezerwacje { get; set; }
    }
}
