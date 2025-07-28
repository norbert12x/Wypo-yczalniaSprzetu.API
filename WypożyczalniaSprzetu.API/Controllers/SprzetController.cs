using Microsoft.AspNetCore.Mvc;
using WypozyczalniaSprzetu.API.Data;
using WypozyczalniaSprzetu.API.DTOs;
using WypozyczalniaSprzetu.API.Models.DTO;
using WypozyczalniaSprzetu.API.Models;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics.Contracts;

[ApiController]
[Route("api/[controller]")]
public class SprzetController : ControllerBase
{
    private readonly ApplicationDbContext _context;

    public SprzetController(ApplicationDbContext context)
    {
        _context = context;
    }

    // Pobierz wszystkie sprzęty
    [HttpGet]
    public async Task<ActionResult<IEnumerable<SprzetReadDto>>> GetAll()
    {
        var sprzety = await _context.Sprzety
            .Select(s => new SprzetReadDto
            {
                Id = s.Id,
                Nazwa = s.Nazwa,
                Opis = s.Opis,
                Dostepny = s.Dostepny,
                Cena = s.Cena
            })
            .ToListAsync();

        return Ok(sprzety);
    }

    // Pobierz sprzęt dla danej kategorii
    [HttpGet("kategoria/{kategoriaId}")]
    public async Task<ActionResult<IEnumerable<SprzetReadDto>>> GetByCategory(int kategoriaId)
    {
        var sprzety = await _context.Sprzety
            .Where(s => s.KategorieSprzetuId == kategoriaId)
            .Select(s => new SprzetReadDto
            {
                Id = s.Id,
                Nazwa = s.Nazwa,
                Opis = s.Opis,
                Dostepny = s.Dostepny,
                Cena = s.Cena
            })
            .ToListAsync();

        return Ok(sprzety);
    }

    [HttpGet("{equipmentId}")]
    public async Task<ActionResult<SprzetReadDto>> GetEquipmentById(int equipmentId)
    {
        var sprzet = await _context.Sprzety
            .Where(s => s.Id == equipmentId)
            .Select(s => new SprzetReadDto
            {
                Id = s.Id,
                Nazwa = s.Nazwa,
                Opis = s.Opis,
                Cena = s.Cena, 
                Dostepny = s.Dostepny
            })
            .FirstOrDefaultAsync();

        if (sprzet == null)
        {
            return NotFound(); 
        }

        return Ok(sprzet); 
    }


    // Tworzenie nowego sprzętu
    [HttpPost]
    public async Task<ActionResult<SprzetReadDto>> Create(SprzetCreateDto dto)
    {
        var nowySprzet = new Sprzet
        {
            Nazwa = dto.Nazwa,
            Opis = dto.Opis,
            Dostepny = dto.Dostepny,
            KategorieSprzetuId = dto.KategorieSprzetuId,
            Cena = dto.Cena
        };

        _context.Sprzety.Add(nowySprzet);
        await _context.SaveChangesAsync();

        var sprzetDto = new SprzetReadDto
        {
            Id = nowySprzet.Id,
            Nazwa = nowySprzet.Nazwa,
            Opis = nowySprzet.Opis,
            Dostepny = nowySprzet.Dostepny
        };

        return CreatedAtAction(nameof(GetByCategory), new { kategoriaId = nowySprzet.KategorieSprzetuId }, sprzetDto);
    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteSprzet(int id)
    {
        var sprzet = await _context.Sprzety.FindAsync(id);
        if (sprzet == null) return NotFound();
        _context.Sprzety.Remove(sprzet);
        await _context.SaveChangesAsync();
        return NoContent();
    }
}
