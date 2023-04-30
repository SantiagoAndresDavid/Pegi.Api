using Data.Repository;
using Data.Repository.shared;
using Entities;
using Entities.Exceptions;
using Encryptor = BCrypt.Net.BCrypt;
namespace Services;

public class AuthService
{
    private readonly IRepository<User> _repository;

    public AuthService(IRepository<User> repository)
    {
        _repository = repository;
    }

    public (string, User foundUser) LogIn(string username, string password)
    {
        User? foundUser = _repository.Find(user => user.Name == username);

        if (foundUser == null) throw new AuthException("El usuario no existe");

        if (!Encryptor.Verify(password, foundUser.Password))
            throw new AuthException("Contraseña incorrecta");

        return ("se ha ingresado con exito", foundUser);
    }
}
