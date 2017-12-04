import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-map',
  templateUrl: './map.component.html',
  styleUrls: ['./map.component.css']
})

export class MapComponent implements OnInit {

  @Input() arcadeMarkers;
  @Input() currentMode;

  
  markers = [];
  arcades = [];

   // current mode [0] = Archive,  [1] Offline  , [2]  Online

  title: String = 'Ewaste Arcades!';

  constructor() { }

  ngOnInit() {
  
    console.log(this.arcadeMarkers);
    for (let index = 0; index < this.arcadeMarkers.length; index++) {
      // const element = this.arcadeMarkers[index];
      const modeNumber = String(this.currentMode);
      console.log(typeof modeNumber + '  ' + modeNumber);
      console.log(typeof this.arcadeMarkers[index].status + '  ' + this.arcadeMarkers[index].status);
      if (this.arcadeMarkers[index].status === modeNumber){
        const thisMarker = this.arcadeMarkers[index];

        const arrayLongLat = this.arcadeMarkers[index].longlat.split(',');
        this.arcadeMarkers[index].lat = Number(arrayLongLat[0]);
        this.arcadeMarkers[index].long = Number(arrayLongLat[1]);
        console.log(typeof this.arcadeMarkers[index].lat);
        

        // transform the longlat values

        this.arcades.push(thisMarker);
      }
    }
    
    //this.arcades = this.arcadeMarkers;
    console.log(this.arcades)
    // alright strip down the longlat values in for loop
    // let array = string.split(',');
  }

}
