namespace Api.Controllers.Proyect;

public record ProyectResponse(string? Code, string? PersonDocument,
    string? Content, string? Status, int? Score, string? ThematicAreaCode);
