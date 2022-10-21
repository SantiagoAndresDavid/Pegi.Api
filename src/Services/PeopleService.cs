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

    public (string, bool)  savePerson(Person person)
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

}
