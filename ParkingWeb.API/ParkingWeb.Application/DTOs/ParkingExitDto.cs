namespace ParkingWeb.Application.DTOs
{
    public class ParkingExitDto
    {
        public string Plate { get; set; }
        public DateTime ExitTime { get; set; }
        public List<string>? InvoiceNumbers { get; set; }
    }
}