using System.Linq.Expressions;
using Data.Repository.shared;
using FluentAssertions.Primitives;
using Microsoft.EntityFrameworkCore;
using Moq;
using Pegi.Api.Test.Proposal;

namespace Pegi.Api.Test.Proyect;

public static class ProyectRepositoryMock
{
        private static readonly Mock<IRepository<Entities.Proyect>> Mock = new();

    private static readonly Action<Entities.Proyect> BadBehavior = proyect =>
    {
        if (proyect.Equals(ProyectStub.BadProyect))
            throw new DbUpdateException("");
    };


    public static IRepository<Entities.Proyect> ProposalRepository()
    {
        Mock.Setup(repository => repository.Save(It.IsAny<Entities.Proyect>()))
            .Callback(BadBehavior);
        Mock.Setup(repository => repository.Update(It.IsAny<Entities.Proyect>()))
            .Callback(BadBehavior);
        Mock.Setup(repository => repository.Filter(It.IsAny<Expression<Func<Entities.Proyect, bool>>>())).Returns(ProyectsStub.Proyects);
        Mock.Setup(repository => repository.Delete(It.IsAny<Entities.Proyect>()))
            .Callback(BadBehavior);
        Mock.Setup(repository =>
                repository.Find(
                    It.IsAny<Expression<Func<Entities.Proyect, bool>>>()))
            .Returns(ProyectStub.Proyect);
        return Mock.Object;
    }

    public static void HaveBeenCalledSave(this ObjectAssertions objectAssertions, Times times)
    {
        Mock.Verify(repository => repository.Save(It.IsAny<Entities.Proyect>()),
            times);
    }

    public static void HaveBeenCalledUpdate(this
         ObjectAssertions objectAssertions, Times times)
    {
        Mock.Verify(
            repository => repository.Update(It.IsAny<Entities.Proyect>()),
            times);
    }

    public static void HaveBeenCalledFind(this
         ObjectAssertions objectAssertions, Times times)
    {
        Mock.Verify(repository =>
            repository.Find(
                It.IsAny<Expression<Func<Entities.Proyect, bool>>>()),times);

    }

    public static void HaveBeenCalledDelete(this
         ObjectAssertions objectAssertions, Times times)
    {
        Mock.Verify(
            repository => repository.Delete(It.IsAny<Entities.Proyect>()),
            times);
    }
}
