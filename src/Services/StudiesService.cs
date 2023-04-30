using Data.Repository;
using Data.Repository.shared;
using Entities;
using Entities.Exceptions;

namespace Services;

public class StudiesService
{
    private readonly IRepository<Study> _studiesRespository;

    public StudiesService(IRepository<Study> studiesrespository)
    {
        _studiesRespository = studiesrespository;
    }

    public (string, bool)  SaveStudy(Study study)
    {
        try
        {
            _studiesRespository.Save(study);
            return ("se ha guardado con exito", true);
        }
        catch (StudyExeption e)
        {
            return (e.Message, false);
        }
    }

    public List<Study> SearchStudies(string documentPerson)
    {
        return _studiesRespository.Filter(study => study.PeopleCode == documentPerson);
    }

}
