using Data.Repository;
using Entities;
using Entities.Exceptions;

namespace Services;

public class PeopleService
{
    private readonly PeopleRepository _peopleRepository;

    public PeopleService(PeopleRepository peopleRepository)
    {
        _peopleRepository = peopleRepository;
    }

    public (string, bool) SavePerson(Person person)
    {
        try
        {
            _peopleRepository.Save(person);
            return ("se ha guardado con exito", true);
        }
        catch (PersonExeption e)
        {
            return (e.Message, false);
        }
    }

    public Person? SearchPerson(string document)
    {
        return _peopleRepository.Find(person => person.Document == document);
    }

    public string DeletePerson(string document)
    {
        try
        {
            Person? foundPerson = SearchPerson(document);
            if (foundPerson == null)
                throw new PersonExeption("Persona no encontrada");
            _peopleRepository.Delete(foundPerson);
            return "Registro eliminado";
        }
        catch (Exception e)
        {
            throw new PersonExeption(
                $"Ha ocurrido un error al eliminar {e.Message}");
        }
    }
}
