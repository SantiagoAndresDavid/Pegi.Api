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
    
    [HttpPost("register-feedback")]
    public ActionResult RegisterFeedback(
        [FromBody] ProposalFeedBackRequest proposalFeedBackRequest)
    {
        try
        {
            var proposal = proposalFeedBackRequest.Adapt<ProposalFeedBack>();
            _proposalFeedBackService.SaveFeedBackRepository(proposal);
            HistoryProposals historialProposal = new HistoryProposals(proposal.Code,proposalFeedBackRequest.ProposalCode);
            _historyProposalService.SaveProposalHistory(historialProposal);
            return Ok(
                new Response<HisotrialProposalResponse>(
                    historialProposal.Adapt<HisotrialProposalResponse>()));
        }
        catch (PersonExeption exeption)
        {
            return BadRequest(new Response<Void>(exeption.Message));
        }
    }
}
