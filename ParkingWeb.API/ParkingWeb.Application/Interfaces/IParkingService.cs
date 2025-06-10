using ParkingWeb.Application.DTOs;

namespace ParkingWeb.Application.Interfaces
{
    public interface IParkingService
    {
        Task RegisterEntryAsync(ParkingEntryDto dto);
        Task<ParkingSummaryDto?> RegisterExitAsync(ParkingExitDto dto);
        Task<List<ParkingSummaryDto>> GetEntriesByDateRange(DateTime start, DateTime end);
    }
}
