import {
  Component,
  OnInit,
  ViewChild
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

import {
  DatatableComponent
} from '@swimlane/ngx-datatable';


declare var $: any;

@Component({
  selector: 'app-site',
  templateUrl: './site.component.html',
  styleUrls: ['./site.component.css']
})



export class SiteComponent implements OnInit {


  @ViewChild(DatatableComponent) table: DatatableComponent;

  activeArcades;
  notActiveArcades;

  allPhones = 0;

  // datatable vars
  rows = [];
  columns = [];
  temp = [];
  selected = [];

  check= 'whut';


  // tslint:disable-next-line:max-line-length
  constructor(private serser: EwasteServiceService, private router: Router, private route: ActivatedRoute, private _sanitizer: DomSanitizer) {
    this.activeArcades = [];
    this.notActiveArcades = [];

    // dummy data for tables
    this.rows = [
    ];

    this.columns = [{
        name: 'Locatie'
      },
      {
        name: 'Aantal'
      }
    ];
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
    $(document).ready(function () {
      $('select').material_select();
    });




    // example call
    this.serser.getAllCall().subscribe(value => this.gotgetAllCall(value));
  }

  gotgetAllCall(_value) {
    this.serser.debugLog(_value[1]);
    this.rows = _value[1];

    // Calculate all the phones collected
    for (let index = 0; index < this.rows.length; index++) {
      const x = this.rows[index].phonetot;
      const y = +x; // y: number
      this.allPhones = this.allPhones + y;
    }

  }



  // filter the arcades
  // TODO: implement
  filterAracdes() {

  }



  // NOTE: Datatables functions
  onSort(event) {
    // event was triggered, start sort sequence
    this.serser.debugLog('Sort Event' + event);

    this.serser.debugLog(event.column.name);

    const whichDir = event.newValue;
    this.serser.debugLog('dir is' + whichDir);
    let magicw;

    switch (event.column.name) {
      case 'Titel':
        magicw = 'name';
        break;
      case 'Aantal':
        magicw = 'phonetot';
        break;
      case 'Locatie':
        magicw = 'location';
        break;
    }

    const rows = [...this.rows];
    // this is only for demo purposes, normally
    // your server would return the result for
    // you and you would just set the rows prop
    this.serser.debugLog(this.rows);
    // Sorting call
    rows.sort(this.sortWhat(magicw, whichDir));
    this.rows = rows;
  }

  /**
   * Datables descending, ascending sorting with clicking on top column
   */
  sortWhat(sortwhat, _dir) {
    if (_dir === 'desc') {
      // Some magical sorting over here
      let sortOrder = 1;
      if (sortwhat[0] === '-') {
        sortOrder = -1;
        sortwhat = sortwhat.substr(1);
      }
      return function (a, b) {
        const result = (a[sortwhat] < b[sortwhat]) ? -1 : (a[sortwhat] > b[sortwhat]) ? 1 : 0;
        return result * sortOrder;
      }
    } else if (_dir === 'asc') {
      let sortOrder2 = 1;
      if (sortwhat[0] === '-') {
        sortOrder2 = -1;
        sortwhat = sortwhat.substr(1);
      }
      return function (a, b) {
        const result = (b[sortwhat] < a[sortwhat]) ? -1 : (b[sortwhat] > a[sortwhat]) ? 1 : 0;
        return result * sortOrder2;
      }
    }
  }



  // The updating of the libs
  /**
   * the Own items Searching in name, looks at the model
   */
  updateFilter(_value) {
    // this.serser.debugLog("event zoek updatoz hier");
    // this.serser.debugLog(event);
    // this.serser.debugLog(event.target.value);

    const val = _value.toLowerCase();

    // filter our data
    const temp = this.temp.filter(function (d) {
      return d.Title.toLowerCase().indexOf(val) !== -1 || !val;
    });

    // update the rows
    this.rows = temp;
    // Whenever the filter changes, always go back to the first page
    this.table.offset = 0;
  }

  /**
   * the Own items Searching in library, looks at the model
   */
  updateFilterLib(_value) {
    // this.serser.debugLog("event zoek updatoz hier");
    // this.serser.debugLog(event);
    // this.serser.debugLog(event.target.value);

    const val = _value.toLowerCase();

    // filter our data
    const temp = this.temp.filter(function (d) {
      return d.Library.toLowerCase().indexOf(val) !== -1 || !val;
    });

    // update the rows
    this.rows = temp;
    // Whenever the filter changes, always go back to the first page
    this.table.offset = 0;
  }

}
