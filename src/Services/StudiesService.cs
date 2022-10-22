using Data.Repository;
using Entities;
using Entities.Exceptions;

namespace Services;

public class StudiesService
{
    private readonly StudiesRespository _studiesrespository;

    public StudiesService(StudiesRespository studiesrespository)
    {
        _studiesrespository = studiesrespository;
    }

    public (string, bool)  saveStudy(Study study)
    {
        try
        {
            _studiesrespository.Save(study);
            return ("se ha guardado con exito", true);
        }
        catch (StudyExeption e)
        {
            return (e.Message, false);
        }
    }

}
