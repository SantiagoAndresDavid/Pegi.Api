namespace Api.Controllers.People;

public record CreatePersonRequest(
    string Document,
    string IdentificationType,
    string FirstName,
    string SecondName,
    string FirstLastName,
    string SecondLastName,
    string CivilState,
    string Gender,
    DateTime BirthDate,
    string Phone,
    string InstitutionalMail,
    string CitiesCode
    // ICollection<CreateStudyRequest>Studies,
    //ICollection<CreateExperienceRequest>Experiences
);
