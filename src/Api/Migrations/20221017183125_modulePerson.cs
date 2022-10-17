using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Api.Migrations
{
    public partial class modulePerson : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "fk_experiences_studies_study_code",
                table: "Experiences");

            migrationBuilder.DropPrimaryKey(
                name: "pk_studies",
                table: "Experiences");

            migrationBuilder.DropColumn(
                name: "study_code",
                table: "Experiences");

            migrationBuilder.AddColumn<string>(
                name: "person_document",
                table: "users",
                type: "varchar(255)",
                nullable: true)
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AddColumn<string>(
                name: "person_document",
                table: "Experiences",
                type: "varchar(255)",
                nullable: false,
                defaultValue: "")
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AddPrimaryKey(
                name: "pk_people",
                table: "Experiences",
                column: "person_document");

            migrationBuilder.CreateIndex(
                name: "ix_users_person_document",
                table: "users",
                column: "person_document");

            migrationBuilder.AddForeignKey(
                name: "fk_experiences_people_person_document",
                table: "Experiences",
                column: "person_document",
                principalTable: "people",
                principalColumn: "person_document",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "fk_users_people_person_document",
                table: "users",
                column: "person_document",
                principalTable: "people",
                principalColumn: "person_document");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "fk_experiences_people_person_document",
                table: "Experiences");

            migrationBuilder.DropForeignKey(
                name: "fk_users_people_person_document",
                table: "users");

            migrationBuilder.DropIndex(
                name: "ix_users_person_document",
                table: "users");

            migrationBuilder.DropPrimaryKey(
                name: "pk_people",
                table: "Experiences");

            migrationBuilder.DropColumn(
                name: "person_document",
                table: "users");

            migrationBuilder.DropColumn(
                name: "person_document",
                table: "Experiences");

            migrationBuilder.AddColumn<int>(
                name: "study_code",
                table: "Experiences",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddPrimaryKey(
                name: "pk_studies",
                table: "Experiences",
                column: "study_code");

            migrationBuilder.AddForeignKey(
                name: "fk_experiences_studies_study_code",
                table: "Experiences",
                column: "study_code",
                principalTable: "studies",
                principalColumn: "study_code",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
