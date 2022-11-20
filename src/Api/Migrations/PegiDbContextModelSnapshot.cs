﻿// <auto-generated />
using System;
using Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace Api.Migrations
{
    [DbContext(typeof(PegiDbContext))]
    partial class PegiDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.7")
                .HasAnnotation("Relational:MaxIdentifierLength", 64);

            modelBuilder.Entity("Entities.AcademicProgram", b =>
                {
                    b.Property<string>("Code")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("code_program");

                    b.Property<string>("Name")
                        .HasColumnType("longtext")
                        .HasColumnName("name");

                    b.HasKey("Code")
                        .HasName("pk_academics_program");

                    b.ToTable("academics_program", (string)null);
                });

            modelBuilder.Entity("Entities.City", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("city_id");

                    b.Property<string>("DepartmentCode")
                        .IsRequired()
                        .HasColumnType("varchar(255)")
                        .HasColumnName("department_code");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("longtext")
                        .HasColumnName("city_name");

                    b.HasKey("Id")
                        .HasName("pk_cities");

                    b.HasIndex("DepartmentCode")
                        .HasDatabaseName("ix_cities_department_code");

                    b.ToTable("cities", (string)null);
                });

            modelBuilder.Entity("Entities.Department", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("department_id");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("longtext")
                        .HasColumnName("deparment_name");

                    b.HasKey("Id")
                        .HasName("pk_departments");

                    b.ToTable("departments", (string)null);
                });

            modelBuilder.Entity("Entities.Experience", b =>
                {
                    b.Property<string>("Code")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("experience_code");

                    b.Property<string>("CitiesCode")
                        .IsRequired()
                        .HasColumnType("varchar(255)")
                        .HasColumnName("cities_code");

                    b.Property<DateTime>("EndDate")
                        .HasColumnType("datetime(6)")
                        .HasColumnName("study_end_date");

                    b.Property<string>("Institution")
                        .IsRequired()
                        .HasColumnType("longtext")
                        .HasColumnName("experience_institution");

                    b.Property<string>("PeopleCode")
                        .IsRequired()
                        .HasColumnType("varchar(255)")
                        .HasColumnName("people_code");

                    b.Property<string>("Position")
                        .IsRequired()
                        .HasColumnType("longtext")
                        .HasColumnName("experience_position");

                    b.Property<DateTime>("StartDate")
                        .HasColumnType("datetime(6)")
                        .HasColumnName("study_start_date");

                    b.HasKey("Code")
                        .HasName("pk_experiences");

                    b.HasIndex("CitiesCode")
                        .HasDatabaseName("ix_experiences_cities_code");

                    b.HasIndex("PeopleCode")
                        .HasDatabaseName("ix_experiences_people_code");

                    b.ToTable("Experiences");
                });

            modelBuilder.Entity("Entities.Person", b =>
                {
                    b.Property<string>("Document")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("document");

                    b.Property<DateTime?>("BirthDate")
                        .HasColumnType("datetime(6)")
                        .HasColumnName("person_birth_date");

                    b.Property<string>("CitiesCode")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("cities_code");

                    b.Property<string>("CivilState")
                        .HasColumnType("longtext")
                        .HasColumnName("person_civil_state");

                    b.Property<string>("FirstLastName")
                        .HasColumnType("longtext")
                        .HasColumnName("person_first_last_name");

                    b.Property<string>("FirstName")
                        .HasColumnType("longtext")
                        .HasColumnName("person_first_name");

                    b.Property<string>("Gender")
                        .HasColumnType("longtext")
                        .HasColumnName("person_gender");

                    b.Property<string>("IdentificationType")
                        .IsRequired()
                        .HasColumnType("longtext")
                        .HasColumnName("person_identification_type");

                    b.Property<string>("InstitutionalMail")
                        .HasColumnType("longtext")
                        .HasColumnName("person_institutional_email");

                    b.Property<string>("Phone")
                        .HasColumnType("longtext")
                        .HasColumnName("person_phone");

                    b.Property<string>("SecondLastName")
                        .HasColumnType("longtext")
                        .HasColumnName("person_second_last_name");

                    b.Property<string>("SecondName")
                        .HasColumnType("longtext")
                        .HasColumnName("person_second_name");

                    b.HasKey("Document")
                        .HasName("pk_people");

                    b.HasIndex("CitiesCode")
                        .HasDatabaseName("ix_people_cities_code");

                    b.ToTable("people", (string)null);
                });

            modelBuilder.Entity("Entities.Professor", b =>
                {
                    b.Property<string>("Document")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("document");

                    b.Property<string>("Position")
                        .HasColumnType("longtext")
                        .HasColumnName("position");

                    b.HasKey("Document")
                        .HasName("pk_professor");

                    b.ToTable("professor", (string)null);
                });

            modelBuilder.Entity("Entities.Proposal", b =>
                {
                    b.Property<string>("Code")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("code");

                    b.Property<string>("Approach")
                        .HasColumnType("longtext")
                        .HasColumnName("approach");

                    b.Property<string>("Bibliographical")
                        .HasColumnType("longtext")
                        .HasColumnName("biblioGraphical");

                    b.Property<DateTime?>("Date")
                        .HasColumnType("datetime(6)")
                        .HasColumnName("date");

                    b.Property<string>("GeneralObjective")
                        .HasColumnType("longtext")
                        .HasColumnName("generalObjective");

                    b.Property<string>("InvestigationGroup")
                        .HasColumnType("longtext")
                        .HasColumnName("investigationGroup");

                    b.Property<string>("Justification")
                        .HasColumnType("longtext")
                        .HasColumnName("justification");

                    b.Property<string>("SpecificObjective")
                        .HasColumnType("longtext")
                        .HasColumnName("specificObjective");

                    b.Property<string>("Status")
                        .HasColumnType("longtext")
                        .HasColumnName("status");

                    b.Property<string>("ThematicAreaCode")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("thematic_area_code");

                    b.Property<string>("Title")
                        .HasColumnType("longtext")
                        .HasColumnName("title");

                    b.HasKey("Code")
                        .HasName("pk_proposals");

                    b.HasIndex("ThematicAreaCode")
                        .HasDatabaseName("ix_proposals_thematic_area_code");

                    b.ToTable("proposals", (string)null);
                });

            modelBuilder.Entity("Entities.ResearchLine", b =>
                {
                    b.Property<string>("Code")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("code");

                    b.Property<string>("Name")
                        .HasColumnType("longtext")
                        .HasColumnName("name");

                    b.HasKey("Code")
                        .HasName("pk_research_lines");

                    b.ToTable("research_lines", (string)null);
                });

            modelBuilder.Entity("Entities.ResearchSubline", b =>
                {
                    b.Property<string>("Code")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("code");

                    b.Property<string>("Name")
                        .HasColumnType("longtext")
                        .HasColumnName("name");

                    b.Property<string>("ResearchLineCode")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("research_line_code");

                    b.HasKey("Code")
                        .HasName("pk_research_sublines");

                    b.HasIndex("ResearchLineCode")
                        .HasDatabaseName("ix_research_sublines_research_line_code");

                    b.ToTable("research_sublines", (string)null);
                });

            modelBuilder.Entity("Entities.Student", b =>
                {
                    b.Property<string>("Document")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("document");

                    b.Property<string>("AcademicProgramCode")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("academic_program_code");

                    b.Property<int>("AmountCredits")
                        .HasColumnType("int")
                        .HasColumnName("amount_credits");

                    b.HasKey("Document")
                        .HasName("pk_students");

                    b.HasIndex("AcademicProgramCode")
                        .HasDatabaseName("ix_students_academic_program_code");

                    b.ToTable("students", (string)null);
                });

            modelBuilder.Entity("Entities.StudentProposal", b =>
                {
                    b.Property<int?>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("id");

                    b.Property<string>("ProposalCode")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("proposal_code");

                    b.Property<string>("StudentCode")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("student_code");

                    b.HasKey("id")
                        .HasName("pk_student_proposal");

                    b.HasIndex("ProposalCode")
                        .HasDatabaseName("ix_student_proposal_proposal_code");

                    b.HasIndex("StudentCode")
                        .HasDatabaseName("ix_student_proposal_student_code");

                    b.ToTable("Student_Proposal");
                });

            modelBuilder.Entity("Entities.Study", b =>
                {
                    b.Property<string>("Code")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("study_code");

                    b.Property<string>("CitiesCode")
                        .IsRequired()
                        .HasColumnType("varchar(255)")
                        .HasColumnName("cities_code");

                    b.Property<DateTime>("EndDate")
                        .HasColumnType("datetime(6)")
                        .HasColumnName("study_end_date");

                    b.Property<string>("Institution")
                        .IsRequired()
                        .HasColumnType("longtext")
                        .HasColumnName("study_institution");

                    b.Property<string>("PeopleCode")
                        .IsRequired()
                        .HasColumnType("varchar(255)")
                        .HasColumnName("people_code");

                    b.Property<DateTime>("StartDate")
                        .HasColumnType("datetime(6)")
                        .HasColumnName("study_start_date");

                    b.HasKey("Code")
                        .HasName("pk_studies");

                    b.HasIndex("CitiesCode")
                        .HasDatabaseName("ix_studies_cities_code");

                    b.HasIndex("PeopleCode")
                        .HasDatabaseName("ix_studies_people_code");

                    b.ToTable("studies", (string)null);
                });

            modelBuilder.Entity("Entities.ThematicArea", b =>
                {
                    b.Property<string>("Code")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("code");

                    b.Property<string>("Name")
                        .HasColumnType("longtext")
                        .HasColumnName("name");

                    b.Property<string>("ResearchSublineCode")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("research_subline_code");

                    b.HasKey("Code")
                        .HasName("pk_thematic_areas");

                    b.HasIndex("ResearchSublineCode")
                        .HasDatabaseName("ix_thematic_areas_research_subline_code");

                    b.ToTable("Thematic_areas");
                });

            modelBuilder.Entity("Entities.User", b =>
                {
                    b.Property<string>("Name")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("user_name");

                    b.Property<string>("Password")
                        .HasColumnType("longtext")
                        .HasColumnName("user_password");

                    b.Property<string>("PersonDocument")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("person_document");

                    b.Property<string>("Role")
                        .HasColumnType("longtext")
                        .HasColumnName("user_rol");

                    b.HasKey("Name")
                        .HasName("pk_users");

                    b.HasIndex("Name")
                        .IsUnique()
                        .HasDatabaseName("ix_users_user_name");

                    b.HasIndex("PersonDocument")
                        .HasDatabaseName("ix_users_person_document");

                    b.ToTable("users", (string)null);
                });

            modelBuilder.Entity("Entities.City", b =>
                {
                    b.HasOne("Entities.Department", "Department")
                        .WithMany()
                        .HasForeignKey("DepartmentCode")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("fk_cities_departments_department_code");

                    b.Navigation("Department");
                });

            modelBuilder.Entity("Entities.Experience", b =>
                {
                    b.HasOne("Entities.City", "City")
                        .WithMany()
                        .HasForeignKey("CitiesCode")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("fk_experiences_cities_cities_code");

                    b.HasOne("Entities.Person", "Person")
                        .WithMany()
                        .HasForeignKey("PeopleCode")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("fk_experiences_people_people_code");

                    b.Navigation("City");

                    b.Navigation("Person");
                });

            modelBuilder.Entity("Entities.Person", b =>
                {
                    b.HasOne("Entities.City", "City")
                        .WithMany()
                        .HasForeignKey("CitiesCode")
                        .HasConstraintName("fk_people_cities_cities_code");

                    b.Navigation("City");
                });

            modelBuilder.Entity("Entities.Professor", b =>
                {
                    b.HasOne("Entities.Person", "Person")
                        .WithMany()
                        .HasForeignKey("Document")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("fk_professor_people_document");

                    b.Navigation("Person");
                });

            modelBuilder.Entity("Entities.Proposal", b =>
                {
                    b.HasOne("Entities.ThematicArea", "ThematicArea")
                        .WithMany()
                        .HasForeignKey("ThematicAreaCode")
                        .HasConstraintName("fk_proposals_thematic_areas_thematic_area_code");

                    b.Navigation("ThematicArea");
                });

            modelBuilder.Entity("Entities.ResearchSubline", b =>
                {
                    b.HasOne("Entities.ResearchLine", "ResearchLine")
                        .WithMany()
                        .HasForeignKey("ResearchLineCode")
                        .HasConstraintName("fk_research_sublines_research_lines_research_line_code");

                    b.Navigation("ResearchLine");
                });

            modelBuilder.Entity("Entities.Student", b =>
                {
                    b.HasOne("Entities.AcademicProgram", "AcademicProgram")
                        .WithMany()
                        .HasForeignKey("AcademicProgramCode")
                        .HasConstraintName("fk_students_academics_program_academic_program_code");

                    b.HasOne("Entities.Person", "Person")
                        .WithMany()
                        .HasForeignKey("Document")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("fk_students_people_document");

                    b.Navigation("AcademicProgram");

                    b.Navigation("Person");
                });

            modelBuilder.Entity("Entities.StudentProposal", b =>
                {
                    b.HasOne("Entities.Proposal", "Proposal")
                        .WithMany()
                        .HasForeignKey("ProposalCode")
                        .HasConstraintName("fk_student_proposal_proposals_proposal_code");

                    b.HasOne("Entities.Student", "Student")
                        .WithMany()
                        .HasForeignKey("StudentCode")
                        .HasConstraintName("fk_student_proposal_students_student_code");

                    b.Navigation("Proposal");

                    b.Navigation("Student");
                });

            modelBuilder.Entity("Entities.Study", b =>
                {
                    b.HasOne("Entities.City", "City")
                        .WithMany()
                        .HasForeignKey("CitiesCode")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("fk_studies_cities_cities_code");

                    b.HasOne("Entities.Person", "Person")
                        .WithMany()
                        .HasForeignKey("PeopleCode")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("fk_studies_people_people_code");

                    b.Navigation("City");

                    b.Navigation("Person");
                });

            modelBuilder.Entity("Entities.ThematicArea", b =>
                {
                    b.HasOne("Entities.ResearchSubline", "ResearchSubline")
                        .WithMany()
                        .HasForeignKey("ResearchSublineCode")
                        .HasConstraintName("fk_thematic_areas_research_sublines_research_subline_code");

                    b.Navigation("ResearchSubline");
                });

            modelBuilder.Entity("Entities.User", b =>
                {
                    b.HasOne("Entities.Person", "Person")
                        .WithMany()
                        .HasForeignKey("PersonDocument")
                        .HasConstraintName("fk_users_people_person_document");

                    b.Navigation("Person");
                });
#pragma warning restore 612, 618
        }
    }
}
