using ParkingWeb.Domain.Entities;

namespace ParkingWeb.Domain.Entities
{
    public class ParkingEntry
    {
        public int Id { get; set; }
        public DateTime EntryTime { get; set; }
        public DateTime? ExitTime { get; set; }
        public decimal? TotalAmount { get; set; }
        public decimal? DiscountApplied { get; set; }

        public int VehicleId { get; set; }
        public Vehicle Vehicle { get; set; }

        public ICollection<SupermarketInvoice> SupermarketInvoices { get; set; }
    }
}
