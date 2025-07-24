using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WypozyczalniaSprzetu.API.Data;
using WypozyczalniaSprzetu.API.Models;

namespace WypozyczalniaSprzetu.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class KlienciController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public KlienciController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Klient>>> GetKlienci()
        {
            return await _context.Klienci.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Klient>> GetKlient(int id)
        {
            var klient = await _context.Klienci.FindAsync(id);
            if (klient == null) return NotFound();
            return klient;
        }

        [HttpPost]
        public async Task<ActionResult<Klient>> PostKlient(Klient klient)
        {
            _context.Klienci.Add(klient);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetKlient), new { id = klient.IdKlienta }, klient);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutKlient(int id, Klient klient)
        {
            if (id != klient.IdKlienta) return BadRequest();
            _context.Entry(klient).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteKlient(int id)
        {
            var klient = await _context.Klienci.FindAsync(id);
            if (klient == null) return NotFound();
            _context.Klienci.Remove(klient);
            await _context.SaveChangesAsync();
            return NoContent();
        }
    }
}
