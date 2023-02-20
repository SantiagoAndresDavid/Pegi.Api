using Api;
using Data;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);


ConfigurationManager configuration = builder.Configuration;
string? connectionString =
    configuration.GetConnectionString("DefaultConnection");

builder.Services.AddDbContext<PegiDbContext>(options =>
    options.SetupDatabaseEngine(connectionString)
);

builder.Services.AddRepositories();
builder.Services.AddServices();
builder.Services.AddControllers();

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddCors(options =>
    options.AddDefaultPolicy(
        policy => policy.WithOrigins("*").AllowAnyMethod().AllowAnyHeader())
);


WebApplication app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors();

app.UseAuthorization();

app.MapControllers();

app.Run();
