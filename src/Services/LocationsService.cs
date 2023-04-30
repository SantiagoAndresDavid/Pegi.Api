using Data.Repository;
using Data.Repository.shared;
using Entities;

namespace Services;

public class LocationsService
{
    private readonly IRepository<City> _citiesRepository;
    private readonly IRepository<Department> _departmentsRepository;

    public LocationsService(IRepository<City> citiesRepository, IRepository<Department> departmentsRepository)
    {
        _citiesRepository = citiesRepository;
        _departmentsRepository = departmentsRepository;
    }


    public List<Department> GetDepartments()
    {
        return _departmentsRepository.GetAll();
    }

    public List<City> GetCities(string department)
    {
        return _citiesRepository.Filter(city =>
            city.Department != null && city.Department.Name == department);
    }
}
