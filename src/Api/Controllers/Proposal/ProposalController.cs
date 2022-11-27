using Api.Controllers.People;
using Entities.Exceptions;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Services;
using Entities;

namespace Api.Controllers.Proposal;

[ApiController]
[Route("Proposals")]
public class ProposalController : ControllerBase
{
    private readonly ProposalService _proposalService;

    public ProposalController(ProposalService proposalService)
    {
        _proposalService = proposalService;
    }

    [HttpPost]
    public ActionResult RegisterProposal(
        [FromBody] ProposalRequest proposalRequest)
    {
        try
        {
            Entities.Proposal? newProposal =
                proposalRequest.Adapt<Entities.Proposal>();
            Entities.Proposal oldProposal =
                _proposalService.SearchProposal(newProposal.Code!)!;
            if (newProposal.Code == oldProposal?.Code)
            {
                _proposalService.UpdateProposal(newProposal);
            }
            else
            {
                _proposalService.SaveProposal(newProposal);
            }

            return Ok(new Response<Void>("se ha guardado con exito",
                false));
        }
        catch (PersonExeption exeption)
        {
            return BadRequest(new Response<Void>(exeption.Message));
        }
    }

    [HttpGet("{document}")]
    public ActionResult GetProposal([FromRoute] string document)
    {
        try
        {
            List<Entities.Proposal> proposals =
                _proposalService.GetProposals(document);
            if (proposals.Count < 0)
            {
                return BadRequest(
                    new Response<Void>("no se encontro ninguna propuesta"));
            }
            return Ok(new Response<List<ProposalResponse>>(
                proposals?.Adapt<List<ProposalResponse>>()));
        }
        catch (PersonExeption e)
        {
            return BadRequest(new Response<Void>(e.Message));
        }
    }
}
