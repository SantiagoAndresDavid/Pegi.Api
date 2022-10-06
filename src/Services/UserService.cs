using Data.Repository;
using Entities;
using Microsoft.EntityFrameworkCore;
using Encryptor = BCrypt.Net.BCrypt;
namespace Services;

public class UserService
{
    private readonly UserRepository _repository;

    public UserService(UserRepository repository)
    {
        _repository = repository;
    }

    public bool SaveUser(User user)
    {
        try
        {
            user.Password = Encryptor.HashPassword(user.Password);
            _repository.Save(user);
            return true;
        }
        catch (DbUpdateException e)
        {
            return false;
        }
    }
}
