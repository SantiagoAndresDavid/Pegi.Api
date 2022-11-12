using Entities;
using Entities.Exceptions;

namespace Services;

public class ProfessorService
{
    private readonly ProfessorRepository _professorRepository;

    public ProfessorService(ProfessorRepository professorRepository)
    {
        _professorRepository = professorRepository;
    }


    public (string, bool) saveProfessor(Professor professor)
    {
        try
        {
            _professorRepository.Save(professor);
            return ("se ha guardado con exito", true);
        }
        catch (PersonExeption e)
        {
            return (e.Message, false);
        }
    }
}
