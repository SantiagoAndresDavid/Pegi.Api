namespace Api.Controllers.Proyect;

public record ProyectRequest(string? Code, string? PersonDocument,
    string? Content, string? Status, int? Score, string? ThematicAreaCode);
