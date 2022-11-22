using Api.Controllers.People;
using Entities;
using Entities.Exceptions;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Services;

namespace Api.Controllers.ThematicAreas;

[ApiController]
[Route("Thematic-areas")]
public class ThematicAreasController : ControllerBase
{
    private readonly ThematicAreaService _thematicAreaService;

    public ThematicAreasController(ThematicAreaService thematicAreaService)
    {
        _thematicAreaService = thematicAreaService;
    }

    [HttpGet("{code}")]
    public ActionResult GetThematicArea([FromRoute] string code)
    {
        try
        {
            ThematicArea? thematicArea =
                _thematicAreaService.SearchThematicArea(code);
            return Ok(
                new Response<ThematicAreaResponse>(thematicArea?
                    .Adapt<ThematicAreaResponse>()));
        }
        catch (ThematicAreaExeption e)
        {
            return BadRequest(new Response<Void>(e.Message));
        }
    }

    [HttpGet("thematic-areas")]
    public ActionResult GetThematicAreas()
    {
        List<ThematicArea> thematicAreas = _thematicAreaService.GetLinesThematicAreas();
        return Ok(new Response<List<ThematicAreaResponse>>(thematicAreas.Adapt<List<ThematicAreaResponse>>()));
    }
}
