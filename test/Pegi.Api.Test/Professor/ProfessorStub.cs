namespace Pegi.Api.Test.Professor;

public class ProfessorStub
{
    public static readonly Entities.Professor Professor = new()
    {
        Document = "test",
        Position = "testUser@example.com",
    };

    public static readonly Entities.Professor BadUserProfessor = new()
    {
        Document = "",
        Position = "",
    };
}
