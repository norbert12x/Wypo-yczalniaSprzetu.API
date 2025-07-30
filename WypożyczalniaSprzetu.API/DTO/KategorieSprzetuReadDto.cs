namespace WypozyczalniaSprzetu.API.DTOs
{
    public class KategorieSprzetuReadDto
    {
        public int Id { get; set; }
        public string Nazwa { get; set; }

        public List<SprzetReadDto> Sprzety { get; set; }
    }
}
