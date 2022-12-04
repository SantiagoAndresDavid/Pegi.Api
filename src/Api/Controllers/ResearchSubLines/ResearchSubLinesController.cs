using Api.Controllers.ThematicAreas;
using Entities;
using Entities.Exceptions;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Services;

namespace Api.Controllers.ResearchSubLines;

[ApiController]
[Route("research-sub-lines")]
public class ResearchSubLinesController : ControllerBase
{
    private readonly ResearchSubLineService _researchSubLineService;

    public ResearchSubLinesController(
        ResearchSubLineService researchSubLineService)
    {
        _researchSubLineService = researchSubLineService;
    }

    [HttpGet("{code}")]
    public ActionResult GetResearchSubLine([FromRoute] string code)
    {
        try
        {
            List<ResearchSubline> researchSubline =
                _researchSubLineService.SearchSubLine(code);
            return Ok(
                new Response<List<ResearchSubLinesResponse>>(researchSubline?
                    .Adapt<List<ResearchSubLinesResponse>>()));
        }
        catch (Exception e)
        {
            return BadRequest(
                new Response<Void>("no se encontraron sublineas asociadas a esta linea"));
        }

    }

    [HttpGet("get-research-sub-lines")]
    public ActionResult GetResearchSubLines()
    {
        try
        {
            List<ResearchSubline> researchSublines =
                _researchSubLineService.GetLines();
            return Ok(new Response<List<ResearchSubLinesResponse>>(
                researchSublines?.Adapt<List<ResearchSubLinesResponse>>()));
        }
        catch (Exception e)
        {
             return BadRequest(
                            new Response<Void>("no se encontraron sublineas"));
        }

    }
}
