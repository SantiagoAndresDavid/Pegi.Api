using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Api.Migrations
{
    public partial class modifyPerson : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterDatabase()
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "academics_program",
                columns: table => new
                {
                    code_program = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_academics_program", x => x.code_program);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "departments",
                columns: table => new
                {
                    department_id = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    deparment_name = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_departments", x => x.department_id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "cities",
                columns: table => new
                {
                    city_id = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    city_name = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    department_code = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_cities", x => x.city_id);
                    table.ForeignKey(
                        name: "fk_cities_departments_department_code",
                        column: x => x.department_code,
                        principalTable: "departments",
                        principalColumn: "department_id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "people",
                columns: table => new
                {
                    document = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    person_identification_type = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    person_first_name = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    person_second_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    person_first_last_name = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    person_second_last_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    person_civil_state = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    person_gender = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    person_birth_date = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    person_phone = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    person_institutional_email = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    cities_code = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_people", x => x.document);
                    table.ForeignKey(
                        name: "fk_people_cities_cities_code",
                        column: x => x.cities_code,
                        principalTable: "cities",
                        principalColumn: "city_id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Experiences",
                columns: table => new
                {
                    experience_code = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    experience_institution = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    study_start_date = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    study_end_date = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    cities_code = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    people_code = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    experience_position = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_experiences", x => x.experience_code);
                    table.ForeignKey(
                        name: "fk_experiences_cities_cities_code",
                        column: x => x.cities_code,
                        principalTable: "cities",
                        principalColumn: "city_id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "fk_experiences_people_people_code",
                        column: x => x.people_code,
                        principalTable: "people",
                        principalColumn: "document",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "professor",
                columns: table => new
                {
                    document = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    position = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_professor", x => x.document);
                    table.ForeignKey(
                        name: "fk_professor_people_document",
                        column: x => x.document,
                        principalTable: "people",
                        principalColumn: "document",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "students",
                columns: table => new
                {
                    document = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    amount_credits = table.Column<int>(type: "int", nullable: false),
                    academic_program_code = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_students", x => x.document);
                    table.ForeignKey(
                        name: "fk_students_academics_program_academic_program_code",
                        column: x => x.academic_program_code,
                        principalTable: "academics_program",
                        principalColumn: "code_program");
                    table.ForeignKey(
                        name: "fk_students_people_document",
                        column: x => x.document,
                        principalTable: "people",
                        principalColumn: "document",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "studies",
                columns: table => new
                {
                    study_code = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    study_institution = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    study_start_date = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    study_end_date = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    cities_code = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    people_code = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_studies", x => x.study_code);
                    table.ForeignKey(
                        name: "fk_studies_cities_cities_code",
                        column: x => x.cities_code,
                        principalTable: "cities",
                        principalColumn: "city_id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "fk_studies_people_people_code",
                        column: x => x.people_code,
                        principalTable: "people",
                        principalColumn: "document",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "users",
                columns: table => new
                {
                    user_name = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    user_password = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    user_rol = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    person_document = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_users", x => x.user_name);
                    table.ForeignKey(
                        name: "fk_users_people_person_document",
                        column: x => x.person_document,
                        principalTable: "people",
                        principalColumn: "document");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "ix_cities_department_code",
                table: "cities",
                column: "department_code");

            migrationBuilder.CreateIndex(
                name: "ix_experiences_cities_code",
                table: "Experiences",
                column: "cities_code");

            migrationBuilder.CreateIndex(
                name: "ix_experiences_people_code",
                table: "Experiences",
                column: "people_code");

            migrationBuilder.CreateIndex(
                name: "ix_people_cities_code",
                table: "people",
                column: "cities_code");

            migrationBuilder.CreateIndex(
                name: "ix_students_academic_program_code",
                table: "students",
                column: "academic_program_code");

            migrationBuilder.CreateIndex(
                name: "ix_studies_cities_code",
                table: "studies",
                column: "cities_code");

            migrationBuilder.CreateIndex(
                name: "ix_studies_people_code",
                table: "studies",
                column: "people_code");

            migrationBuilder.CreateIndex(
                name: "ix_users_person_document",
                table: "users",
                column: "person_document");

            migrationBuilder.CreateIndex(
                name: "ix_users_user_name",
                table: "users",
                column: "user_name",
                unique: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Experiences");

            migrationBuilder.DropTable(
                name: "professor");

            migrationBuilder.DropTable(
                name: "students");

            migrationBuilder.DropTable(
                name: "studies");

            migrationBuilder.DropTable(
                name: "users");

            migrationBuilder.DropTable(
                name: "academics_program");

            migrationBuilder.DropTable(
                name: "people");

            migrationBuilder.DropTable(
                name: "cities");

            migrationBuilder.DropTable(
                name: "departments");
        }
    }
}
