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
    public ActionResult RegisterPeople(
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
    public ActionResult GetPerson([FromRoute] string document)
    {
        try
        {
            Entities.Proposal? proposal =
                _proposalService.SearchProposal(document);
            if (proposal == null)
            {
                return BadRequest(
                    new Response<Void>("no se encontro a la persona"));
            }

            return Ok(
                new Response<ProposalResponse>(
                    proposal.Adapt<ProposalResponse>()));
        }
        catch (PersonExeption e)
        {
            return BadRequest(new Response<Void>(e.Message));
        }
    }
}
