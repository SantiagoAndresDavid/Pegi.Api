using Api.Controllers.People;
using Entities;
using Entities.Exceptions;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Services;

namespace Api.Controllers.Professor;
[ApiController]
[Route("Professor")]
public class ProfessorController : ControllerBase
{
    private readonly ProfessorService _professorService;
    private readonly PeopleService _peopleService;

    public ProfessorController(ProfessorService professorService,PeopleService peopleService)
    {
        _professorService = professorService;
        _peopleService = peopleService;
    }

    [HttpPost]
    public ActionResult RegisterProfessor(
        [FromBody] CreateProfessorRequest createProfessorRequest)
    {
        try
        {
            if (_peopleService.SearchPerson(createProfessorRequest.Document) != null &&
                _professorService.SearchProfessor(createProfessorRequest.Document) == null)
            {
                _professorService.SaveProfessor(createProfessorRequest.Adapt<Entities.Professor>());
                return Ok(new Response<Void>("Profesor creado con exito",
                    false));
            }
            return BadRequest(new Response<Void>("Error al registrar profesor"));
        }
        catch (ProfessorExeption e)
        {
            return (BadRequest(new Response<Void>(e.Message)));
        }
    }

    [HttpGet("{document}")]
    public ActionResult GetProfessor([FromRoute] string document)
    {
        try
        {
            Entities.Professor? professor = _professorService.SearchProfessor(document);
            if(professor?.Document == null)
            {
                return BadRequest(new Response<Void>("No hay docente registrado con ese documento"));
            }
            return Ok(new Response<ProfessorResponse>(professor.Adapt<ProfessorResponse>()));
        }
        catch (PersonExeption e)
        {
            return BadRequest(new Response<Void>(e.Message));
        }
    }

     [HttpGet("get-professor-position/{position}")]
        public ActionResult GetProfessorByPosition([FromRoute] string position)
        {
            try
            {
                List<Entities.Professor> professors = _professorService.SearchProfessorByPosition(position);
                if(professors.Count < 0)
                {
                    return BadRequest(new Response<Void>("No se pudo retornar una lista de docentes con esa posicion"));
                }
                List<Entities.Person> professorsResponses =
                    new List<Entities.Person>();
                foreach (Entities.Professor professor in professors)
                {

                    Person relatedPerson = _peopleService.SearchPerson(professor.Document);

                    professorsResponses.Add(relatedPerson);
                }

                return Ok(new Response<List<PersonResponse>>(
                    professorsResponses?.Adapt<List<PersonResponse>>()));
            }
            catch (PersonExeption e)
            {
                return BadRequest(new Response<Void>(e.Message));
            }
        }

        [HttpGet]
        public ActionResult GetAllProfessors()
        {
            try
            {
                List<Entities.Professor> professors =
                    _professorService.GetAllProfessors();
                if (professors.Count < 0)
                {
                    return BadRequest(
                        new Response<Void>("No se pudo retornar una lista de docentes"));
                }

                return Ok(new Response<List<ProfessorResponse>>(
                    professors?.Adapt<List<ProfessorResponse>>()));
            }
            catch (PersonExeption e)
            {
                return BadRequest(new Response<Void>(e.Message));
            }
        }


}
