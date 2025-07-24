using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WypożyczalniaSprzetu.API.Migrations
{
    /// <inheritdoc />
    public partial class InitialCreate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "KategorieSprzetu",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nazwa = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_KategorieSprzetu", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Klienci",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Imie = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Nazwisko = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Klienci", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sprzet",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nazwa = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Opis = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Dostepny = table.Column<bool>(type: "bit", nullable: false),
                    KategoriaSprzetuId = table.Column<int>(type: "int", nullable: false),
                    KategorieSprzetuId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sprzet", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Sprzet_KategorieSprzetu_KategorieSprzetuId",
                        column: x => x.KategorieSprzetuId,
                        principalTable: "KategorieSprzetu",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Rezerwacje",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DataOd = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DataDo = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DataRezerwacji = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CzyAnulowana = table.Column<bool>(type: "bit", nullable: false),
                    KlientId = table.Column<int>(type: "int", nullable: false),
                    SprzetId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Rezerwacje", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Rezerwacje_Klienci_KlientId",
                        column: x => x.KlientId,
                        principalTable: "Klienci",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Rezerwacje_Sprzet_SprzetId",
                        column: x => x.SprzetId,
                        principalTable: "Sprzet",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Zwroty",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DataZwrotu = table.Column<DateTime>(type: "datetime2", nullable: false),
                    RezerwacjaId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Zwroty", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Zwroty_Rezerwacje_RezerwacjaId",
                        column: x => x.RezerwacjaId,
                        principalTable: "Rezerwacje",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Rezerwacje_KlientId",
                table: "Rezerwacje",
                column: "KlientId");

            migrationBuilder.CreateIndex(
                name: "IX_Rezerwacje_SprzetId",
                table: "Rezerwacje",
                column: "SprzetId");

            migrationBuilder.CreateIndex(
                name: "IX_Sprzet_KategorieSprzetuId",
                table: "Sprzet",
                column: "KategorieSprzetuId");

            migrationBuilder.CreateIndex(
                name: "IX_Zwroty_RezerwacjaId",
                table: "Zwroty",
                column: "RezerwacjaId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Zwroty");

            migrationBuilder.DropTable(
                name: "Rezerwacje");

            migrationBuilder.DropTable(
                name: "Klienci");

            migrationBuilder.DropTable(
                name: "Sprzet");

            migrationBuilder.DropTable(
                name: "KategorieSprzetu");
        }
    }
}
