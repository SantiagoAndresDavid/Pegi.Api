using Api.Controllers.Auth;
using Data.Repository;
using Data.Repository.shared;
using Entities;
using Services;

namespace Api;

public static class DependencyInjection
{
    public static void AddRepositories(this IServiceCollection repositories)
    {
        repositories.AddScoped<IRepository<User>, UsersRepository>();
        repositories.AddScoped<IRepository<Person>,PeopleRepository>();
        repositories.AddScoped<IRepository<City>,CitiesRepository>();
        repositories.AddScoped<IRepository<Department>,DepartmentsRepository>();
        repositories.AddScoped<IRepository<Study>,StudiesRespository>();
        repositories.AddScoped<IRepository<Experience>,ExperiencesRepository>();
        repositories.AddScoped<IRepository<Professor>,ProfessorRepository>();
        repositories.AddScoped<IRepository<AcademicProgram>,AcademicProgramsRepository>();
        repositories.AddScoped<IRepository<Student>,StudentsRepository>();
        repositories.AddScoped<IRepository<ThematicArea>,ThematicAreasRepository>();
        repositories.AddScoped<IRepository<ResearchSubline>,ResearchSubLinesRepository>();
        repositories.AddScoped<IRepository<ResearchLine>,ResearchLinesRepository>();
        repositories.AddScoped<IRepository<Proposal>,ProposalRepository>();
        repositories.AddScoped<IRepository<ProposalFeedBack>,ProposalFeedBackRepository>();
        repositories.AddScoped<IRepository<HistoryProposals>,HistoryProposalsRepository>();
        repositories.AddScoped<IRepository<Proyect>,ProyectRepository>();
        repositories.AddScoped<IRepository<HistoryProyect>,HistoryProyectRepository>();
        repositories.AddScoped<IRepository<ProyectFeedBack>,ProyectFeedBackRepository>();
    }

    public static void AddServices(this IServiceCollection services)
    {
        services.AddScoped<LocationsService>();
        services.AddScoped<AuthService>();
        services.AddScoped<UsersService>();
        services.AddScoped<PeopleService>();
        services.AddScoped<StudiesService>();
        services.AddScoped<ExperienceService>();
        services.AddScoped<ProfessorService>();
        services.AddScoped<AcademicProgramService>();
        services.AddScoped<StudentsService>();
        services.AddScoped<ThematicAreaService>();
        services.AddScoped<ResearchSubLineService>();
        services.AddScoped<ResearchLineService>();
        services.AddScoped<ProposalService>();
        services.AddScoped<ProposalFeedBackService>();
        services.AddScoped<HistoryProposalService>();
        services.AddScoped<ProyectService>();
        services.AddScoped<HistoryProyectService>();
        services.AddScoped<ProyectFeedBackService>();
    }
}
