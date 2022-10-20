using Api.Controllers.Auth;
using Data.Repository;
using Entities;
using Services;

namespace Api;

public static class DependencyInjection
{
    public static void AddRepositories(this IServiceCollection repositories)
    {
        repositories.AddScoped<UsersRepository>();
        repositories.AddScoped<PeopleRepository>();
        repositories.AddScoped<CitiesRepository>();
        repositories.AddScoped<DepartmentsRepository>();
    }

    public static void AddServices(this IServiceCollection services)
    {
        services.AddScoped<LocationsService>();
        services.AddScoped<AuthService>();
        services.AddScoped<UsersService>();
    }
}
