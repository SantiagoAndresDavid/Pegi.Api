using Api;
using Data;
using Data.Repository;
using Entities;
using FluentAssertions;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Services;
using Microsoft.EntityFrameworkCore;


namespace Pegi.Api.Test;
public class UserTest
{
    private UsersService _usersService;


    [SetUp]
    public void SetUp()
    {
        _usersService = new UsersService(UsersRepositoryMock.UsersRepository());
    }

    [Test]
    public void SaveUserTest()
    {
        bool resonse = _usersService.SaveUser(UserStub.user);
        resonse.Should().BeTrue();
    }

}
