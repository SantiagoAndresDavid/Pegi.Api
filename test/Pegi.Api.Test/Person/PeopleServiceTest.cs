using Entities;
using FluentAssertions;
using Moq;
using Services;

namespace Pegi.Api.Test;

public class PeopleTest
{
    private PeopleService _peopleService;

    [SetUp]
    public void SetUp()
    {
        _peopleService = new PeopleService(PeopleRepositoryMock.PeopleRepository());
    }

    [Test]
    public void SavePersonTest()
    {
        var (message, status) = _peopleService.SavePerson(PersonStub.Person);
        _peopleService.Should().HaveBeenCalledSave(Times.AtLeastOnce());
        status.Should().BeTrue();
    }

    [Test]
    public void SearchPersonTest()
    {
        Person? person = _peopleService.SearchPerson(PersonStub.Person.Document!);
        _peopleService.Should().HaveBeenCalledFind(Times.AtLeastOnce());
        person.Should().NotBeNull();
    }

    [Test]
    public void DeletePersonTest()
    {
        String response = _peopleService.DeletePerson(PersonStub.Person.Document!);
        _peopleService.Should().HaveBeenCalledDelete(Times.AtLeastOnce());
        response.Should().Be("se borro con exito");
    }



}
