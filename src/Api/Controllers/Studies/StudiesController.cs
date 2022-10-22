using Entities;
using Entities.Exceptions;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Services;

namespace Api.Controllers.People;

public class StudiesController : ControllerBase
{
    private readonly StudiesService _studiesService;

    public StudiesController(StudiesService studiesService)
    {
        _studiesService = studiesService;
    }

    [HttpPost("registrer-study")]
    public ActionResult RegisterStudy(
        [FromBody] CreateStudyRequest createStudyRequest)
    {
        try
        {
            var study = createStudyRequest.Adapt<Study>();
            _studiesService.saveStudy(study);
            return Ok(new Response<Void>("el estudio se ha agregado con exito", false));
        }
        catch (PersonExeption exeption)
        {
            return BadRequest(new Response<Void>(exeption.Message));
        }
    }
}



