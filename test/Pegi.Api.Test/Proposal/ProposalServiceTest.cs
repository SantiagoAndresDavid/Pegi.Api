using FluentAssertions;
using Moq;
using Services;

namespace Pegi.Api.Test.Proposal;

public class ProposalServiceTest
{
    private ProposalService _proposalService;

    [SetUp]
    public void SetUp()
    {
        _proposalService = new ProposalService(ProposalRepositoryMock.ProposalRepository());
    }

    [Test]
    public void SaveProposalTest()
    {
        var (message, status) = _proposalService.SaveProposal(ProposalStub.Proposal);
        _proposalService.Should().HaveBeenCalledSave(Times.AtLeastOnce());
        status.Should().BeTrue();
    }

    [Test]
    public void UpdateProposalTest()
    {
        var (message, status) = _proposalService.UpdateProposal(ProposalStub.Proposal);
        _proposalService.Should().HaveBeenCalledUpdate(Times.AtLeastOnce());
        status.Should().BeTrue();
    }


    [Test]
    public void DeleteProposalTest()
    {
        String response = _proposalService.DeleteProposal(ProposalStub.Proposal.Code!);
        _proposalService.Should().HaveBeenCalledDelete(Times.AtLeastOnce());
        response.Should().Be("se borro con exito");
    }

    [Test]
    public void SearchProposalTest()
    {
        Entities.Proposal? proposal = _proposalService.GetProposalCode(ProposalStub.Proposal.Code!);
        _proposalService.Should().HaveBeenCalledFind(Times.AtLeastOnce());
        proposal.Should().Be(ProposalStub.Proposal);
    }

}
