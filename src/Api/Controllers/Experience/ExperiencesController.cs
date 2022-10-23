using Entities;
using Entities.Exceptions;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Services;

namespace Api.Controllers.People;

[ApiController]
[Route("experiences")]
public class ExperiencesController : ControllerBase
{
    private readonly ExperienceService _experienceService;

    public ExperiencesController(ExperienceService experienceService)
    {
        _experienceService = experienceService;
    }

    [HttpPost]
    public ActionResult RegisterExperience(
        [FromBody] CreateExperienceRequest createExperienceRequest)
    {
        try
        {
            var experience = createExperienceRequest.Adapt<Experience>();
            _experienceService.saveExperience(experience);
            return Ok(new Response<Void>("la experiencia se ha agregado con exito", false));
        }
        catch (PersonExeption exeption)
        {
            return BadRequest(new Response<Void>(exeption.Message));
        }
    }
}
