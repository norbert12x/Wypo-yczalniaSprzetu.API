using WypozyczalniaSprzetu.API.Models;

namespace WypozyczalniaSprzetu.API.Models
{
    public class Zwrot
    {
        public int Id { get; set; }
        public DateTime DataZwrotu { get; set; } = DateTime.Now;

        public int RezerwacjaId { get; set; }
        public Rezerwacja Rezerwacja { get; set; }
    }
}
