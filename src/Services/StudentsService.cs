using Data.Repository;
using Data.Repository.shared;
using Entities;
using Entities.Exceptions;

namespace Services;

public class StudentsService
{
    private readonly IRepository<Student> _studentsRepository;

    public StudentsService(IRepository<Student> studentsRepository)
    {
        _studentsRepository = studentsRepository;
    }

    public (string, bool) SaveStudent(Student student)
    {
        try
        {
            _studentsRepository.Save(student);
            return ("se ha guardado con exito", true);
        }
        catch (StudentException e)
        {
            return (e.Message, false);
        }
    }

    public Student? SearchStudent(string document)
    {
        return _studentsRepository.Find(student => student.Document == document);
    }
}
