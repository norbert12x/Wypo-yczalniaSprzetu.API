using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WypozyczalniaSprzetu.API.Data;
using WypozyczalniaSprzetu.API.DTOs;
using WypozyczalniaSprzetu.API.Models;

namespace WypozyczalniaSprzetu.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class KategorieSprzetuController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public KategorieSprzetuController(ApplicationDbContext context)
        {
            _context = context;
        }

        // Pobierz wszystkie kategorie z powiązanym sprzętem
        [HttpGet]
        public async Task<ActionResult<IEnumerable<KategorieSprzetuReadDto>>> GetAll()
        {
            var kategorie = await _context.KategorieSprzetu
                .Include(k => k.Sprzety) // Ładowanie powiązanych sprzętów
                .Select(k => new KategorieSprzetuReadDto
                {
                    Id = k.Id,
                    Nazwa = k.Nazwa,
                    Sprzety = k.Sprzety.Select(s => new SprzetReadDto
                    {
                        Id = s.Id,
                        Nazwa = s.Nazwa,
                        Opis = s.Opis,
                        Dostepny = s.Dostepny
                    }).ToList()
                })
                .ToListAsync();

            return Ok(kategorie);
        }

        // Pobierz kategorię i jej sprzęt po ID
        [HttpGet("{id}")]
        public async Task<ActionResult<KategorieSprzetuReadDto>> GetById(int id)
        {
            var kategoria = await _context.KategorieSprzetu
                .Include(k => k.Sprzety) // Ładowanie powiązanych sprzętów
                .FirstOrDefaultAsync(k => k.Id == id);

            if (kategoria == null)
                return NotFound();

            return new KategorieSprzetuReadDto
            {
                Id = kategoria.Id,
                Nazwa = kategoria.Nazwa,
                Sprzety = kategoria.Sprzety.Select(s => new SprzetReadDto
                {
                    Id = s.Id,
                    Nazwa = s.Nazwa,
                    Opis = s.Opis,
                    Dostepny = s.Dostepny
                }).ToList()
            };
        }

        // Tworzenie nowej kategorii
        [HttpPost]
        public async Task<ActionResult<KategorieSprzetuReadDto>> Create(KategorieSprzetuCreateDto dto)
        {
            var nowaKategoria = new KategorieSprzetu
            {
                Nazwa = dto.Nazwa
            };

            _context.KategorieSprzetu.Add(nowaKategoria);
            await _context.SaveChangesAsync();

            var resultDto = new KategorieSprzetuReadDto
            {
                Id = nowaKategoria.Id,
                Nazwa = nowaKategoria.Nazwa
            };

            return CreatedAtAction(nameof(GetById), new { id = resultDto.Id }, resultDto);
        }
    }
}
