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
  EwasteServiceService
} from '../ewaste-service.service';

declare var $: any;

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})



export class AdminComponent implements OnInit {

  rows = [];
  columns = [];

  // boolean view
  loggedin = false;

  passw = '';
  // tslint:disable-next-line:max-line-length
  constructor(private serser: EwasteServiceService, private router: Router, private route: ActivatedRoute, private _sanitizer: DomSanitizer) {}

  ngOnInit() {

      // check if loggedin is active
    if (this.serser.loggedin === true) {
      this.loggedin = true;
      $(document).ready(function () {
        $('ul.tabs').tabs();
      });
    }

    // dummy data for tables
    this.rows = [{
        id: '1',
        locatie: 'TU Einhoven',
        company: 'Swimlane'
      },
      {
        id: '2',
        locatie: 'Pakistan',
        company: 'KFC'
      },
      {
        id: '3',
        locatie: 'Klokhuis',
        company: 'Burger King'
      },
    ];
    this.columns = [{
        prop: 'id'
      },
      {
        name: 'locatie'
      }
    ];
  }


  logIn() {
    // dirty hacking
    if (this.passw === 'visgoud') {
      this.serser.debugLog('Ingelogd');
      this.serser.loggedin = true;
      this.loggedin = true;
      $(document).ready(function () {
        $('ul.tabs').tabs();
      });
    }
  }

}
