import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../enviroment';

@Component({
  selector: 'app-vehicle-entry',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './vehicle-entry.component.html',
  styleUrl: './vehicle-entry.component.css',
})
export class VehicleEntryComponent {
  plate: string = '';
  vehicleType: number = 1;

  constructor(private http: HttpClient) {}

  successMessage: string = '';

  registerEntry() {
    const payload = {
      plate: this.plate,
      vehicleType: this.vehicleType,
      entryTime: new Date().toISOString(),
    };

    this.http.post(`${environment.apiUrl}/entry`, payload).subscribe({
      next: () => {
        this.plate = '';
        this.vehicleType = 1;

        this.successMessage = 'Vehículo registrado con éxito';

        setTimeout(() => {
        this.successMessage = '';
      }, 3000);
      },
      error: (err) => {
        console.error('Error al registrar ingreso: ', err);
        alert('Hubo un error al registrar el ingreso');
      }
    });
  }
}
