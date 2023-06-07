namespace Pegi.Api.Test.HistoryProposal;

public class HistorysProposalStub
{
    public static readonly List<Entities.HistoryProposals> HistoryProposals = new List<Entities.HistoryProposals>()
    {
        new Entities.HistoryProposals(porposalFeedBackCode:1,proposalCode:"1")
        {
            Code = 1,
            PorposalFeedBackCode = 1,
            ProposalCode = "1",
        },
        new Entities.HistoryProposals(porposalFeedBackCode:1,proposalCode:"1")
        {
            Code = 2,
            PorposalFeedBackCode = 1,
            ProposalCode = "1",
        },
        new Entities.HistoryProposals(porposalFeedBackCode:1,proposalCode:"1")
        {
            Code = 3,
            PorposalFeedBackCode = 1,
            ProposalCode = "1",
        }
    };
}
