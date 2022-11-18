using Entities;
using Entities.Exceptions;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Services;

namespace Api.Controllers.Auth;

[ApiController]
[Route("auth")]
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
            var (message, foundUser) = _authService.LogIn(loginRequest.Name,
                loginRequest.Password);
            return Ok(new Response<User>(message, foundUser));
        }
        catch (AuthException e)
        {
            return BadRequest(new Response<Void>(e.Message));
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

    [HttpPost("{nameUser}")]
    public ActionResult AddPerson(string nameUser,[FromBody] string document)
    {
        var response = _usersService.AddPersonDocument(document, nameUser);
        if (response.Item2 == true)
            return Ok(new Response<Void>(response.Item1,
                false));
        return BadRequest(
            new Response<Void>("No se agregar persona al usuario"));
    }
}
