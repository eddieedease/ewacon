import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-map',
  templateUrl: './map.component.html',
  styleUrls: ['./map.component.css']
})

export class MapComponent implements OnInit {

  @Input() arcadeMarkers;
  @Input() currentMode;

  // TODO: doesn't work
  @Output() childEvent = new EventEmitter();

  
  markers = [];
  arcades = [];

   // current mode [0] = Archive,  [1] Offline  , [2]  Online
  title: String = 'Ewaste Arcades!';

  constructor() { }

  ngOnInit() {
  
    
    for (let index = 0; index < this.arcadeMarkers.length; index++) {
      // const element = this.arcadeMarkers[index];
      const modeNumber = String(this.currentMode);
      
      if (this.arcadeMarkers[index].status === modeNumber){
        const thisMarker = this.arcadeMarkers[index];

        const arrayLongLat = this.arcadeMarkers[index].longlat.split(',');
        this.arcadeMarkers[index].lat = Number(arrayLongLat[0]);
        this.arcadeMarkers[index].long = Number(arrayLongLat[1]);
      
        // transform the longlat values
        this.arcades.push(thisMarker);
      }
    }
    

    
    // alright strip down the longlat values in for loop
    // let array = string.split(',');
  }

  // communicate to parent
  clickMarker() {
  
     // TODO: doesn't work
    this.childEvent.emit('this is a test');
    }

  

}
