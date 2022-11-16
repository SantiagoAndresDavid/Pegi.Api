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

    public ProfessorController(ProfessorService professorService)
    {
        _professorService = professorService;
    }

    [HttpPost]
    public ActionResult RegisterProfessor(
        [FromBody] CreateProfessorRequest createProfessorRequest)
    {
        try
        {
            var professor = createProfessorRequest.Adapt<Entities.Professor>();
            _professorService.SaveProfessor(professor);
            return Ok(new Response<Void>("el professor se ha creado con exito",
                false));
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
                return BadRequest(new Response<Void>("no se encontro a la persona"));
            }
            return Ok(new Response<ProfessorResponse>(professor.Adapt<ProfessorResponse>()));
        }
        catch (PersonExeption e)
        {
            return BadRequest(new Response<Void>(e.Message));
        }
    }


}
