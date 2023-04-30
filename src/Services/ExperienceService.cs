using Data.Repository;
using Data.Repository.shared;
using Entities;
using Entities.Exceptions;

namespace Services;

public class ExperienceService
{
    private readonly IRepository<Experience> _experiencesRepository;

    public ExperienceService(IRepository<Experience> experiencesRepository)
    {
        _experiencesRepository = experiencesRepository;
    }

    public (string, bool)  saveExperience(Experience experience)
    {
        try
        {
            _experiencesRepository.Save(experience);
            return ("se ha guardado con exito", true);
        }
        catch (StudyExeption e)
        {
            return (e.Message, false);
        }
    }

    public List<Experience> SearchExperiences(string documentPerson)
    {
        return _experiencesRepository.Filter(experience => experience.PeopleCode == documentPerson);
    }
}
