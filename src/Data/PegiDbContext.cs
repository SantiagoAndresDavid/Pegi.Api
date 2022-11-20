using Entities;
using Microsoft.EntityFrameworkCore;

namespace Data;

public class PegiDbContext : DbContext
{
    public PegiDbContext(DbContextOptions options) : base(options)
    {
    }

    public DbSet<User>? Users { get; set; }
    public DbSet<Person> People { get; set; }
    public DbSet<Study> Studies { get; set; }
    public DbSet<City> Cities { get; set; }
    public DbSet<Department> Departments { get; set; }
    public DbSet<Experience> Experiences { get; set; }
    public DbSet<AcademicProgram> AcademicPrograms { get; set; }
    public DbSet<Student> Students { get; set; }
    public DbSet<Professor> Professors { get; set; }
    public DbSet<Proposal> Proposals { get; set; }
    public DbSet<StudentProposal> StudentProposals { get; set; }
    public DbSet<ThematicArea> ThematicAreas { get; set; }
    public DbSet<ResearchSubline> ResearchSublines { get; set; }
    public DbSet<ResearchLine> ResearchLine { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<User>().HasIndex(user => user.Name).IsUnique();
    }
}
