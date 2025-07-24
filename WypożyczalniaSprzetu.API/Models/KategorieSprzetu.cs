using System.Collections.Generic;
using WypozyczalniaSprzetu.API.Models;

namespace WypozyczalniaSprzetu.API.Models
{
    public class KategorieSprzetu
    {
        public int Id { get; set; }
        public string Nazwa { get; set; }

        public ICollection<Sprzet> Sprzety { get; set; }
    }
}
