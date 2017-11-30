import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-map',
  templateUrl: './map.component.html',
  styleUrls: ['./map.component.css']
})

export class MapComponent implements OnInit {

  @Input() arcadeMarkers;

  markers = [];

  title: String = 'Ewaste Arcades!';

  constructor() { }

  ngOnInit() {
    console.log(this.arcadeMarkers);
    
    
    // alright strip down the longlat values in for loop
    // let array = string.split(',');
  }

}
