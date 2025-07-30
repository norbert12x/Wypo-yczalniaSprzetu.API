using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using WypozyczalniaSprzetu.API.Data;
using WypozyczalniaSprzetu.API.Models;
using BCrypt.Net;
using WypozyczalniaSprzetu.API.DTOs;
using AutoMapper;

namespace WypozyczalniaSprzetu.API.Controllers
{
    [Route("api/account")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IConfiguration _configuration;
        private readonly IMapper _mapper;

        public AccountController(ApplicationDbContext context, IConfiguration configuration, IMapper mapper)
        {
            _context = context;
            _configuration = configuration;
            _mapper = mapper;
        }

        // Rejestracja klienta
        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] RegisterDto registerDto)
        {
            // Sprawdzenie, czy klient z tym emailem już istnieje
            if (await _context.Klienci.AnyAsync(k => k.Email == registerDto.Email))
                return BadRequest("Klient z tym emailem już istnieje.");

            // Tworzymy nowego klienta
            var klient = new Klient
            {
                Imie = registerDto.Imie,
                Nazwisko = registerDto.Nazwisko,
                Email = registerDto.Email,
                Telefon = registerDto.Telefon,
                Haslo = BCrypt.Net.BCrypt.HashPassword(registerDto.Haslo)
            };

            _context.Klienci.Add(klient);
            await _context.SaveChangesAsync();

            return Ok(new { message = "Rejestracja zakończona sukcesem!" });
        }

        // Logowanie klienta
        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginDto loginDto)
        {
            var klient = await _context.Klienci
                .FirstOrDefaultAsync(k => k.Email == loginDto.Email);

            if (klient == null || !BCrypt.Net.BCrypt.Verify(loginDto.Haslo, klient.Haslo))
                return Unauthorized("Niepoprawny email lub hasło.");

            var token = GenerateJwtToken(klient);

            return Ok(new
            {
                token,
                message = "Zalogowano pomyślnie!"
            });
        }

        // Pobranie profilu klienta
        [Authorize]
        [HttpGet("profile")]
        public async Task<IActionResult> GetProfile()
        {
            var userId = int.Parse(User.FindFirst(ClaimTypes.NameIdentifier)?.Value ?? "0");

            var klient = await _context.Klienci
                .FirstOrDefaultAsync(k => k.IdKlienta == userId);

            if (klient == null)
                return NotFound("Klient nie znaleziony.");

            var wypozyczenia = await _context.Rezerwacje
                .Where(r => r.KlientId == userId)
                .ToListAsync();

            return Ok(new { klient, wypozyczenia });
        }

        // Pobranie rezerwacji klienta
        [Authorize]
        [HttpGet("reservations")]
        public async Task<ActionResult<IEnumerable<RezerwacjaReadDto>>> GetUserReservations()
        {
            var klientId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier));

            var rezerwacje = await _context.Rezerwacje
                .Where(r => r.KlientId == klientId)
                .Include(r => r.Sprzet)
                .Include(r => r.Klient)
                .ToListAsync();

            return Ok(_mapper.Map<IEnumerable<RezerwacjaReadDto>>(rezerwacje));
        }

        // Pobranie zwrotów klienta
        [Authorize]
        [HttpGet("returns")]
        public async Task<ActionResult<IEnumerable<ZwrotReadDto>>> GetUserReturns()
        {
            var klientId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier));

            var zwroty = await _context.Zwroty
                .Include(z => z.Rezerwacja)
                    .ThenInclude(r => r.Sprzet)
                .Include(z => z.Rezerwacja)
                    .ThenInclude(r => r.Klient)
                .Where(z => z.Rezerwacja.KlientId == klientId)
                .ToListAsync();

            return Ok(_mapper.Map<IEnumerable<ZwrotReadDto>>(zwroty));
        }
        [HttpPost("Zarezerwuj")]
        [Authorize]
        public async Task<IActionResult> Zarezerwuj(RezerwacjaCreateDto dto)
        {
            // Sprawdź daty
            if (!dto.DataOd.HasValue || !dto.DataDo.HasValue)
                return BadRequest("Data rozpoczęcia i zakończenia rezerwacji są wymagane.");

            if (dto.DataOd.Value >= dto.DataDo.Value)
                return BadRequest("Data zakończenia musi być po dacie rozpoczęcia.");

            var userId = int.Parse(User.FindFirst(ClaimTypes.NameIdentifier)?.Value ?? "0");
            if (userId == 0)
                return Unauthorized();

            var sprzet = await _context.Sprzety.FindAsync(dto.SprzetId);
            if (sprzet == null)
                return NotFound("Nie znaleziono sprzętu.");

            // Sprawdzenie dostępności
            bool czyZajety = await _context.Rezerwacje.AnyAsync(r =>
                r.SprzetId == dto.SprzetId &&
                !r.CzyAnulowana &&
                r.DataDo >= dto.DataOd.Value &&
                r.DataOd <= dto.DataDo.Value);

            if (czyZajety)
                return BadRequest("Sprzęt jest niedostępny w wybranym terminie.");

            sprzet.Dostepny = false;
            await _context.SaveChangesAsync();
            var nowaRezerwacja = new Rezerwacja
            {
                KlientId = userId,
                SprzetId = dto.SprzetId,
                DataOd = dto.DataOd.Value,
                DataDo = dto.DataDo.Value,
                CzyAnulowana = false,
                DataRezerwacji = DateTime.UtcNow
            };

            _context.Rezerwacje.Add(nowaRezerwacja);
            await _context.SaveChangesAsync();

            return Ok("Rezerwacja została utworzona.");
        }


        // Generowanie tokena JWT
        private string GenerateJwtToken(Klient klient)
        {
            var claims = new[] {
                new Claim(ClaimTypes.NameIdentifier, klient.IdKlienta.ToString()),
                new Claim(ClaimTypes.Email, klient.Email),
                new Claim(ClaimTypes.Name, klient.Imie + " " + klient.Nazwisko)
            };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(
                issuer: _configuration["Jwt:Issuer"],
                audience: _configuration["Jwt:Audience"],
                claims: claims,
                expires: DateTime.UtcNow.AddDays(1),
                signingCredentials: creds
            );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}