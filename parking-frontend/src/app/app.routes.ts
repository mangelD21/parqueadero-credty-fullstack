import { Routes } from '@angular/router';
import { VehicleEntryComponent } from './pages/vehicle-entry/vehicle-entry.component';
import { VehicleExitComponent } from './pages/vehicle-exit/vehicle-exit.component';
import { VehicleHistoryComponent } from './pages/vehicle-history/vehicle-history';

export const routes: Routes = [
    {path: '', component: VehicleEntryComponent},
    {path: 'exit', component: VehicleExitComponent},
    {path: 'history', component: VehicleHistoryComponent}
];
