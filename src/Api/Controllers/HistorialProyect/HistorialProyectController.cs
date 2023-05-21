using Api.Controllers.HistorialProposal;
using Entities;
using Entities.Exceptions;
using Mapster;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Services;

namespace Api.Controllers.HistorialProyect;
[ApiController]
[Route("HistorialProyect")]
public class HistorialProyectController : ControllerBase
{
    private readonly ProyectFeedBackService _proyectFeedBackService;
    private readonly HistoryProyectService _historyProyectService;

    public HistorialProyectController(ProyectFeedBackService proyectFeedBackService, HistoryProyectService historyProyectService)
    {
        _proyectFeedBackService = proyectFeedBackService;
        _historyProyectService = historyProyectService;
    }

    [HttpPost("register-feedback")]
    [Authorize(Roles = "Docente")]
    public ActionResult RegisterFeedback(
        [FromBody] ProyectFeedbackRequest proyectFeedbackRequest)
    {
        try
        {
            var feedBack = proyectFeedbackRequest.Adapt<ProyectFeedBack>();
            feedBack.Code = Random.Shared.Next();
            _proyectFeedBackService.SaveProyectFeedBack(feedBack);
            HistoryProyect historialProyect =
                new HistoryProyect(feedBack.Code,
                    proyectFeedbackRequest.ProyectCode);
            historialProyect.Code = Random.Shared.Next();
            _historyProyectService.SaveProyectlHistory(historialProyect);
            return Ok(
                new Response<HistorialProyectResponse>(
                    historialProyect.Adapt<HistorialProyectResponse>()));
        }
        catch (PersonExeption exeption)
        {
            return BadRequest(new Response<Void>(exeption.Message));
        }
    }
}
