using Entities;
using Microsoft.AspNetCore.Mvc;
using Services;

namespace Api.Controllers.Locations;

public class LocationsController : ControllerBase
{
    private readonly LocationsService _locationsService;

    public LocationsController(LocationsService locationsService)
    {
        _locationsService = locationsService;
    }

    [HttpGet("departments")]
    public ActionResult GetDepartments()
    {
        List<Department> departments = _locationsService.GetDepartments();
        return Ok(new Response<List<Department>>(departments));
    }

}
