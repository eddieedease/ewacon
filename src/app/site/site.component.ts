import {
  Component,
  OnInit
} from '@angular/core';

import {
  DomSanitizer,
  SafeHtml
} from '@angular/platform-browser';
import {
  Router,
  ActivatedRoute
} from '@angular/router';

import {
  MapComponent
} from '../map/map.component';

import {
  EwasteServiceService
} from '../ewaste-service.service';


declare var $: any;

@Component({
  selector: 'app-site',
  templateUrl: './site.component.html',
  styleUrls: ['./site.component.css']
})



export class SiteComponent implements OnInit {

  activeArcades;
  notActiveArcades;


  // tslint:disable-next-line:max-line-length
  constructor(private serser: EwasteServiceService, private router: Router, private route: ActivatedRoute, private _sanitizer: DomSanitizer) {
    this.activeArcades = [];
    this.notActiveArcades = [];
  }


  ngOnInit() {
    // for testing, populate both arcades
    for (let index = 0; index < 4; index++) {
      const item: String = 'blabla';
      this.activeArcades.push('hasda');
    }

    for (let index2 = 0; index2 < 0; index2++) {
      const item: String = 'blabla';
      this.notActiveArcades.push('hasda');
    }

    // jquery init
    $(document).ready(function() {
      $('select').material_select();
    });




    // example call
    this.serser.testCall().subscribe(value => this.gotTestCall(value));
  }

  gotTestCall(_value) {
    this.serser.debugLog(_value);
  }

}
