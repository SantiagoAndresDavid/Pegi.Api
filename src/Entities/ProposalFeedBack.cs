using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entities;
[Table("Porposal_feedback")]
public class ProposalFeedBack
{
    [Key] [Column("code")] public string? Code { get; set; }

    [Column("comment")] public string? Comment { get; set; }

    [Column("status")] public string? Status { get; set; }

    [Column("date")] public DateTime? Date { get; set; }

}
