using Microsoft.EntityFrameworkCore;
using WypozyczalniaSprzetu.API.Models;

namespace WypozyczalniaSprzetu.API.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options) { }

        public DbSet<Klient> Klienci { get; set; }
        public DbSet<Sprzet> Sprzety { get; set; }
        public DbSet<Rezerwacja> Rezerwacje { get; set; }
        public DbSet<Zwrot> Zwroty { get; set; }
        public DbSet<KategorieSprzetu> KategorieSprzetu { get; set; }
    }
}
