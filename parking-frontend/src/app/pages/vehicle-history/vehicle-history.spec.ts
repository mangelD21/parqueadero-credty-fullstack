import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VehicleHistoryComponent } from './vehicle-history';

describe('VehicleHistory', () => {
  let component: VehicleHistoryComponent;
  let fixture: ComponentFixture<VehicleHistoryComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [VehicleHistoryComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(VehicleHistoryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
