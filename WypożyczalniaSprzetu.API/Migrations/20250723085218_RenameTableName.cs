using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WypożyczalniaSprzetu.API.Migrations
{
    /// <inheritdoc />
    public partial class RenameTableName : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Rezerwacje_Sprzet_SprzetId",
                table: "Rezerwacje");

            migrationBuilder.DropForeignKey(
                name: "FK_Sprzet_KategorieSprzetu_KategorieSprzetuId",
                table: "Sprzet");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Sprzet",
                table: "Sprzet");

            migrationBuilder.RenameTable(
                name: "Sprzet",
                newName: "Sprzety");

            migrationBuilder.RenameIndex(
                name: "IX_Sprzet_KategorieSprzetuId",
                table: "Sprzety",
                newName: "IX_Sprzety_KategorieSprzetuId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Sprzety",
                table: "Sprzety",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Rezerwacje_Sprzety_SprzetId",
                table: "Rezerwacje",
                column: "SprzetId",
                principalTable: "Sprzety",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Sprzety_KategorieSprzetu_KategorieSprzetuId",
                table: "Sprzety",
                column: "KategorieSprzetuId",
                principalTable: "KategorieSprzetu",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Rezerwacje_Sprzety_SprzetId",
                table: "Rezerwacje");

            migrationBuilder.DropForeignKey(
                name: "FK_Sprzety_KategorieSprzetu_KategorieSprzetuId",
                table: "Sprzety");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Sprzety",
                table: "Sprzety");

            migrationBuilder.RenameTable(
                name: "Sprzety",
                newName: "Sprzet");

            migrationBuilder.RenameIndex(
                name: "IX_Sprzety_KategorieSprzetuId",
                table: "Sprzet",
                newName: "IX_Sprzet_KategorieSprzetuId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Sprzet",
                table: "Sprzet",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Rezerwacje_Sprzet_SprzetId",
                table: "Rezerwacje",
                column: "SprzetId",
                principalTable: "Sprzet",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Sprzet_KategorieSprzetu_KategorieSprzetuId",
                table: "Sprzet",
                column: "KategorieSprzetuId",
                principalTable: "KategorieSprzetu",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
