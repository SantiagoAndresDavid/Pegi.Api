using Entities;
using Entities.Exceptions;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Services;

namespace Api.Controllers.Auth;

public class AuthController : ControllerBase
{
    private readonly UsersService _usersService;
    private readonly AuthService _authService;

    public AuthController(UsersService usersService, AuthService authService)
    {
        _usersService = usersService;
        _authService = authService;
    }

    [HttpPost("login")]
    public ActionResult Login([FromBody] LoginRequest loginRequest)
    {
        try
        {
            string message = _authService.LogIn(loginRequest.Name, loginRequest.Password);
            return Ok(message);
        }
        catch (AuthException e)
        {
            return BadRequest(new  Response<Void>(e.Message));
        }
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
