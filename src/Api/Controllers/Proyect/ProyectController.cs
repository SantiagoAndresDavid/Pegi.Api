using Entities.Exceptions;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Services;

namespace Api.Controllers.Proyect;

[ApiController]
[Route("Proyect")]
public class ProyectController : ControllerBase
{
    private readonly ProyectService _proyectService;

    public ProyectController(ProyectService proyectService)
    {
        _proyectService = proyectService;
    }

    [HttpPost]
    public ActionResult RegisterProyect(
        [FromBody] ProyectRequest proyectRequest)
    {
        try
        {
            Entities.Proyect? newProyect =
                proyectRequest.Adapt<Entities.Proyect>();
            Entities.Proyect oldProyect =
                _proyectService.SearchProyect(newProyect.Code!)!;
            if (newProyect.Code == oldProyect?.Code)
            {
                _proyectService.UpdateProyect(newProyect);
            }
            else
            {
                _proyectService.SaveProyect(newProyect);
            }

            return Ok(new Response<Void>("se ha guardado con exito",
                false));
        }
        catch (PersonExeption exeption)
        {
            return BadRequest(new Response<Void>(exeption.Message));
        }
    }
}
