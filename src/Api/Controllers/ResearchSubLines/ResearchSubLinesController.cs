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
        ResearchSubline? researchSubline =
            _researchSubLineService.SearchSubLine(code);
        if (researchSubline!.Code == null)
        {
            return BadRequest(
                new Response<Void>("no se encontraron areas tematicas"));
        }else
        {
            return Ok(
                new Response<ResearchSubLinesResponse>(researchSubline?
                    .Adapt<ResearchSubLinesResponse>()));
        }
    }

    [HttpGet("get-research-sub-lines")]
    public ActionResult GetResearchSubLines()
    {
        List<ResearchSubline> researchSublines =
            _researchSubLineService.GetLines();
        if (researchSublines.Count < 0)
        {
            return BadRequest(
                new Response<Void>("no se encontraron areas tematicas"));
        }

        return Ok(new Response<List<ResearchSubLinesResponse>>(
            researchSublines?.Adapt<List<ResearchSubLinesResponse>>()));
    }
}
