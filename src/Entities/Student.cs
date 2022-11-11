using System.ComponentModel.DataAnnotations.Schema;

namespace Entities;

[Table("students")]
public class Student : Person
{
    public string? ProgramCode { get; set; }
    [ForeignKey("academic_program_code")]
    public AcademicProgram? AcademicProgram { get; set; }

    [Column("amount_credits")]
    public int AmountCredits { get; set; }
}
