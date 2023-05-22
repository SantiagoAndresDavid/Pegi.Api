namespace Pegi.Api.Test.Proyect;

public class ProyectStub
{
    public static readonly Entities.Proyect Proyect = new()
    {
        Code = "a",
        PersonDocument = "a",
        Content = "a",
        Status = "a",
        Score = 100,
        ThematicAreaCode = "a"
    };

    public static readonly Entities.Proyect BadProyect = new()
    {
        Code = "a",
        PersonDocument = "a",
        Content = "a",
        Status = "a",
        Score = 100,
        ThematicAreaCode = "a"
    };
}
