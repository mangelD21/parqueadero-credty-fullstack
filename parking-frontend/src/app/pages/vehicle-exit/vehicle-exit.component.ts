import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../enviroment';

@Component({
  selector: 'app-vehicle-exit',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './vehicle-exit.component.html',
  styleUrls: ['./vehicle-exit.component.css'],
})
export class VehicleExitComponent {
  plate: string = '';
  invoicesRaw: string = '';
  summary: any = null;
  errorMessage: string = '';

  constructor(private http: HttpClient) {}

  successMessage: string = '';

  registerExit() {
    const payload = {
      plate: this.plate,
      exitTime: new Date().toISOString(),
      invoiceNumbers: this.parseInvoices(this.invoicesRaw),
    };

    this.http.post(`${environment.apiUrl}/exit`, payload).subscribe({
      next: (res) => {
        this.summary = res;
        this.errorMessage = '';
        this.successMessage = 'Salida registrada correctamente';

        this.plate = '';
        this.invoicesRaw = '';

        setTimeout(() => {
          this.successMessage = '';
        }, 3000);
      },
      error: (err) => {
        this.summary = null;
        if (err.status === 404) {
          this.errorMessage = err.error?.message || 'Vehículo no encontrado';
        } else {
          this.errorMessage = 'Error al registrar la salida';
        }
      },
    });
  }

  private parseInvoices(raw: string): string[] {
    return raw
      .split(',')
      .map((f) => f.trim())
      .filter((f) => f.length > 0);
  }
}
