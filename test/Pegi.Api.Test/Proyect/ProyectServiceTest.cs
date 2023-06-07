using FluentAssertions;
using Moq;
using Pegi.Api.Test.Proposal;
using Services;

namespace Pegi.Api.Test.Proyect;

public class ProyectServiceTest
{
    private ProyectService _proyectService;

    [SetUp]
    public void SetUp()
    {
        _proyectService = new ProyectService(ProyectRepositoryMock.ProposalRepository());
    }

    [Test]
    public void SaveProyectTest()
    {
        var (message, status) = _proyectService.SaveProyect(ProyectStub.Proyect);
        _proyectService.Should().HaveBeenCalledSave(Times.AtLeastOnce());
        status.Should().BeTrue();
    }

    [Test]
    public void UpdateProyectTest()
    {
        var (message, status) = _proyectService.UpdateProyect(ProyectStub.Proyect);
        _proyectService.Should().HaveBeenCalledUpdate(Times.AtLeastOnce());
        status.Should().BeTrue();
    }


    [Test]
    public void DeleteProyectTest()
    {
        String response = _proyectService.DeleteProyect(ProyectStub.Proyect.Code!);
        _proyectService.Should().HaveBeenCalledDelete(Times.AtLeastOnce());
        response.Should().Be("se borro con exito");
    }

    [Test]
    public void SearchProposalTest()
    {
        Entities.Proyect? proyect = _proyectService.GetProyectCode(ProyectStub.Proyect.Code!);
        _proyectService.Should().HaveBeenCalledFind(Times.AtLeastOnce());
        proyect.Should().Be(ProyectStub.Proyect);
    }
}
