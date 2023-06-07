using System.Linq.Expressions;
using Data.Repository.shared;
using FluentAssertions.Primitives;
using Microsoft.EntityFrameworkCore;
using Moq;
using Pegi.Api.Test.HistoryProyect;

namespace Pegi.Api.Test.HistoryProposal;

public static class HistoryProposalRepositoryMock
{
    private static readonly Mock<IRepository<Entities.HistoryProposals>> Mock = new();

    private static readonly Action<Entities.HistoryProposals> BadBehavior = HistoryProposal =>
    {
        if (HistoryProposal.Equals(HistoryProposalStub.BadHistoryProposal))
            throw new DbUpdateException("");
    };

    public static IRepository<Entities.HistoryProposals> HistoryRepositoryMock()
    {
        Mock.Setup(repository => repository.Save(It.IsAny<Entities.HistoryProposals>()))
            .Callback(BadBehavior);
        Mock.Setup(repository => repository.Filter(It.IsAny<Expression<Func<Entities.HistoryProposals, bool>>>()))
            .Returns(HistorysProposalStub.HistoryProposals);
        return Mock.Object;
    }

    public static void HaveBeenCalledSave(this ObjectAssertions objectAssertions, Times times)
    {
        Mock.Verify(repository => repository.Save(It.IsAny<Entities.HistoryProposals>()),
            times);
    }

    public static void HaveBeenCalledFind(this
        ObjectAssertions objectAssertions, Times times)
    {
        Mock.Verify(repository =>
            repository.Filter(
                It.IsAny<Expression<Func<Entities.HistoryProposals, bool>>>()),times);
    }
}
