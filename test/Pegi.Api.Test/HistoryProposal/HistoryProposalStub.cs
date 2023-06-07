namespace Pegi.Api.Test.HistoryProposal;

public class HistoryProposalStub
{
    public static readonly Entities.HistoryProposals HistoryProposal = new(porposalFeedBackCode:1,proposalCode:"1")
    {
        Code = 1,
        PorposalFeedBackCode = 1,
        ProposalCode = "1",
    };

    public static readonly Entities.HistoryProposals BadHistoryProposal = new(porposalFeedBackCode:null,proposalCode:null)
    {
        Code = null,
        PorposalFeedBackCode = null,
        ProposalCode = "",
    };
}
