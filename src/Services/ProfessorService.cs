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


    public (string, bool) SaveProfessor(Professor professor)
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

    public Professor? SearchProfessor(string document)
    {
        return _professorRepository.Find(professor =>
            professor.Document == document);
    }


}
