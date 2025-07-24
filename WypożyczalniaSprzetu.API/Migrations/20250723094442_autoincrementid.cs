using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WypożyczalniaSprzetu.API.Migrations
{
    /// <inheritdoc />
    public partial class autoincrementid : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Id",
                table: "Klienci",
                newName: "IdKlienta");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "IdKlienta",
                table: "Klienci",
                newName: "Id");
        }
    }
}
