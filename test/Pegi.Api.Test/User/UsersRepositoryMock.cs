using System.Linq.Expressions;
using Data.Repository;
using Entities;
using FluentAssertions.Primitives;
using Moq;

namespace Pegi.Api.Test;

public static class UsersRepositoryMock
{
    private static readonly Mock<UsersRepository> Mock = new();


    public static UsersRepository UsersRepository()
    {
        Mock.Setup(repository => repository.Save(It.IsAny<User>()));
        return Mock.Object;
    }

    public static void HaveBeenCalledMock(this ObjectAssertions objectAssertions)
    {
        Mock.Verify(repository => repository.Save(It.IsAny<User>()), Times.AtLeastOnce);
    }

}
