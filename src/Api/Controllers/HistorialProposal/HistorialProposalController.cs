using Entities;
using Entities.Exceptions;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Services;

namespace Api.Controllers.HistorialProposal;

[ApiController]
[Route("HistorialPropose")]
public class HistorialProposalController : ControllerBase
{
    private readonly HistoryProposalService _historyProposalService;
    private readonly ProposalFeedBackService _proposalFeedBackService;

    public HistorialProposalController(
        HistoryProposalService historyProposalService,
        ProposalFeedBackService proposalFeedBackService)
    {
        _historyProposalService = historyProposalService;
        _proposalFeedBackService = proposalFeedBackService;
    }

    //variable = registerfeedback()
    // guarda historial(propuestacCodigo, variable.codigo)


    [HttpPost("register-feedback")]
    public ActionResult RegisterFeedback(
        [FromBody] ProposalFeedBackRequest proposalFeedBackRequest)
    {
        try
        {
            var proposal = proposalFeedBackRequest.Adapt<ProposalFeedBack>();
            _proposalFeedBackService.SaveFeedBackRepository(proposal);
            return Ok(
                new Response<ProposalFeedBackResponse>(
                    proposal.Adapt<ProposalFeedBackResponse>()));
        }
        catch (PersonExeption exeption)
        {
            return BadRequest(new Response<Void>(exeption.Message));
        }
    }


    [HttpPost("register-history-proposal")]
    public ActionResult RegisterHistoryProposal(
        [FromBody] HistorialProposalRequest historialProposalRequest)
    {
        try
        {
            var historialProposal = historialProposalRequest.Adapt<HistoryProposals>();
            _historyProposalService.SaveProposalHistory(historialProposal);
            return Ok(
                new Response<HistorialProposalRequest>(
                    historialProposal.Adapt<HistorialProposalRequest>()));
        }
        catch (PersonExeption exeption)
        {
            return BadRequest(new Response<Void>(exeption.Message));
        }
    }
}
