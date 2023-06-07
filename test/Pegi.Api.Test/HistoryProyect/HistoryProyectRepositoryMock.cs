using System.Linq.Expressions;
using Data.Repository.shared;
using FluentAssertions.Primitives;
using Microsoft.EntityFrameworkCore;
using Moq;
using Pegi.Api.Test.Proyect;

namespace Pegi.Api.Test.HistoryProyect;

public static class HistoryProyectRepositoryMock
{
    private static readonly Mock<IRepository<Entities.HistoryProyect>> Mock = new();

    private static readonly Action<Entities.HistoryProyect> BadBehavior = HistoryProyect =>
    {
        if (HistoryProyect.Equals(HistoryProyectStub.BadHistoryProyect))
            throw new DbUpdateException("");
    };

    public static IRepository<Entities.HistoryProyect> HistoryRepositoryMock()
    {
        Mock.Setup(repository => repository.Save(It.IsAny<Entities.HistoryProyect>()))
            .Callback(BadBehavior);
        Mock.Setup(repository => repository.Filter(It.IsAny<Expression<Func<Entities.HistoryProyect, bool>>>()))
            .Returns(HistorysProyectStub.HistoryProyects);
        return Mock.Object;
    }

    public static void HaveBeenCalledSave(this ObjectAssertions objectAssertions, Times times)
    {
        Mock.Verify(repository => repository.Save(It.IsAny<Entities.HistoryProyect>()),
            times);
    }

    public static void HaveBeenCalledFind(this
        ObjectAssertions objectAssertions, Times times)
    {
        Mock.Verify(repository =>
            repository.Filter(
                It.IsAny<Expression<Func<Entities.HistoryProyect, bool>>>()),times);
    }
}
