using Entities;
using Entities.Exceptions;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Services;

namespace Api.Controllers.People;

public class PeopleController : ControllerBase
{
    private readonly PeopleService _peopleService;

    public PeopleController(PeopleService peopleService)
    {
        _peopleService = peopleService;
    }

    [HttpPost("registrer-person")]
    public ActionResult RegisterPeople(
        [FromBody] CreatePersonRequest createPersonRequest)
    {
        try
        {
            var person = createPersonRequest.Adapt<Person>();
            _peopleService.savePerson(person);
            return Ok(new Response<Void>("Usuario creado con exito", false));
        }
        catch (PersonExeption exeption)
        {
            return BadRequest(new Response<Void>(exeption.Message));
        }
    }

    [HttpGet("{documentPerson}")]
    public ActionResult GetPerson([FromRoute] string documentPerson)
    {
        try
        {
            Person? person = _peopleService.SearchPerson(documentPerson);
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
}
