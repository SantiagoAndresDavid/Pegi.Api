using System.Linq.Expressions;
using Data.Repository.shared;
using FluentAssertions.Primitives;
using Microsoft.EntityFrameworkCore;
using Moq;

namespace Pegi.Api.Test.User;

public static class UsersRepositoryMock
{
    private static readonly Mock<IRepository<Entities.User>> Mock = new();

    private static readonly Action<Entities.User> BadBehavior = user =>
    {
        if (user.Equals(UserStub.BadUser))
            throw new DbUpdateException("");
    };

    public static IRepository<Entities.User> UsersRepository()
    {
        Mock.Setup(repository => repository.Save(It.IsAny<Entities.User>())).Callback(BadBehavior);
        Mock.Setup(repository => repository.Update(It.IsAny<Entities.User>())).Callback(BadBehavior);
        Mock.Setup(repository => repository.Find(It.IsAny<Expression<Func<Entities.User, bool>>>())).Returns(UserStub.User);
        return Mock.Object;
    }

    public static void HaveBeenCalledSave(this ObjectAssertions objectAssertions, Times times)
    {
        Mock.Verify(repository => repository.Save(It.IsAny<Entities.User>()), times);
    }

    public static void HaveBeenCalledUpdate(this ObjectAssertions objectAssertions, Times times)
    {
        Mock.Verify(repository => repository.Update(It.IsAny<Entities.User>()), times);
    }
}
