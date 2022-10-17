﻿// <auto-generated />
using System;
using Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace Api.Migrations
{
    [DbContext(typeof(PegiDbContext))]
    [Migration("20221017195927_modulePerson")]
    partial class modulePerson
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.7")
                .HasAnnotation("Relational:MaxIdentifierLength", 64);

            modelBuilder.Entity("Entities.City", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("city_id");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("longtext")
                        .HasColumnName("city_name");

                    b.HasKey("Id")
                        .HasName("pk_cities");

                    b.ToTable("cities", (string)null);
                });

            modelBuilder.Entity("Entities.Department", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("department_id");

                    b.Property<string>("CityCode")
                        .IsRequired()
                        .HasColumnType("longtext")
                        .HasColumnName("city_code");

                    b.Property<string>("Citycode")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("citycode");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("longtext")
                        .HasColumnName("deparment_name");

                    b.HasKey("Id")
                        .HasName("pk_departments");

                    b.HasIndex("Citycode")
                        .HasDatabaseName("ix_departments_citycode");

                    b.ToTable("departments", (string)null);
                });

            modelBuilder.Entity("Entities.Person", b =>
                {
                    b.Property<string>("Document")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("person_document");

                    b.Property<DateTime>("BirthDate")
                        .HasColumnType("datetime(6)")
                        .HasColumnName("person_birth_date");

                    b.Property<string>("CivilState")
                        .IsRequired()
                        .HasColumnType("longtext")
                        .HasColumnName("person_civil_state");

                    b.Property<string>("DeparmentCode")
                        .IsRequired()
                        .HasColumnType("varchar(255)")
                        .HasColumnName("deparment_code");

                    b.Property<string>("FirstLastName")
                        .IsRequired()
                        .HasColumnType("longtext")
                        .HasColumnName("person_first_last_name");

                    b.Property<string>("FirstName")
                        .IsRequired()
                        .HasColumnType("longtext")
                        .HasColumnName("person_first_name");

                    b.Property<string>("Gender")
                        .IsRequired()
                        .HasColumnType("longtext")
                        .HasColumnName("person_gender");

                    b.Property<string>("IdentificationType")
                        .IsRequired()
                        .HasColumnType("longtext")
                        .HasColumnName("person_identification_type");

                    b.Property<string>("InstitutionalMail")
                        .IsRequired()
                        .HasColumnType("longtext")
                        .HasColumnName("person_institutional_email");

                    b.Property<string>("Phone")
                        .IsRequired()
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

                    b.HasIndex("DeparmentCode")
                        .HasDatabaseName("ix_people_deparment_code");

                    b.ToTable("people", (string)null);
                });

            modelBuilder.Entity("Entities.Study", b =>
                {
                    b.Property<int>("Code")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("study_code");

                    b.Property<string>("DeparmentCode")
                        .IsRequired()
                        .HasColumnType("varchar(255)")
                        .HasColumnName("deparment_code");

                    b.Property<DateTime>("EndDate")
                        .HasColumnType("datetime(6)")
                        .HasColumnName("study_end_date");

                    b.Property<string>("Institution")
                        .IsRequired()
                        .HasColumnType("longtext")
                        .HasColumnName("study_institution");

                    b.Property<string>("PersonDocument")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("person_document");

                    b.Property<DateTime>("StartDate")
                        .HasColumnType("datetime(6)")
                        .HasColumnName("study_start_date");

                    b.HasKey("Code")
                        .HasName("pk_studies");

                    b.HasIndex("DeparmentCode")
                        .HasDatabaseName("ix_studies_deparment_code");

                    b.HasIndex("PersonDocument")
                        .HasDatabaseName("ix_studies_person_document");

                    b.ToTable("studies", (string)null);
                });

            modelBuilder.Entity("Entities.User", b =>
                {
                    b.Property<string>("Name")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("user_name");

                    b.Property<string>("Password")
                        .IsRequired()
                        .HasColumnType("longtext")
                        .HasColumnName("user_password");

                    b.Property<string>("Role")
                        .IsRequired()
                        .HasColumnType("longtext")
                        .HasColumnName("user_rol");

                    b.Property<string>("person_document")
                        .HasColumnType("varchar(255)")
                        .HasColumnName("person_document");

                    b.HasKey("Name")
                        .HasName("pk_users");

                    b.HasIndex("Name")
                        .IsUnique()
                        .HasDatabaseName("ix_users_user_name");

                    b.HasIndex("person_document")
                        .HasDatabaseName("ix_users_person_document");

                    b.ToTable("users", (string)null);
                });

            modelBuilder.Entity("Entities.Experience", b =>
                {
                    b.HasBaseType("Entities.Person");

                    b.Property<string>("Position")
                        .IsRequired()
                        .HasColumnType("longtext")
                        .HasColumnName("experience_position");

                    b.ToTable("Experiences");
                });

            modelBuilder.Entity("Entities.Department", b =>
                {
                    b.HasOne("Entities.City", "City")
                        .WithMany()
                        .HasForeignKey("Citycode")
                        .HasConstraintName("fk_departments_cities_citycode");

                    b.Navigation("City");
                });

            modelBuilder.Entity("Entities.Person", b =>
                {
                    b.HasOne("Entities.Department", "Department")
                        .WithMany()
                        .HasForeignKey("DeparmentCode")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("fk_people_departments_deparment_code");

                    b.Navigation("Department");
                });

            modelBuilder.Entity("Entities.Study", b =>
                {
                    b.HasOne("Entities.Department", "Department")
                        .WithMany()
                        .HasForeignKey("DeparmentCode")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("fk_studies_departments_deparment_code");

                    b.HasOne("Entities.Person", null)
                        .WithMany("Studies")
                        .HasForeignKey("PersonDocument")
                        .HasConstraintName("fk_studies_people_person_document");

                    b.Navigation("Department");
                });

            modelBuilder.Entity("Entities.User", b =>
                {
                    b.HasOne("Entities.Person", "Person")
                        .WithMany()
                        .HasForeignKey("person_document")
                        .HasConstraintName("fk_users_people_person_document");

                    b.Navigation("Person");
                });

            modelBuilder.Entity("Entities.Experience", b =>
                {
                    b.HasOne("Entities.Person", null)
                        .WithOne()
                        .HasForeignKey("Entities.Experience", "Document")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("fk_experiences_people_person_document");
                });

            modelBuilder.Entity("Entities.Person", b =>
                {
                    b.Navigation("Studies");
                });
#pragma warning restore 612, 618
        }
    }
}