public class RezerwacjaCreateDto
{
    public DateTime? DataOd { get; set; }
    public DateTime? DataDo { get; set; }
    public bool? CzyAnulowana { get; set; }
    public int KlientId { get; set; }
    public int SprzetId { get; set; }
}
