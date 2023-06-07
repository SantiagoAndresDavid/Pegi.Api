using Data.Repository.shared;
using FluentAssertions.Primitives;
using Microsoft.EntityFrameworkCore;
using Moq;
using Pegi.Api.Test.Professor;

namespace Pegi.Api.Test.Student;

public static class StudentRepositoryMock
{
    private static readonly Mock<IRepository<Entities.Student>> Mock = new();

    private static readonly Action<Entities.Student> BadBehavior = Student =>
    {
        if (Student.Equals(StudentStub.BadUStudent))
            throw new DbUpdateException("");
    };

    public static IRepository<Entities.Student> StudentMock()
    {
        Mock.Setup(repository => repository.Save(It.IsAny<Entities.Student>()))
            .Callback(BadBehavior);
        return Mock.Object;
    }

    public static void HaveBeenCalledSave(this ObjectAssertions objectAssertions, Times times)
    {
        Mock.Verify(repository => repository.Save(It.IsAny<Entities.Student>()),
            times);
    }
}
