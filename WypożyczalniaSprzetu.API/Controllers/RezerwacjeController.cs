using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WypozyczalniaSprzetu.API.Data;
using WypozyczalniaSprzetu.API.DTOs;
using WypozyczalniaSprzetu.API.Models;

namespace WypozyczalniaSprzetu.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RezerwacjeController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public RezerwacjeController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Rezerwacje
        [HttpGet]
        public async Task<ActionResult<IEnumerable<RezerwacjaReadDto>>> GetRezerwacje()
        {
            var rezerwacje = await _context.Rezerwacje
                .Include(r => r.Klient)
                .Include(r => r.Sprzet)
                .ThenInclude(s => s.KategorieSprzetu)
                .ToListAsync();

            var rezerwacjeDto = rezerwacje.Select(r => new RezerwacjaReadDto
            {
                Id = r.Id,
                DataOd = r.DataOd,
                DataDo = r.DataDo,
                DataRezerwacji = r.DataRezerwacji,
                CzyAnulowana = r.CzyAnulowana,
                KlientId = r.KlientId,
                Klient = r.Klient != null ? new KlientReadDto
                {
                    IdKlienta = r.Klient.IdKlienta,
                    Imie = r.Klient.Imie,
                    Nazwisko = r.Klient.Nazwisko,
                    Email = r.Klient.Email,
                    Telefon = r.Klient.Telefon
                } : null,  
                SprzetId = r.SprzetId,
                Sprzet = r.Sprzet != null ? new SprzetReadDto
                {
                    Id = r.Sprzet.Id,
                    Nazwa = r.Sprzet.Nazwa,
                    Opis = r.Sprzet.Opis,
                    Dostepny = r.Sprzet.Dostepny,
                    KategorieSprzetuId = r.Sprzet.KategorieSprzetuId,
                    KategorieSprzetu = r.Sprzet.KategorieSprzetu != null ? new KategorieSprzetuReadDto
                    {
                        Id = r.Sprzet.KategorieSprzetu.Id,
                        Nazwa = r.Sprzet.KategorieSprzetu.Nazwa
                    } : null  
                } : null // Dodajemy sprawdzenie null dla Sprzetu
            }).ToList();

            return Ok(rezerwacjeDto);
        }


        // GET: api/Rezerwacje/{id}
        [HttpGet("{id}")]
        public async Task<ActionResult<RezerwacjaReadDto>> GetRezerwacja(int id)
        {
            var rezerwacja = await _context.Rezerwacje
                .Include(r => r.Sprzet)
                .Include(r => r.Klient)
                .FirstOrDefaultAsync(r => r.Id == id);

            if (rezerwacja == null)
                return NotFound();

            var result = new RezerwacjaReadDto
            {
                Id = rezerwacja.Id,
                DataOd = rezerwacja.DataOd,
                DataDo = rezerwacja.DataDo,
                DataRezerwacji = rezerwacja.DataRezerwacji,
                CzyAnulowana = rezerwacja.CzyAnulowana,
                KlientId = rezerwacja.KlientId,
                Klient = new KlientReadDto
                {
                    IdKlienta = rezerwacja.Klient.IdKlienta,
                    Imie = rezerwacja.Klient.Imie,
                    Nazwisko = rezerwacja.Klient.Nazwisko,
                    Email = rezerwacja.Klient.Email,
                    Telefon = rezerwacja.Klient.Telefon
                },
                SprzetId = rezerwacja.SprzetId,
                Sprzet = new SprzetReadDto
                {
                    Id = rezerwacja.Sprzet.Id,
                    Nazwa = rezerwacja.Sprzet.Nazwa,
                    Opis = rezerwacja.Sprzet.Opis,
                    Dostepny = rezerwacja.Sprzet.Dostepny,
                    KategorieSprzetuId = rezerwacja.Sprzet.KategorieSprzetuId,
                    KategorieSprzetu = new KategorieSprzetuReadDto
                    {
                        Id = rezerwacja.Sprzet.KategorieSprzetu.Id,
                        Nazwa = rezerwacja.Sprzet.KategorieSprzetu.Nazwa
                    }
                }
            };

            return Ok(result);
        }

        // POST: api/Rezerwacje
        [HttpPost]
        public async Task<ActionResult<RezerwacjaReadDto>> CreateRezerwacja(RezerwacjaCreateDto dto)
        {
            var klient = await _context.Klienci.FindAsync(dto.KlientId);
            if (klient == null)
                return BadRequest("Klient nie istnieje.");

            var sprzet = await _context.Sprzety.FindAsync(dto.SprzetId);
            if (sprzet == null)
                return BadRequest("Sprzęt nie istnieje.");

            // Sprawdzamy, czy sprzęt jest już zarezerwowany w danym okresie
            var czySprzetZarezerwowany = await _context.Rezerwacje
                .AnyAsync(r => r.SprzetId == dto.SprzetId &&
                              ((r.DataOd <= dto.DataDo && r.DataDo >= dto.DataOd) || r.CzyAnulowana == false));
            if (czySprzetZarezerwowany)
                return BadRequest("Sprzęt jest już zarezerwowany w tym okresie.");

            // Tworzymy nową rezerwację
            var rezerwacja = new Rezerwacja
            {
                DataOd = dto.DataOd ?? DateTime.Now,
                DataDo = dto.DataDo ?? DateTime.Now,
                DataRezerwacji = DateTime.Now,
                CzyAnulowana = dto.CzyAnulowana ?? false,
                KlientId = dto.KlientId,
                SprzetId = dto.SprzetId
            };

            _context.Rezerwacje.Add(rezerwacja);
            await _context.SaveChangesAsync();

            // Zmieniamy dostępność sprzętu na 'false'
            sprzet.Dostepny = false;
            await _context.SaveChangesAsync();

            var resultDto = new RezerwacjaReadDto
            {
                Id = rezerwacja.Id,
                DataOd = rezerwacja.DataOd,
                DataDo = rezerwacja.DataDo,
                DataRezerwacji = rezerwacja.DataRezerwacji,
                CzyAnulowana = rezerwacja.CzyAnulowana,
                KlientId = rezerwacja.KlientId,
                SprzetId = rezerwacja.SprzetId
            };

            return CreatedAtAction(nameof(GetRezerwacja), new { id = resultDto.Id }, resultDto);
        }



        // PUT: api/Rezerwacje/{id}
        [HttpPut("{id}")]
        public async Task<ActionResult> UpdateRezerwacja(int id, RezerwacjaUpdateDto dto)
        {
            var rezerwacja = await _context.Rezerwacje
                .Include(r => r.Sprzet)
                .Include(r => r.Klient)
                .FirstOrDefaultAsync(r => r.Id == id);

            if (rezerwacja == null)
                return NotFound();

            // Sprawdzamy, czy zmiana terminu rezerwacji koliduje z innymi rezerwacjami
            if (dto.DataOd.HasValue || dto.DataDo.HasValue)
            {
                var czySprzetZarezerwowany = await _context.Rezerwacje
                    .AnyAsync(r => r.SprzetId == rezerwacja.SprzetId &&
                                  ((r.DataOd <= dto.DataDo && r.DataDo >= dto.DataOd) || r.CzyAnulowana == false));
                if (czySprzetZarezerwowany)
                    return BadRequest("Sprzęt jest już zarezerwowany w tym okresie.");
            }

            // Zaktualizowanie tylko tych danych, które są przekazane w DTO
            if (dto.DataOd.HasValue)
                rezerwacja.DataOd = dto.DataOd.Value;

            if (dto.DataDo.HasValue)
                rezerwacja.DataDo = dto.DataDo.Value;

            if (dto.CzyAnulowana.HasValue)
                rezerwacja.CzyAnulowana = dto.CzyAnulowana.Value;

            if (dto.KlientId.HasValue)
                rezerwacja.KlientId = dto.KlientId.Value;

            if (dto.SprzetId.HasValue)
                rezerwacja.SprzetId = dto.SprzetId.Value;

            await _context.SaveChangesAsync();

            // Zmiana dostępności sprzętu na 'false' przy zaktualizowanej rezerwacji
            var sprzet = await _context.Sprzety.FindAsync(rezerwacja.SprzetId);
            if (sprzet != null && !sprzet.Dostepny)
                sprzet.Dostepny = false;

            await _context.SaveChangesAsync();

            return NoContent();
        }


        // DELETE: api/Rezerwacje/{id}
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteRezerwacja(int id)
        {
            var rezerwacja = await _context.Rezerwacje.FindAsync(id);
            if (rezerwacja == null)
                return NotFound();

            _context.Rezerwacje.Remove(rezerwacja);

            // Zmieniamy dostępność sprzętu na 'true' przy usunięciu rezerwacji
            var sprzet = await _context.Sprzety.FindAsync(rezerwacja.SprzetId);
            if (sprzet != null)
                sprzet.Dostepny = true;

            await _context.SaveChangesAsync();
            return NoContent();
        }

    }
}
