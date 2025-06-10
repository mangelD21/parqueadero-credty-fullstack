import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { HttpClient, HttpParams } from '@angular/common/http';
import { environment } from '../../../enviroment';

@Component({
  selector: 'app-vehicle-history',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './vehicle-history.html',
  styleUrls: ['./vehicle-history.css']
})
export class VehicleHistoryComponent {
  start: string = '';
  end: string = '';
  data: any[] = [];

  constructor(private http: HttpClient) {}

  buscarHistorial() {
    const params = new HttpParams()
      .set('start', new Date(this.start).toISOString())
      .set('end', new Date(this.end).toISOString());

    this.http.get<any[]>(`${environment.apiUrl}/history`, { params }).subscribe({
      next: (res) => {
        this.data = res;
      },
      error: (err) => {
        console.error('Error consultando historial:', err);
        alert('Error al cargar historial');
      }
    });
  }
}
