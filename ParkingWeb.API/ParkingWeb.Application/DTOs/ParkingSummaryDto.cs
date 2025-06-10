namespace ParkingWeb.Application.DTOs
{
    public class ParkingSummaryDto
    {
        public string Plate { get; set; }
        public string VehicleType { get; set; }
        public DateTime EntryTime { get; set; }
        public DateTime ExitTime { get; set; }
        public double TotalMinutes { get; set; }
        public decimal TotalAmount { get; set; }
        public decimal DiscountApplied { get; set; }
    }
}
