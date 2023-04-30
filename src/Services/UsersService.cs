using Data.Repository;
using Data.Repository.shared;
using Entities;
using Entities.Exceptions;
using Microsoft.EntityFrameworkCore;
using Encryptor = BCrypt.Net.BCrypt;
namespace Services;

public class UsersService
{
    private readonly IRepository<User> _usersRepository;


    public UsersService(IRepository<User> repository)
    {
        _usersRepository = repository;
    }

    public bool SaveUser(User user)
    {
        try
        {
            user.Password = Encryptor.HashPassword(user.Password);
            _usersRepository.Save(user);
            return true;
        }
        catch
        {
            return false ;
        }
    }

    public (string,bool?) AddPersonDocument(string document,string username)
    {
        try
        {
            User? user = _usersRepository.Find(user => user.Name == username );
            user!.PersonDocument = document;
            _usersRepository.Update(user);
            return ("se agrego con exito",true);
        }
        catch(AuthException e)
        {
            return ("error",false);
        }
    }

    public (string,bool?) DeletePersonDocument(string document)
    {
        try
        {
            User? user = _usersRepository.Find(user => user.PersonDocument == document );
            user.PersonDocument = null;
            _usersRepository.Update(user);
            return ("se elimino con exito",true);
        }
        catch(AuthException e)
        {
            return ("error",false);
        }
    }


}
