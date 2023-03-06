using Api.Controllers.People;
using Entities.Exceptions;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Services;
using Entities;
using Microsoft.AspNetCore.Authorization;

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
    [Authorize(Roles = ("Estudiante"))]
    public ActionResult RegisterProposal(
        [FromBody] ProposalRequest proposalRequest)
    {
        try
        {
            Entities.Proposal? newProposal =
                proposalRequest.Adapt<Entities.Proposal>();
            newProposal.Code = Random.Shared.Next().ToString();
            Entities.Proposal oldProposal =
                _proposalService.GetProposalCode(newProposal.Code!)!;
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

    [HttpGet("get-proposals-document/{document}")]
    [Authorize(Roles = ("Estudiante"))]
    public ActionResult GetProposalsDocument([FromRoute] string document)
    {
        try
        {
            List<Entities.Proposal> proposals =
                _proposalService.GetProposalsDocument(document);
            if (proposals.Count == 0)
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

    //
    [HttpGet("get-proposal-code/{code}")]
    [Authorize(Roles = ("Estudiante"))]
    public ActionResult GetProposalCode([FromRoute] string code)
    {
        try
        {
            Entities.Proposal?
                proposal = _proposalService.GetProposalCode(code);
            if (proposal == null)
            {
                return BadRequest(
                    new Response<Void>("no se encontro a la propuesta"));
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

    [HttpGet]
    public ActionResult GetAll()
    {
        try
        {
            List<Entities.Proposal> proposals =
                _proposalService.GetAll();
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

    [HttpDelete("{code}")]
    [Authorize(Roles = ("Estudiante"))]
    public ActionResult DeleteProposal([FromRoute] string code)
    {
        try
        {
            string message = _proposalService.DeleteProposal(code);
            return Ok(new Response<Void>(message, false));
        }
        catch (Exception e)
        {
            return BadRequest(new Response<Void>(e.Message));
        }
    }
}
