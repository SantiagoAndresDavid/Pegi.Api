using System.Linq.Expressions;
using Data.Repository.shared;
using FluentAssertions.Primitives;
using Microsoft.EntityFrameworkCore;
using Moq;

namespace Pegi.Api.Test.Proposal;

public static class ProposalRepositoryMock
{
    private static readonly Mock<IRepository<Entities.Proposal>> Mock = new();

    private static readonly Action<Entities.Proposal> BadBehavior = propsal =>
    {
        if (propsal.Equals(ProposalStub.BadProposal))
            throw new DbUpdateException("");
    };


    public static IRepository<Entities.Proposal> ProposalRepository()
    {
        Mock.Setup(repository => repository.Save(It.IsAny<Entities.Proposal>()))
            .Callback(BadBehavior);
        Mock.Setup(repository => repository.Update(It.IsAny<Entities.Proposal>()))
            .Callback(BadBehavior);
        Mock.Setup(repository => repository.Filter(It.IsAny<Expression<Func<Entities.Proposal, bool>>>())).Returns(ProposalsStub.Proposals);
        Mock.Setup(repository => repository.Delete(It.IsAny<Entities.Proposal>()))
            .Callback(BadBehavior);
        Mock.Setup(repository =>
                repository.Find(
                    It.IsAny<Expression<Func<Entities.Proposal, bool>>>()))
            .Returns(ProposalStub.Proposal);
        return Mock.Object;
    }

    public static void HaveBeenCalledSave(this ObjectAssertions objectAssertions, Times times)
    {
        Mock.Verify(repository => repository.Save(It.IsAny<Entities.Proposal>()),
            times);
    }

    public static void HaveBeenCalledUpdate(this
         ObjectAssertions objectAssertions, Times times)
    {
        Mock.Verify(
            repository => repository.Update(It.IsAny<Entities.Proposal>()),
            times);
    }

    public static void HaveBeenCalledFind(this
         ObjectAssertions objectAssertions, Times times)
    {
        Mock.Verify(repository =>
            repository.Find(
                It.IsAny<Expression<Func<Entities.Proposal, bool>>>()),times);

    }

    public static void HaveBeenCalledDelete(this
         ObjectAssertions objectAssertions, Times times)
    {
        Mock.Verify(
            repository => repository.Delete(It.IsAny<Entities.Proposal>()),
            times);

    }
}
