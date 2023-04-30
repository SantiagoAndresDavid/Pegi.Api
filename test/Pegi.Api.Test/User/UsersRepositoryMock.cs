using Data.Repository.shared;
using FluentAssertions.Primitives;
using Microsoft.EntityFrameworkCore;
using Moq;

namespace Pegi.Api.Test.User;

public static class UsersRepositoryMock
{
    private static readonly Mock<IRepository<Entities.User>> Mock = new();
    private static readonly Mock<IRepository<Entities.User>> EvilMock = new();


    public static IRepository<Entities.User> UsersRepository()
    {
        Mock.Setup(repository => repository.Save(It.IsAny<Entities.User>()));
        return Mock.Object;
    }

    public static IRepository<Entities.User> EvilUsersRepository()
    {
        EvilMock.Setup(repository => repository.Save(It.IsAny<Entities.User>())).Throws<DbUpdateException>();
        return EvilMock.Object;
    }

    public static void HaveBeenCalledMock(this ObjectAssertions objectAssertions)
    {
        Mock.Verify(repository => repository.Save(It.IsAny<Entities.User>()), Times.AtLeastOnce);
    }

    public static void HaveBeenCalledEvilMock(this ObjectAssertions objectAssertions)
    {
        EvilMock.Verify(repository => repository.Save(It.IsAny<Entities.User>()), Times.AtLeastOnce);
    }

}
