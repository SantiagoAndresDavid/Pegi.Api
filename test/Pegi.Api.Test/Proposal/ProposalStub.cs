namespace Pegi.Api.Test.Proposal;

public class ProposalStub
{
    public static readonly Entities.Proposal Proposal = new()
    {
        Code = "a",
        PersonDocument = "a",
        Title = "a",
        Date = new DateTime(2000, 5, 15),
        InvestigationGroup = "a",
        Approach = "a",
        Justification = "a",
        GeneralObjective = "a",
        SpecificObjective = "a",
        Bibliographical = "a",
        Status = "a",
        ThematicAreaCode = "a"
    };

    public static readonly Entities.Proposal BadProposal = new()
    {
        Code = "",
        PersonDocument = "",
        Title = "a",
        Date = new DateTime(2000, 5, 15),
        InvestigationGroup = "a",
        Approach = "a",
        Justification = "a",
        GeneralObjective = "a",
        SpecificObjective = "a",
        Bibliographical = "a",
        Status = "a",
        ThematicAreaCode = "a"
    };
}
