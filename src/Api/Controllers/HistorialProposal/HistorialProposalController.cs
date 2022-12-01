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
            var feedBack = proposalFeedBackRequest.Adapt<ProposalFeedBack>();
            feedBack.Code = Random.Shared.Next();
            _proposalFeedBackService.SaveFeedBackRepository(feedBack);
            HistoryProposals historialProposal =
                new HistoryProposals(feedBack.Code,
                    proposalFeedBackRequest.ProposalCode);
            historialProposal.Code = Random.Shared.Next();
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
