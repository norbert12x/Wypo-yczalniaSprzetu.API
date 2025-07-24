using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WypozyczalniaSprzetu.API.Data;
using WypozyczalniaSprzetu.API.DTOs;
using WypozyczalniaSprzetu.API.Models;

namespace WypozyczalniaSprzetu.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ZwrotyController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public ZwrotyController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Zwroty
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Zwrot>>> GetZwroty()
        {
            var zwroty = await _context.Zwroty.Include(z => z.Rezerwacja).ToListAsync();
            return Ok(zwroty);
        }

        // GET: api/Zwroty/{id}
        [HttpGet("{id}")]
        public async Task<ActionResult<Zwrot>> GetZwrot(int id)
        {
            var zwrot = await _context.Zwroty
                .Include(z => z.Rezerwacja)
                .FirstOrDefaultAsync(z => z.Id == id);

            if (zwrot == null)
                return NotFound();

            return Ok(zwrot);
        }

        // POST: api/Zwroty
        [HttpPost]
        public async Task<ActionResult<Zwrot>> CreateZwrot(ZwrotCreateDto dto)
        {
            var rezerwacja = await _context.Rezerwacje
                .Include(r => r.Sprzet)
                .FirstOrDefaultAsync(r => r.Id == dto.RezerwacjaId);

            if (rezerwacja == null)
                return NotFound("Rezerwacja nie istnieje.");

            // Tworzymy zwrot
            var zwrot = new Zwrot
            {
                RezerwacjaId = dto.RezerwacjaId,
                DataZwrotu = DateTime.Now
            };

            _context.Zwroty.Add(zwrot);

            // Ustawiamy sprzęt jako dostępny
            var sprzet = rezerwacja.Sprzet;
            if (sprzet != null)
            {
                sprzet.Dostepny = true;  // Sprzęt staje się dostępny po zwrocie
            }

            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetZwrot), new { id = zwrot.Id }, zwrot);
        }
    }
}
