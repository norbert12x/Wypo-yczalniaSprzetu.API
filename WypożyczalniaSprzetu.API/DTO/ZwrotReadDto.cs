namespace WypozyczalniaSprzetu.API.DTOs
{
    public class ZwrotReadDto
    {
        public int Id { get; set; }
        public DateTime DataZwrotu { get; set; }
        public int RezerwacjaId { get; set; }
        public RezerwacjaReadDto Rezerwacja { get; set; }
    }
}
