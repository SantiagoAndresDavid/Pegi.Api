using System;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace Api.Migrations
{
    /// <inheritdoc />
    public partial class InitialCreate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "academics_program",
                columns: table => new
                {
                    code_program = table.Column<string>(type: "text", nullable: false),
                    name = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_academics_program", x => x.code_program);
                });

            migrationBuilder.CreateTable(
                name: "departments",
                columns: table => new
                {
                    department_id = table.Column<string>(type: "text", nullable: false),
                    deparment_name = table.Column<string>(type: "text", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_departments", x => x.department_id);
                });

            migrationBuilder.CreateTable(
                name: "Porposal_feedback",
                columns: table => new
                {
                    code = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    comment = table.Column<string>(type: "text", nullable: true),
                    status = table.Column<string>(type: "text", nullable: true),
                    date = table.Column<DateTime>(type: "timestamp with time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Porposal_feedback", x => x.code);
                });

            migrationBuilder.CreateTable(
                name: "ProyectFeedBacks",
                columns: table => new
                {
                    code = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    comment = table.Column<string>(type: "text", nullable: true),
                    status = table.Column<string>(type: "text", nullable: true),
                    Score = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProyectFeedBacks", x => x.code);
                });

            migrationBuilder.CreateTable(
                name: "research_lines",
                columns: table => new
                {
                    code = table.Column<string>(type: "text", nullable: false),
                    name = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_research_lines", x => x.code);
                });

            migrationBuilder.CreateTable(
                name: "cities",
                columns: table => new
                {
                    city_id = table.Column<string>(type: "text", nullable: false),
                    city_name = table.Column<string>(type: "text", nullable: false),
                    DepartmentCode = table.Column<string>(type: "text", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_cities", x => x.city_id);
                    table.ForeignKey(
                        name: "FK_cities_departments_DepartmentCode",
                        column: x => x.DepartmentCode,
                        principalTable: "departments",
                        principalColumn: "department_id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "research_sublines",
                columns: table => new
                {
                    code = table.Column<string>(type: "text", nullable: false),
                    name = table.Column<string>(type: "text", nullable: true),
                    ResearchLineCode = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_research_sublines", x => x.code);
                    table.ForeignKey(
                        name: "FK_research_sublines_research_lines_ResearchLineCode",
                        column: x => x.ResearchLineCode,
                        principalTable: "research_lines",
                        principalColumn: "code");
                });

            migrationBuilder.CreateTable(
                name: "people",
                columns: table => new
                {
                    document = table.Column<string>(type: "text", nullable: false),
                    person_identification_type = table.Column<string>(type: "text", nullable: false),
                    person_first_name = table.Column<string>(type: "text", nullable: true),
                    person_second_name = table.Column<string>(type: "text", nullable: true),
                    person_first_last_name = table.Column<string>(type: "text", nullable: true),
                    person_second_last_name = table.Column<string>(type: "text", nullable: true),
                    person_civil_state = table.Column<string>(type: "text", nullable: true),
                    person_gender = table.Column<string>(type: "text", nullable: true),
                    person_birth_date = table.Column<DateTime>(type: "timestamp with time zone", nullable: true),
                    person_phone = table.Column<string>(type: "text", nullable: true),
                    person_institutional_email = table.Column<string>(type: "text", nullable: true),
                    CitiesCode = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_people", x => x.document);
                    table.ForeignKey(
                        name: "FK_people_cities_CitiesCode",
                        column: x => x.CitiesCode,
                        principalTable: "cities",
                        principalColumn: "city_id");
                });

            migrationBuilder.CreateTable(
                name: "Thematic_areas",
                columns: table => new
                {
                    code = table.Column<string>(type: "text", nullable: false),
                    name = table.Column<string>(type: "text", nullable: true),
                    ResearchSublineCode = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Thematic_areas", x => x.code);
                    table.ForeignKey(
                        name: "FK_Thematic_areas_research_sublines_ResearchSublineCode",
                        column: x => x.ResearchSublineCode,
                        principalTable: "research_sublines",
                        principalColumn: "code");
                });

            migrationBuilder.CreateTable(
                name: "Experiences",
                columns: table => new
                {
                    experience_code = table.Column<string>(type: "text", nullable: false),
                    experience_institution = table.Column<string>(type: "text", nullable: false),
                    study_start_date = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    study_end_date = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    CitiesCode = table.Column<string>(type: "text", nullable: false),
                    PeopleCode = table.Column<string>(type: "text", nullable: false),
                    experience_position = table.Column<string>(type: "text", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Experiences", x => x.experience_code);
                    table.ForeignKey(
                        name: "FK_Experiences_cities_CitiesCode",
                        column: x => x.CitiesCode,
                        principalTable: "cities",
                        principalColumn: "city_id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Experiences_people_PeopleCode",
                        column: x => x.PeopleCode,
                        principalTable: "people",
                        principalColumn: "document",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "professor",
                columns: table => new
                {
                    Document = table.Column<string>(type: "text", nullable: false),
                    position = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_professor", x => x.Document);
                    table.ForeignKey(
                        name: "FK_professor_people_Document",
                        column: x => x.Document,
                        principalTable: "people",
                        principalColumn: "document",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "students",
                columns: table => new
                {
                    Document = table.Column<string>(type: "text", nullable: false),
                    amount_credits = table.Column<string>(type: "text", nullable: true),
                    AcademicProgramCode = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_students", x => x.Document);
                    table.ForeignKey(
                        name: "FK_students_academics_program_AcademicProgramCode",
                        column: x => x.AcademicProgramCode,
                        principalTable: "academics_program",
                        principalColumn: "code_program");
                    table.ForeignKey(
                        name: "FK_students_people_Document",
                        column: x => x.Document,
                        principalTable: "people",
                        principalColumn: "document",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "studies",
                columns: table => new
                {
                    study_code = table.Column<string>(type: "text", nullable: false),
                    study_institution = table.Column<string>(type: "text", nullable: false),
                    study_start_date = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    study_end_date = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    CitiesCode = table.Column<string>(type: "text", nullable: false),
                    PeopleCode = table.Column<string>(type: "text", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_studies", x => x.study_code);
                    table.ForeignKey(
                        name: "FK_studies_cities_CitiesCode",
                        column: x => x.CitiesCode,
                        principalTable: "cities",
                        principalColumn: "city_id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_studies_people_PeopleCode",
                        column: x => x.PeopleCode,
                        principalTable: "people",
                        principalColumn: "document",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "users",
                columns: table => new
                {
                    user_name = table.Column<string>(type: "text", nullable: false),
                    user_password = table.Column<string>(type: "text", nullable: true),
                    user_rol = table.Column<string>(type: "text", nullable: true),
                    PersonDocument = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_users", x => x.user_name);
                    table.ForeignKey(
                        name: "FK_users_people_PersonDocument",
                        column: x => x.PersonDocument,
                        principalTable: "people",
                        principalColumn: "document");
                });

            migrationBuilder.CreateTable(
                name: "proposals",
                columns: table => new
                {
                    code = table.Column<string>(type: "text", nullable: false),
                    PersonDocument = table.Column<string>(type: "text", nullable: true),
                    title = table.Column<string>(type: "text", nullable: true),
                    date = table.Column<DateTime>(type: "timestamp with time zone", nullable: true),
                    investigationGroup = table.Column<string>(type: "text", nullable: true),
                    approach = table.Column<string>(type: "text", nullable: true),
                    justification = table.Column<string>(type: "text", nullable: true),
                    generalObjective = table.Column<string>(type: "text", nullable: true),
                    specificObjective = table.Column<string>(type: "text", nullable: true),
                    biblioGraphical = table.Column<string>(type: "text", nullable: true),
                    status = table.Column<string>(type: "text", nullable: true),
                    ThematicAreaCode = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_proposals", x => x.code);
                    table.ForeignKey(
                        name: "FK_proposals_Thematic_areas_ThematicAreaCode",
                        column: x => x.ThematicAreaCode,
                        principalTable: "Thematic_areas",
                        principalColumn: "code");
                    table.ForeignKey(
                        name: "FK_proposals_students_PersonDocument",
                        column: x => x.PersonDocument,
                        principalTable: "students",
                        principalColumn: "Document");
                });

            migrationBuilder.CreateTable(
                name: "proyects",
                columns: table => new
                {
                    code = table.Column<string>(type: "text", nullable: false),
                    PersonDocument = table.Column<string>(type: "text", nullable: true),
                    Content = table.Column<string>(type: "text", nullable: true),
                    Status = table.Column<string>(type: "text", nullable: true),
                    Score = table.Column<int>(type: "integer", nullable: true),
                    ThematicAreaCode = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_proyects", x => x.code);
                    table.ForeignKey(
                        name: "FK_proyects_Thematic_areas_ThematicAreaCode",
                        column: x => x.ThematicAreaCode,
                        principalTable: "Thematic_areas",
                        principalColumn: "code");
                    table.ForeignKey(
                        name: "FK_proyects_students_PersonDocument",
                        column: x => x.PersonDocument,
                        principalTable: "students",
                        principalColumn: "Document");
                });

            migrationBuilder.CreateTable(
                name: "history_proposals",
                columns: table => new
                {
                    code = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    PorposalFeedBackCode = table.Column<int>(type: "integer", nullable: true),
                    ProposalCode = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_history_proposals", x => x.code);
                    table.ForeignKey(
                        name: "FK_history_proposals_Porposal_feedback_PorposalFeedBackCode",
                        column: x => x.PorposalFeedBackCode,
                        principalTable: "Porposal_feedback",
                        principalColumn: "code");
                    table.ForeignKey(
                        name: "FK_history_proposals_proposals_ProposalCode",
                        column: x => x.ProposalCode,
                        principalTable: "proposals",
                        principalColumn: "code");
                });

            migrationBuilder.CreateTable(
                name: "HistoryProyects",
                columns: table => new
                {
                    code = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    ProyectFeedBackCode = table.Column<int>(type: "integer", nullable: true),
                    ProyectCode = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_HistoryProyects", x => x.code);
                    table.ForeignKey(
                        name: "FK_HistoryProyects_ProyectFeedBacks_ProyectFeedBackCode",
                        column: x => x.ProyectFeedBackCode,
                        principalTable: "ProyectFeedBacks",
                        principalColumn: "code");
                    table.ForeignKey(
                        name: "FK_HistoryProyects_proyects_ProyectCode",
                        column: x => x.ProyectCode,
                        principalTable: "proyects",
                        principalColumn: "code");
                });

            migrationBuilder.CreateIndex(
                name: "IX_cities_DepartmentCode",
                table: "cities",
                column: "DepartmentCode");

            migrationBuilder.CreateIndex(
                name: "IX_Experiences_CitiesCode",
                table: "Experiences",
                column: "CitiesCode");

            migrationBuilder.CreateIndex(
                name: "IX_Experiences_PeopleCode",
                table: "Experiences",
                column: "PeopleCode");

            migrationBuilder.CreateIndex(
                name: "IX_history_proposals_PorposalFeedBackCode",
                table: "history_proposals",
                column: "PorposalFeedBackCode");

            migrationBuilder.CreateIndex(
                name: "IX_history_proposals_ProposalCode",
                table: "history_proposals",
                column: "ProposalCode");

            migrationBuilder.CreateIndex(
                name: "IX_HistoryProyects_ProyectCode",
                table: "HistoryProyects",
                column: "ProyectCode");

            migrationBuilder.CreateIndex(
                name: "IX_HistoryProyects_ProyectFeedBackCode",
                table: "HistoryProyects",
                column: "ProyectFeedBackCode");

            migrationBuilder.CreateIndex(
                name: "IX_people_CitiesCode",
                table: "people",
                column: "CitiesCode");

            migrationBuilder.CreateIndex(
                name: "IX_proposals_PersonDocument",
                table: "proposals",
                column: "PersonDocument");

            migrationBuilder.CreateIndex(
                name: "IX_proposals_ThematicAreaCode",
                table: "proposals",
                column: "ThematicAreaCode");

            migrationBuilder.CreateIndex(
                name: "IX_proyects_PersonDocument",
                table: "proyects",
                column: "PersonDocument");

            migrationBuilder.CreateIndex(
                name: "IX_proyects_ThematicAreaCode",
                table: "proyects",
                column: "ThematicAreaCode");

            migrationBuilder.CreateIndex(
                name: "IX_research_sublines_ResearchLineCode",
                table: "research_sublines",
                column: "ResearchLineCode");

            migrationBuilder.CreateIndex(
                name: "IX_students_AcademicProgramCode",
                table: "students",
                column: "AcademicProgramCode");

            migrationBuilder.CreateIndex(
                name: "IX_studies_CitiesCode",
                table: "studies",
                column: "CitiesCode");

            migrationBuilder.CreateIndex(
                name: "IX_studies_PeopleCode",
                table: "studies",
                column: "PeopleCode");

            migrationBuilder.CreateIndex(
                name: "IX_Thematic_areas_ResearchSublineCode",
                table: "Thematic_areas",
                column: "ResearchSublineCode");

            migrationBuilder.CreateIndex(
                name: "IX_users_PersonDocument",
                table: "users",
                column: "PersonDocument");

            migrationBuilder.CreateIndex(
                name: "IX_users_user_name",
                table: "users",
                column: "user_name",
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Experiences");

            migrationBuilder.DropTable(
                name: "history_proposals");

            migrationBuilder.DropTable(
                name: "HistoryProyects");

            migrationBuilder.DropTable(
                name: "professor");

            migrationBuilder.DropTable(
                name: "studies");

            migrationBuilder.DropTable(
                name: "users");

            migrationBuilder.DropTable(
                name: "Porposal_feedback");

            migrationBuilder.DropTable(
                name: "proposals");

            migrationBuilder.DropTable(
                name: "ProyectFeedBacks");

            migrationBuilder.DropTable(
                name: "proyects");

            migrationBuilder.DropTable(
                name: "Thematic_areas");

            migrationBuilder.DropTable(
                name: "students");

            migrationBuilder.DropTable(
                name: "research_sublines");

            migrationBuilder.DropTable(
                name: "academics_program");

            migrationBuilder.DropTable(
                name: "people");

            migrationBuilder.DropTable(
                name: "research_lines");

            migrationBuilder.DropTable(
                name: "cities");

            migrationBuilder.DropTable(
                name: "departments");
        }
    }
}
