using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entities;

[Table(("proposals"))]
public class Proposal
{
    [Key] [Column("code")] public string? Code { get; set; }


    [Column("title")] public string? Title { get; set; }
    [Column("date")] public DateTime? Date { get; set; }

    [Column("investigationGroup")]
    public string? InvestigationGroup { get; set; }

    [Column("approach")] public string? Approach { get; set; }
    [Column("justification")] public string? Justification { get; set; }
    [Column("generalObjective")] public string? GeneralObjective { get; set; }
    [Column("specificObjective")] public string? SpecificObjective { get; set; }
    [Column("biblioGraphical")] public string? Bibliographical { get; set; }
    [Column("status")]public string? Status { get; set; }
}
