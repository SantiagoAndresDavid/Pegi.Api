namespace Pegi.Api.Test;

public class PersonStub
{
    public static readonly Entities.Person Person = new()
    {
        Document = "a",
        IdentificationType = "a",
        FirstName = "a",
        SecondName = "a",
        FirstLastName = "a",
        SecondLastName = "a",
        BirthDate = new DateOnly(2000, 5, 15),
        CivilState = "a",
        Gender = "a",
        Phone = "a",
        InstitutionalMail = "a",
        CitiesCode = "1"
    };
}
