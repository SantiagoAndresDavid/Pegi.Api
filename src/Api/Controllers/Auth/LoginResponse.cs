using Api.Controllers.People;
using Entities;

namespace Api.Controllers.Auth;

public record LoginResponse(PersonResponse Person);
