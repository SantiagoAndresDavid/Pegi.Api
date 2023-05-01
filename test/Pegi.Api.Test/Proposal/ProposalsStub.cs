namespace Pegi.Api.Test.Proposal;

public class ProposalsStub
{
    public static readonly List<Entities.Proposal> Proposals = new List<Entities.Proposal>()
    {
        new Entities.Proposal()
        {
            Code = "a1",
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
        },
        new Entities.Proposal()
        {
            Code = "a2",
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
        },
        new Entities.Proposal()
        {
            Code = "a3",
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
        }
        // Puedes añadir más usuarios a la lista si es necesario
    };
}
