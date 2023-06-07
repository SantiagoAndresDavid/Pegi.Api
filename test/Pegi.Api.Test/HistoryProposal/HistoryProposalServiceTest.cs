using FluentAssertions;
 using Moq;
using Pegi.Api.Test.HistoryProyect;
using Pegi.Api.Test.Proyect;
using Services;

namespace Pegi.Api.Test.HistoryProposal;

public class HistoryProposalServiceTest
{
    private HistoryProposalService _historyProposalService;

    [SetUp]
    public void SetUp()
    {
        _historyProposalService = new HistoryProposalService(HistoryProposalRepositoryMock.HistoryRepositoryMock());
    }

    [Test]
    public void SaveHistoryProposalsTest()
    {
        var (message, status) = _historyProposalService.SaveProposalHistory(HistoryProposalStub.HistoryProposal);
        _historyProposalService.Should().HaveBeenCalledSave(Times.AtLeastOnce());
        status.Should().BeTrue();
    }

    [Test]
    public void SearchHistoryProposalTest()
    {
        List<Entities.HistoryProposals> historyProposals = _historyProposalService.SearchHistoryProposal(ProyectStub.Proyect.Code!);
        _historyProposalService.Should().HaveBeenCalledFind(Times.AtLeastOnce());
        historyProposals.Should().BeEquivalentTo(HistorysProposalStub.HistoryProposals);
    }

}
