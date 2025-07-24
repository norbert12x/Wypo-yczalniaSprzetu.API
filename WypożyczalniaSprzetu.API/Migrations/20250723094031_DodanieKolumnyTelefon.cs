using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WypożyczalniaSprzetu.API.Migrations
{
    /// <inheritdoc />
    public partial class DodanieKolumnyTelefon : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Telefon",
                table: "Klienci",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Telefon",
                table: "Klienci");
        }
    }
}
