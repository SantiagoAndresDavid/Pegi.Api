using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entities;
[Table("history_proposals")]
public class HistoryProposals
{
    [Key] [Column("code")] public string? Code { get; set; }

    public string? PorposalFeedBackCode { get; set; }
    [ForeignKey("PorposalFeedBackCode")]
    public ProposalFeedBack? RProposalFeedBack { get; set; }

    public string? ProposalCode { get; set; }
    [ForeignKey("ProposalCode")]
    public Proposal? Proposal { get; set; }

}
