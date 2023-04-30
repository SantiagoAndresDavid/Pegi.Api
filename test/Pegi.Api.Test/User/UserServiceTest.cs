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
    public void SaveUserTest()
    {
        bool resonse = _usersService.SaveUser(UserStub.User);
        _usersService.Should().HaveBeenCalledSave(Times.AtLeastOnce());
        resonse.Should().BeTrue();
    }

    [Test]
    public void AddPersonDocumentTest()
    {
       var (message, status) = _usersService.AddPersonDocument(PersonStub.Person.Document!,UserStub.User.Name!);
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
