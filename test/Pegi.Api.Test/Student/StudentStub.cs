namespace Pegi.Api.Test.Student;

public class StudentStub
{
    public static readonly Entities.Student Student = new()
    {
        Document = "test",
        AmountCredits = "testUser@example.com",
        AcademicProgramCode = "1"
    };

    public static readonly Entities.Student BadUStudent = new()
    {
        Document = "",
        AmountCredits = "",
        AcademicProgramCode = ""
    };
}
