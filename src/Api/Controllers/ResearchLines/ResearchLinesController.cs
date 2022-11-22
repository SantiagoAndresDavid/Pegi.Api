using Api.Controllers.ResearchSubLines;
using Entities;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Services;

namespace Api.Controllers.ResearchLines;
[ApiController]
[Route("research-lines")]
public class ResearchLinesController : ControllerBase
{
    private readonly ResearchLineService _researchLineService;

    public ResearchLinesController(ResearchLineService researchLineService)
    {
        _researchLineService = researchLineService;
    }

    [HttpGet("{code}")]
    public ActionResult GetResearchLine([FromRoute] string code)
    {
        ResearchLine? researchLine =
            _researchLineService.SearchLine(code);
        if (researchLine!.Code == null)
        {
            return BadRequest(
                new Response<Void>("no se encontraron areas tematicas"));
        }else
        {
            return Ok(
                new Response<ResearchLinesResponse>(researchLine?
                    .Adapt<ResearchLinesResponse>()));
        }
    }

    [HttpGet("get-research-lines")]
    public ActionResult GetResearchLine()
    {
        List<ResearchLine> researchLines =
            _researchLineService.GetLines();
        if (researchLines.Count < 0)
        {
            return BadRequest(
                new Response<Void>("no se encontraron areas tematicas"));
        }

        return Ok(new Response<List<ResearchLinesResponse>>(
            researchLines?.Adapt<List<ResearchLinesResponse>>()));
    }
}
