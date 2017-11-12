import { Component, OnInit } from '@angular/core';

import {MapComponent} from '../map/map.component';

@Component({
  selector: 'app-site',
  templateUrl: './site.component.html',
  styleUrls: ['./site.component.css']
})
export class SiteComponent implements OnInit {

  activeArcades;
  notActiveArcades;


  constructor() {
    this.activeArcades = [];
    this.notActiveArcades = [];
  }

  ngOnInit() {

    // for testing, populate both arcades
    for (let index = 0; index < 4; index++) {
      const item: String = 'blabla';
      this.activeArcades.push('hasda');
    }

    for (let index2= 0; index2 < 0; index2++) {
      const item: String = 'blabla';
      this.notActiveArcades.push('hasda');
    }
  }

}
