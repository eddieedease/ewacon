import { TestBed, inject } from '@angular/core/testing';

import { EwasteServiceService } from './ewaste-service.service';

describe('EwasteServiceService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [EwasteServiceService]
    });
  });

  it('should be created', inject([EwasteServiceService], (service: EwasteServiceService) => {
    expect(service).toBeTruthy();
  }));
});
