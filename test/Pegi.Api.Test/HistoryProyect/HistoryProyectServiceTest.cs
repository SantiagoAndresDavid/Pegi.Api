

using FluentAssertions;
using Moq;
using Pegi.Api.Test.Proyect;
using Services;

namespace Pegi.Api.Test.HistoryProyect;

public class HistoryProyectServiceTest
{
    private HistoryProyectService _historyProyectService;

    [SetUp]
    public void SetUp()
    {
        _historyProyectService = new HistoryProyectService(HistoryProyectRepositoryMock.HistoryRepositoryMock());
    }

    [Test]
    public void SaveHistoryProyectTest()
    {
        var (message, status) = _historyProyectService.SaveProyectlHistory(HistoryProyectStub.HistoryProyect);
        _historyProyectService.Should().HaveBeenCalledSave(Times.AtLeastOnce());
        status.Should().BeTrue();
    }

    [Test]
    public void SearchHistoryProyectsTest()
    {
        List<Entities.HistoryProyect> historyProyects = _historyProyectService.SearchProyectHistory(ProyectStub.Proyect.Code!);
        _historyProyectService.Should().HaveBeenCalledFind(Times.AtLeastOnce());
        historyProyects.Should().BeEquivalentTo(HistorysProyectStub.HistoryProyects);
    }

}
