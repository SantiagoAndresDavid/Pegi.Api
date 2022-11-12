using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Runtime.InteropServices;

namespace Entities;

[Table("students")]
public class Student
{
    [Key] public string? person_document { get; set; }
    [ForeignKey("person_document")] public Person? Person { get; set; }

    public string? ProgramCode { get; set; }

    [ForeignKey("academic_program_code")]
    public AcademicProgram? AcademicProgram { get; set; }

    [Column("amount_credits")] public int AmountCredits { get; set; }
}
