namespace Pegi.Api.Test.Proyect;

public class ProyectStub
{
    public static readonly Entities.Proyect Proyect = new()
    {
        Code = "a",
        PersonDocument = "a",
        Status = "a",
        ThematicAreaCode = "a",
        Content = "",
        Score = 100
    };

    public static readonly Entities.Proyect BadProyect = new()
    {
        Code = " ",
        PersonDocument = " ",
        Status = "a",
        ThematicAreaCode = "a",
        Content = "",
        Score = 100
    };
}
