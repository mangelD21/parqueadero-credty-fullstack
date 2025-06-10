namespace ParkingWeb.Domain.Entities
{
    public enum VehicleType
    {
        Car = 1,
        Motorcycle = 2,
        Bicycle = 3
    }

    public class Vehicle
    {
        public int Id { get; set; }
        public VehicleType Type { get; set; }
        public string Plate { get; set; } = string.Empty;
        public ICollection<ParkingEntry> ParkingEntries { get; set; }
    }
}
