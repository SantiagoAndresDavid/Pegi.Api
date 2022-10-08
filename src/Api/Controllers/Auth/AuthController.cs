using Entities;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Services;

namespace Api.Controllers.Auth;

public class AuthController : ControllerBase
{
    private readonly UsersService _usersService;

    public AuthController(UsersService usersService)
    {
        _usersService = usersService;
    }

    [HttpPost("sign-up")]
    public ActionResult SignUp([FromBody] SingUpRequest signUpRequest)
    {
        var user = signUpRequest.Adapt<User>();
        if (_usersService.SaveUser(user))
            return Ok(new Response<Void>("Usuario creado con exito",
                false));

        return BadRequest(
            new Response<Void>("No se pudo registrar el usuario"));
    }
}
