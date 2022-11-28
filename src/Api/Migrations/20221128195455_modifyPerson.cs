using System;
using Microsoft.EntityFrameworkCore.Metadata;
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
                name: "Porposal_feedback",
                columns: table => new
                {
                    code = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    comment = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    status = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    date = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_porposal_feedback", x => x.code);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "research_lines",
                columns: table => new
                {
                    code = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_research_lines", x => x.code);
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
                name: "research_sublines",
                columns: table => new
                {
                    code = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    research_line_code = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_research_sublines", x => x.code);
                    table.ForeignKey(
                        name: "fk_research_sublines_research_lines_research_line_code",
                        column: x => x.research_line_code,
                        principalTable: "research_lines",
                        principalColumn: "code");
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
                    person_first_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    person_second_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    person_first_last_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    person_second_last_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    person_civil_state = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    person_gender = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    person_birth_date = table.Column<DateTime>(type: "datetime(6)", nullable: true),
                    person_phone = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    person_institutional_email = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    cities_code = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_people", x => x.document);
                    table.ForeignKey(
                        name: "fk_people_cities_cities_code",
                        column: x => x.cities_code,
                        principalTable: "cities",
                        principalColumn: "city_id");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Thematic_areas",
                columns: table => new
                {
                    code = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    research_subline_code = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_thematic_areas", x => x.code);
                    table.ForeignKey(
                        name: "fk_thematic_areas_research_sublines_research_subline_code",
                        column: x => x.research_subline_code,
                        principalTable: "research_sublines",
                        principalColumn: "code");
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
                    user_password = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    user_rol = table.Column<string>(type: "longtext", nullable: true)
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

            migrationBuilder.CreateTable(
                name: "proposals",
                columns: table => new
                {
                    code = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    person_document = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    title = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    date = table.Column<DateTime>(type: "datetime(6)", nullable: true),
                    investigationGroup = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    approach = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    justification = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    generalObjective = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    specificObjective = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    biblioGraphical = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    status = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    thematic_area_code = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_proposals", x => x.code);
                    table.ForeignKey(
                        name: "fk_proposals_people_person_document",
                        column: x => x.person_document,
                        principalTable: "people",
                        principalColumn: "document");
                    table.ForeignKey(
                        name: "fk_proposals_thematic_areas_thematic_area_code",
                        column: x => x.thematic_area_code,
                        principalTable: "Thematic_areas",
                        principalColumn: "code");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "proyects",
                columns: table => new
                {
                    code = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    person_document = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Content = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Status = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Score = table.Column<int>(type: "int", nullable: true),
                    thematic_area_code = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_proyects", x => x.code);
                    table.ForeignKey(
                        name: "fk_proyects_people_person_document",
                        column: x => x.person_document,
                        principalTable: "people",
                        principalColumn: "document");
                    table.ForeignKey(
                        name: "fk_proyects_thematic_areas_thematic_area_code",
                        column: x => x.thematic_area_code,
                        principalTable: "Thematic_areas",
                        principalColumn: "code");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "history_proposals",
                columns: table => new
                {
                    code = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    porposal_feed_back_code = table.Column<int>(type: "int", nullable: true),
                    proposal_code = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_history_proposals", x => x.code);
                    table.ForeignKey(
                        name: "fk_history_proposals_porposal_feedback_porposal_feed_back_code",
                        column: x => x.porposal_feed_back_code,
                        principalTable: "Porposal_feedback",
                        principalColumn: "code");
                    table.ForeignKey(
                        name: "fk_history_proposals_proposals_proposal_code",
                        column: x => x.proposal_code,
                        principalTable: "proposals",
                        principalColumn: "code");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Student_Proposal",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    proposal_code = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    student_code = table.Column<string>(type: "varchar(255)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_student_proposal", x => x.id);
                    table.ForeignKey(
                        name: "fk_student_proposal_proposals_proposal_code",
                        column: x => x.proposal_code,
                        principalTable: "proposals",
                        principalColumn: "code");
                    table.ForeignKey(
                        name: "fk_student_proposal_students_student_code",
                        column: x => x.student_code,
                        principalTable: "students",
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
                name: "ix_history_proposals_porposal_feed_back_code",
                table: "history_proposals",
                column: "porposal_feed_back_code");

            migrationBuilder.CreateIndex(
                name: "ix_history_proposals_proposal_code",
                table: "history_proposals",
                column: "proposal_code");

            migrationBuilder.CreateIndex(
                name: "ix_people_cities_code",
                table: "people",
                column: "cities_code");

            migrationBuilder.CreateIndex(
                name: "ix_proposals_person_document",
                table: "proposals",
                column: "person_document");

            migrationBuilder.CreateIndex(
                name: "ix_proposals_thematic_area_code",
                table: "proposals",
                column: "thematic_area_code");

            migrationBuilder.CreateIndex(
                name: "ix_proyects_person_document",
                table: "proyects",
                column: "person_document");

            migrationBuilder.CreateIndex(
                name: "ix_proyects_thematic_area_code",
                table: "proyects",
                column: "thematic_area_code");

            migrationBuilder.CreateIndex(
                name: "ix_research_sublines_research_line_code",
                table: "research_sublines",
                column: "research_line_code");

            migrationBuilder.CreateIndex(
                name: "ix_student_proposal_proposal_code",
                table: "Student_Proposal",
                column: "proposal_code");

            migrationBuilder.CreateIndex(
                name: "ix_student_proposal_student_code",
                table: "Student_Proposal",
                column: "student_code");

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
                name: "ix_thematic_areas_research_subline_code",
                table: "Thematic_areas",
                column: "research_subline_code");

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
                name: "history_proposals");

            migrationBuilder.DropTable(
                name: "professor");

            migrationBuilder.DropTable(
                name: "proyects");

            migrationBuilder.DropTable(
                name: "Student_Proposal");

            migrationBuilder.DropTable(
                name: "studies");

            migrationBuilder.DropTable(
                name: "users");

            migrationBuilder.DropTable(
                name: "Porposal_feedback");

            migrationBuilder.DropTable(
                name: "proposals");

            migrationBuilder.DropTable(
                name: "students");

            migrationBuilder.DropTable(
                name: "Thematic_areas");

            migrationBuilder.DropTable(
                name: "academics_program");

            migrationBuilder.DropTable(
                name: "people");

            migrationBuilder.DropTable(
                name: "research_sublines");

            migrationBuilder.DropTable(
                name: "cities");

            migrationBuilder.DropTable(
                name: "research_lines");

            migrationBuilder.DropTable(
                name: "departments");
        }
    }
}
