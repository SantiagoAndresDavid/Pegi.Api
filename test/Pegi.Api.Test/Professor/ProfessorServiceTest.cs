using FluentAssertions;
using Moq;
using Services;

namespace Pegi.Api.Test.Professor;

public class ProfessorServiceTest
{
    private ProfessorService _professorService;

    [SetUp]
    public void SetUp()
    {
        _professorService = new ProfessorService(ProfessorRepositoryMock.ProfessorMock());
    }

    [Test]
    public void SaveProfessorTest()
    {
        var (message, status) = _professorService.SaveProfessor(ProfessorStub.Professor);
        _professorService.Should().HaveBeenCalledSave(Times.AtLeastOnce());
        status.Should().BeTrue();
    }
}
