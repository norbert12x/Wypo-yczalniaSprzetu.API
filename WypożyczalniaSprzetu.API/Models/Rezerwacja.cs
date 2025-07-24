using WypozyczalniaSprzetu.API.Models;

namespace WypozyczalniaSprzetu.API.Models
{
    public class Rezerwacja
    {
        public int Id { get; set; }
        public DateTime DataOd { get; set; }
        public DateTime DataDo { get; set; }
        public DateTime DataRezerwacji { get; set; } = DateTime.Now;
        public bool CzyAnulowana { get; set; } = false;

        public int KlientId { get; set; }
        public Klient Klient { get; set; }

        public int SprzetId { get; set; }
        public Sprzet Sprzet { get; set; }
    }
}
