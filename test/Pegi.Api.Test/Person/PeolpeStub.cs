namespace Pegi.Api.Test;

public class PeopleStub
{
    public static readonly List<Entities.Person> People = new List<Entities.Person>()
    {
        new Entities.Person()
        {
            Document = "a1",
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
        },
        new Entities.Person()
        {
            Document = "a2",
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
        },
        new Entities.Person()
        {
            Document = "a3",
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
        }
        // Puedes añadir más usuarios a la lista si es necesario
    };
}
