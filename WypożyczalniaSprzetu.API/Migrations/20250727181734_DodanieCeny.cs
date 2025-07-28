using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WypożyczalniaSprzetu.API.Migrations
{
    /// <inheritdoc />
    public partial class DodanieCeny : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<decimal>(
                name: "Cena",
                table: "Sprzety",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Cena",
                table: "Sprzety");
        }
    }
}
