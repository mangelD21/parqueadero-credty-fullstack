using Microsoft.EntityFrameworkCore;
using ParkingWeb.Application.DTOs;
using ParkingWeb.Application.Interfaces;
using ParkingWeb.Domain.Entities;
using ParkingWeb.Infrastructure.Persistence;

namespace ParkingWeb.Application.Services
{
    public class ParkingService : IParkingService
    {
        private readonly ApplicationDbContext _context;

        public ParkingService(ApplicationDbContext context)
        { 
            _context = context;
        }

        public async Task RegisterEntryAsync(ParkingEntryDto dto)
        { 
            var vehicle = await _context.Vehicles
                .FirstOrDefaultAsync(v => v.Plate == dto.Plate);

            if (vehicle == null)
            {
                vehicle = new Vehicle
                {
                    Plate = dto.Plate,
                    Type = (VehicleType)dto.VehicleType,
                };
                await _context.Vehicles.AddAsync(vehicle);
                await _context.SaveChangesAsync();
            }

            var entry = new ParkingEntry
            {
                VehicleId = vehicle.Id,
                EntryTime = dto.EntryTime
            };

            await _context.ParkingEntries.AddAsync(entry);
            await _context.SaveChangesAsync();
        }

        public async Task<ParkingSummaryDto?> RegisterExitAsync(ParkingExitDto dto)
        {
            var vehicle = await _context.Vehicles
                .Include(v => v.ParkingEntries)
                .FirstOrDefaultAsync(v => v.Plate == dto.Plate);

            if (vehicle == null) return null;

            var lastEntry = vehicle.ParkingEntries
                .Where(e => e.ExitTime == null)
                .OrderByDescending(e => e.EntryTime)
                .FirstOrDefault();

            if (lastEntry == null) return null;

            lastEntry.ExitTime = dto.ExitTime;

            var minutes = (lastEntry.ExitTime.Value - lastEntry.EntryTime).TotalMinutes;
            var rate = vehicle.Type switch
            {
                VehicleType.Car => 110,
                VehicleType.Motorcycle => 50,
                VehicleType.Bicycle => 10,
                _ => 0
            };

            var total = (decimal)minutes * rate;
            var discount = 0m;

            if (dto.InvoiceNumbers?.Any() == true)
            {
                discount = total * 0.30m;
                lastEntry.SupermarketInvoices = dto.InvoiceNumbers.Select(i => new SupermarketInvoice
                {
                    InvoiceNumber = i,
                }).ToList();
            }

            lastEntry.TotalAmount = total - discount;
            lastEntry.DiscountApplied = discount;

            await _context.SaveChangesAsync();

            return new ParkingSummaryDto
            {
                Plate = vehicle.Plate,
                VehicleType = vehicle.Type.ToString(),
                EntryTime = lastEntry.EntryTime,
                ExitTime = lastEntry.ExitTime.Value,
                TotalMinutes = minutes,
                TotalAmount = total,
                DiscountApplied = discount,
            };
        }

        public async Task<List<ParkingSummaryDto>> GetEntriesByDateRange(DateTime start, DateTime end)
        {
            var entries = await _context.ParkingEntries
                .Include(e => e.Vehicle)
                .Where(e => e.EntryTime >= start && e.EntryTime <= end && e.ExitTime != null)
                .ToListAsync();

            return entries.Select(e => new ParkingSummaryDto
            {
                Plate = e.Vehicle.Plate,
                VehicleType = e.Vehicle.Type.ToString(),
                EntryTime = e.EntryTime,
                ExitTime = e.ExitTime.Value,
                TotalMinutes = (e.ExitTime.Value - e.EntryTime).TotalMinutes,
                TotalAmount = e.TotalAmount ?? 0,
                DiscountApplied = e.DiscountApplied ?? 0
            }).ToList();
        }
    }
}
