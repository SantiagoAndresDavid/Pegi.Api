using Microsoft.AspNetCore.Mvc;
using Services;

namespace Api.Controllers.Proposal;

[ApiController]
[Route("Proposals")]
public class ProposalController: ControllerBase
{
    private readonly ProposalService _proposalService;

    public ProposalController(ProposalService proposalService)
    {
        _proposalService = proposalService;
    }
}
