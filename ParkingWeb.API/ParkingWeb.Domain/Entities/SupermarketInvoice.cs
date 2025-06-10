using ParkingWeb.Domain.Entities;

namespace ParkingWeb.Domain.Entities
{
    public class SupermarketInvoice
    {
        public int Id { get; set; }
        public string InvoiceNumber { get; set; } = string.Empty;

        public int ParkingEntryId { get; set; }
        public ParkingEntry ParkingEntry { get; set; }
    }
}
