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
            _professorService.saveProfessor(professor);
            return Ok(new Response<Void>("el professor se ha creado con exito",
                false));
        }
        catch (ProfessorExeption e)
        {
            return (BadRequest(new Response<Void>(e.Message)));
        }
    }

}
