using FluentAssertions;
using Services;

namespace Pegi.Api.Test.User;
public class UserTest
{
    private UsersService _usersService;
    private UsersService _evilUsersService;


    [SetUp]
    public void SetUp()
    {
        _usersService = new UsersService(UsersRepositoryMock.UsersRepository());
        _evilUsersService = new UsersService(UsersRepositoryMock.EvilUsersRepository());
    }

    [Test]
    public void SaveUserTest()
    {
        bool resonse = _usersService.SaveUser(UserStub.user);
        _usersService.Should().HaveBeenCalledMock();
        resonse.Should().BeTrue();
    }

    [Test]
    public void SaveUserBadUserTest()
    {
        bool resonse = _evilUsersService.SaveUser(UserStub.user);
        _evilUsersService.Should().HaveBeenCalledEvilMock();
        resonse.Should().BeFalse();
    }



}
