namespace Api.Controllers.Proposal;

public record ProposalResponse(string? Code, string? Title, DateTime? Date,
    string? InvestigationGroup, string? Approach, string? Justification,
    string? GeneralObjective, string? SpecificObjective,
    string? Bibliographical, string? Status, string? ThematicAreaCode);
