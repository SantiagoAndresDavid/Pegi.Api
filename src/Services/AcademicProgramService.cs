using Data.Repository;
using Data.Repository.shared;
using Entities;
using Entities.Exceptions;

namespace Services;

public class AcademicProgramService
{
    private readonly IRepository<AcademicProgram> _academicProgramsRepository;

    public AcademicProgramService(IRepository<AcademicProgram> academicProgramsRepository)
    {
        _academicProgramsRepository = academicProgramsRepository;
    }

    public AcademicProgram? SearchProfessorAcademicProgram(string code)
    {
        return _academicProgramsRepository.Find(AcademicProgram =>
            AcademicProgram.Code == code);
    }

    public List<AcademicProgram> GetAll()
    {
        return _academicProgramsRepository.GetAll();
    }


}
