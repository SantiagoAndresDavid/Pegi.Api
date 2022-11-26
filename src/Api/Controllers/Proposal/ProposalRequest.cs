namespace Api.Controllers.Proposal;

public record ProposalRequest(string? Code, string? PersonDocument, string? Title, DateTime? Date,
    string? InvestigationGroup, string? Approach, string? Justification,
    string? GeneralObjective, string? SpecificObjective,
    string? Bibliographical, string? Status, string? ThematicAreaCode);
