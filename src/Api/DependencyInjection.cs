using Api.Controllers.Auth;
using Data.Repository;
using Services;

namespace Api;

public static class DependencyInjection
{
    public static void AddRepositories(this IServiceCollection repositories)
    {
        repositories.AddScoped<UsersRepository>();

    }

    public static void AddServices(this IServiceCollection services)
    {
        services.AddScoped<AuthService>();
        services.AddScoped<UsersService>();
    }
}
