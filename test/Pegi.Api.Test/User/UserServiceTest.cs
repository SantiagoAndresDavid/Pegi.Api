using FluentAssertions;
using Moq;
using Services;

namespace Pegi.Api.Test.User;

public class UserServiceTest
{
    private UsersService _usersService;
    private AuthService _authService;


    [SetUp]
    public void SetUp()
    {
        _authService = new AuthService(UsersRepositoryMock.UsersRepository());
        _usersService = new UsersService(UsersRepositoryMock.UsersRepository());
    }

    [Test]
    public void LoginUserTest()
    {
        var(mensaje,user) = _authService.LogIn(UserStub.User.Name!,UserStub.User.Password!);
        _authService.Should().HaveBeenCalledFind(Times.AtLeastOnce());
        user.Should().BeEquivalentTo(UserStub.EncrypeUser);
    }


    [Test]
    public void SaveUserTest()
    {
        bool response = _usersService.SaveUser(UserStub.User);
        _usersService.Should().HaveBeenCalledSave(Times.AtLeastOnce());
        response.Should().BeTrue();
    }

    [Test]
    public void AddPersonDocumentTest()
    {
        var (message, status) =
            _usersService.DeletePersonDocument(PersonStub.Person.Document!);
        _usersService.Should().HaveBeenCalledUpdate(Times.AtLeastOnce());
        status.Should().BeTrue();
    }

    [Test]
    public void DeletePersonDocumentTest()
    {
        var (message, status) =
            _usersService.AddPersonDocument(PersonStub.Person.Document!,
                UserStub.User.Name!);
        _usersService.Should().HaveBeenCalledUpdate(Times.AtLeastOnce());
        status.Should().BeTrue();
    }


    [Test]
    public void SaveBadUserTest()
    {
        bool resonse = _usersService.SaveUser(UserStub.BadUser);
        _usersService.Should().HaveBeenCalledSave(Times.AtLeastOnce());
        resonse.Should().BeFalse();
    }
}
