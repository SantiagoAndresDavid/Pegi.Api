using System.Linq.Expressions;
using Data.Repository.shared;
using FluentAssertions.Primitives;
using Microsoft.EntityFrameworkCore;
using Moq;
using Pegi.Api.Test.User;

namespace Pegi.Api.Test;

public static class PeopleRepositoryMock
{
    private static readonly Mock<IRepository<Entities.Person>> Mock = new();

    private static readonly Action<Entities.Person> BadBehavior = person =>
    {
        if (person.Equals(PersonStub.badPerson))
            throw new DbUpdateException("");
    };

    public static IRepository<Entities.Person> PeopleRepository()
    {
        Mock.Setup(repository => repository.Save(It.IsAny<Entities.Person>())).Callback(BadBehavior);
        Mock.Setup(repository => repository.Update(It.IsAny<Entities.Person>())).Callback(BadBehavior);
        Mock.Setup(repository => repository.Find(It.IsAny<Expression<Func<Entities.Person, bool>>>())).Returns(PersonStub.Person);
        return Mock.Object;
    }

    public static void HaveBeenCalledSave(this ObjectAssertions objectAssertions, Times times)
    {
        Mock.Verify(repository => repository.Save(It.IsAny<Entities.Person>()), times);
    }

    public static void HaveBeenCalledUpdate(this ObjectAssertions objectAssertions, Times times)
    {
        Mock.Verify(repository => repository.Update(It.IsAny<Entities.Person>()), times);
    }
}
