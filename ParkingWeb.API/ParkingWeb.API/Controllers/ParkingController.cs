using Microsoft.AspNetCore.Mvc;
using ParkingWeb.Application.DTOs;
using ParkingWeb.Application.Interfaces;

namespace ParkingWeb.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ParkingController : ControllerBase
    {
        private readonly IParkingService _parkingService;

        public ParkingController(IParkingService parkingService)
        {
            _parkingService = parkingService;
        }

        [HttpPost("entry")]
        public async Task<IActionResult> RegisterEntry([FromBody] ParkingEntryDto dto)
        {
            await _parkingService.RegisterEntryAsync(dto);
            return Ok(new {message = "Ingreso registrado con exito"});
        }

        [HttpPost("exit")]
        public async Task<IActionResult> RegisterExit([FromBody] ParkingExitDto dto)
        { 
            var summary = await _parkingService.RegisterExitAsync(dto);
            if (summary == null)
            {
                return NotFound(new { message = "No se encontro entrada activa para esta placa" });
            }
            return Ok(summary);
        }

        [HttpGet("history")]
        public async Task<IActionResult> GetHistory([FromQuery] DateTime start, [FromQuery] DateTime end)
        { 
            var result = await _parkingService.GetEntriesByDateRange(start, end);
            return Ok(result);
        }
    }
}
