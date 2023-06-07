using Data.Repository.shared;
using FluentAssertions.Primitives;
using Microsoft.EntityFrameworkCore;
using Moq;

namespace Pegi.Api.Test.Professor;

public static class ProfessorRepositoryMock
{
    private static readonly Mock<IRepository<Entities.Professor>> Mock = new();

    private static readonly Action<Entities.Professor> BadBehavior = Professor =>
    {
        if (Professor.Equals(ProfessorStub.BadUserProfessor))
            throw new DbUpdateException("");
    };

    public static IRepository<Entities.Professor> ProfessorMock()
    {
        Mock.Setup(repository => repository.Save(It.IsAny<Entities.Professor>()))
            .Callback(BadBehavior);
        return Mock.Object;
    }

    public static void HaveBeenCalledSave(this ObjectAssertions objectAssertions, Times times)
    {
        Mock.Verify(repository => repository.Save(It.IsAny<Entities.Professor>()),
            times);
    }
}
