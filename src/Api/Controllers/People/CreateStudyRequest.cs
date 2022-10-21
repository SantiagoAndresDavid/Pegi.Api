namespace Api.Controllers.People;

public record CreateStudyRequest(
    string Institution,
    DateTime StartDate,
    DateTime EndDate
);
