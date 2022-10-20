using Data.Repository;
using Entities;

namespace Services;

public class LocationsService
{
    private readonly CitiesRepository _citiesRepository;
    private readonly DepartmentsRepository _departmentsRepository;

    public LocationsService(CitiesRepository citiesRepository, DepartmentsRepository departmentsRepository)
    {
        _citiesRepository = citiesRepository;
        _departmentsRepository = departmentsRepository;
    }

    public List<Department> GetDepartments()
    {
        return _departmentsRepository.GetAll();
    }
}
