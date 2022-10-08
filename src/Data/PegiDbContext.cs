using Entities;
using Microsoft.EntityFrameworkCore;

namespace Data;

public class PegiDbContext : DbContext
{
    public PegiDbContext(DbContextOptions options) : base(options)
    {

    }
    public DbSet<User>? Users { get; set; }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<User>().HasIndex(user => user.Name).IsUnique();
    }
}
