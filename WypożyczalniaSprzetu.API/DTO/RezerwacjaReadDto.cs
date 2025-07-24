namespace WypozyczalniaSprzetu.API.DTOs
{
    public class RezerwacjaReadDto
    {
        public int Id { get; set; }
        public DateTime DataOd { get; set; }
        public DateTime DataDo { get; set; }
        public DateTime DataRezerwacji { get; set; }
        public bool CzyAnulowana { get; set; }
        public int KlientId { get; set; }
        public KlientReadDto Klient { get; set; }
        public int SprzetId { get; set; }
        public SprzetReadDto Sprzet { get; set; }
    }
}
