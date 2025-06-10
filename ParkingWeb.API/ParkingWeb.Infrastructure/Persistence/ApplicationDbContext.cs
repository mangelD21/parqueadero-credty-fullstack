using Microsoft.EntityFrameworkCore;
using ParkingWeb.Domain.Entities;

namespace ParkingWeb.Infrastructure.Persistence
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options) { }
        public DbSet<Vehicle> Vehicles { get; set; }
        public DbSet<ParkingEntry> ParkingEntries { get; set; }
        public DbSet<SupermarketInvoice> SupermarketInvoices { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Vehicle>().HasIndex(v => v.Plate).IsUnique();
            base.OnModelCreating(modelBuilder);
        }
    }
}