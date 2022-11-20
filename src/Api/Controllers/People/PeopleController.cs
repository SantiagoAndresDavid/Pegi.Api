using Entities;
using Entities.Exceptions;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Services;

namespace Api.Controllers.People;
[ApiController]
[Route("people")]
public class PeopleController : ControllerBase
{
    private readonly PeopleService _peopleService;

    public PeopleController(PeopleService peopleService)
    {
        _peopleService = peopleService;
    }

    [HttpPost]
    public ActionResult RegisterPeople(
        [FromBody] CreatePersonRequest createPersonRequest)
    {
        try
        {
            var person = createPersonRequest.Adapt<Person>();
            _peopleService.SavePerson(person);
            return Ok(new Response<Void>("Usuario creado con exito", false));
        }
        catch (PersonExeption exeption)
        {
            return BadRequest(new Response<Void>(exeption.Message));
        }
    }

    [HttpGet("{document}")]
    public ActionResult GetPerson([FromRoute] string document)
    {
        try
        {
            Person? person = _peopleService.SearchPerson(document);
            if(person == null)
            {
                return BadRequest(new Response<Void>("no se encontro a la persona"));
            }
            return Ok(new Response<PersonResponse>(person.Adapt<PersonResponse>()));
        }
        catch (PersonExeption e)
        {
            return BadRequest(new Response<Void>(e.Message));
        }
    }

    [HttpDelete("{document}")]
    public ActionResult DeletePerson([FromRoute] string document)
    {
        try
        {
            string message = _peopleService.DeletePerson(document);
            return Ok(new Response<Void>(message,false));
        }
        catch (Exception e)
        {
            return BadRequest(new Response<Void>(e.Message));
        }
    }
}
