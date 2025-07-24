namespace WypozyczalniaSprzetu.API.DTOs
{
    public class RezerwacjaUpdateDto
    {
        public DateTime? DataOd { get; set; } 
        public DateTime? DataDo { get; set; } 
        public bool? CzyAnulowana { get; set; } 
        public int? KlientId { get; set; } 
        public int? SprzetId { get; set; } 
    }
}
