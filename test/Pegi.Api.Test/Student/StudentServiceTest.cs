using FluentAssertions;
using Moq;
using Services;

namespace Pegi.Api.Test.Student;

public class StudentServiceTest
{
    private StudentsService _studentsService;

    [SetUp]
    public void SetUp()
    {
        _studentsService = new StudentsService(StudentRepositoryMock.StudentMock());
    }

    [Test]
    public void SaveStudentTest()
    {
        var (message, status) = _studentsService.SaveStudent(StudentStub.Student);
        _studentsService.Should().HaveBeenCalledSave(Times.AtLeastOnce());
        status.Should().BeTrue();
    }
}
