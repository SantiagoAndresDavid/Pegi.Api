using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entities;

[Table("Student_Proposal")]
public class StudentProposal
{
    [Key] public int? id { get; set; }

    public string? ProposalCode { get; set; }
    [ForeignKey("ProposalCode")] public Proposal? Proposal { get; set; }

    public string? StudentCode { get; set; }
    [ForeignKey("StudentCode")] public Student? Student { get; set; }
}
