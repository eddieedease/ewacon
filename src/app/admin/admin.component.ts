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
  EwasteServiceService
} from '../ewaste-service.service';

import {
  DatatableComponent
} from '@swimlane/ngx-datatable';


// toaster thing
import {
  ToastrService
} from 'ngx-toastr';

declare var $: any;

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})



export class AdminComponent implements OnInit {

  @ViewChild(DatatableComponent) table: DatatableComponent;

  // datatable vars
  rows = [];
  rowsActions = [];
  columns = [];
  temp = [];
  selected = [];

  modalTitle = 'someTitle';
  modalInfo = 'someInfo';

    // Keeping track of curent selected/editted object Id & Name
  currentId;
  currentName;

  // modalstatus for keeping in check what to do
  modalstatus;

  // options for active 0) Disabled 1) Offline 2) Online
  lOptions: any[] = [{
      id: 1,
      Name: 'Billy Williams',
      Gender: 'male'
    },
    {
      id: 2,
      Name: 'Sally Ride',
      Gender: 'female'
    }
  ];
  curUser: any = this.lOptions[0]; //

  // vars for editing view

  arcadeName;
  arcadeStatus = 1;
  arcadeLocation;
  arcadeLongLat;
  arcadeTeamsTot;
  arcadeDatePlaced;
  arcadeDateEnd;




  // boolean view
  loggedin = false;

  passw = '';
  // tslint:disable-next-line:max-line-length
  constructor(private serser: EwasteServiceService, private router: Router, private route: ActivatedRoute, private _sanitizer: DomSanitizer, private toastr: ToastrService) {}

  ngOnInit() {

    // check if loggedin is active for tabs
    if (this.serser.loggedin === true) {
      this.loggedin = true;
      $(document).ready(function () {
        $('ul.tabs').tabs();
        $('.modal').modal();
      });
    }

    // modal
    $(document).ready(function () {
      $('.modal').modal();
    });




    // example call
    this.serser.getAllCall().subscribe(value => this.gotgetAllCall(value));
  }

  gotgetAllCall(_value) {
    // [0] Actions [1] Arcades  [2] Archive   [3]Highscores   [4]teams
    this.serser.debugLog(_value[1]);
    this.rows = _value[1];
    this.rowsActions = _value[0];

  }

  setOnOff(id: any): void {
    console.log(id);
    this.arcadeStatus = id;
  }


  openAddModal() {
    this.arcadeStatus = 1;
    // modalstatus = 1 add new
    this.modalstatus = 1;
    this.modalTitle = 'Maak een nieuwe arcade aan';
    this.modalInfo = 'Vul hier de info in van de nieuwe arcade:';
    $('#modal1').modal('open');

    // jquery needies
    $(document).ready(function () {
      $('select').material_select();
    });
  }

  openEditModal(_whichId, _whichName) {

    this.currentId = _whichId;
    this.currentName = _whichName;
    // modalstatus = 2 edit existing
    this.modalstatus = 2;
    this.serser.debugLog(_whichId + '  clicked');
    this.modalTitle = 'Bewerk deze arcade';
    this.modalInfo = 'Wijzig hier de info van de arcade:';

    for (let i = 0; i < this.rows.length; i++) {
      if (this.rows[i].id === _whichId) {
        console.log('hittit!');
        this.arcadeName = this.rows[i].name;
        this.arcadeStatus = this.rows[i].status;
        this.arcadeLocation = this.rows[i].location;
        this.arcadeLongLat = this.rows[i].longlat;
        console.log(this.arcadeStatus);
        this.arcadeTeamsTot = this.rows[i].teamstot;
        this.arcadeDatePlaced = this.rows[i].dateplaced;
        this.arcadeDateEnd = this.rows[i].dateend;
      }
    }
    $(document).ready(function () {
      $('select').material_select();
    });

    $('#modal1').modal('open');
  }



  openTeamModal() {
    $('#modal2').modal('open');
  }

  addArcade() {
    console.log(this.arcadeStatus);
    // name must not be empty
    if (this.arcadeName !== '') {
      // tslint:disable-next-line:max-line-length
      this.serser.insertNew(this.arcadeName, this.arcadeStatus, this.arcadeLocation, this.arcadeLongLat, this.arcadeTeamsTot, this.arcadeDatePlaced, this.arcadeDateEnd).subscribe(value => this.arcadeCreated(value));
    } else {
      // TOAST: NAME MAY NOT BE EMPTY!
    }
  }

  arcadeCreated(event) {
    // set defaults
    this.arcadeName = '';
    this.arcadeStatus = 1;
    this.arcadeLocation = '';
    this.arcadeLongLat = '';
    this.arcadeTeamsTot = '';
    this.arcadeDatePlaced = '';
    this.arcadeDateEnd = '';
    console.log(event);
    this.serser.getAllCall().subscribe(value => this.gotgetAllCall(value));
    this.toastr.success(' :) ', 'Aangemaakt');
  }




  /**
   *  Deletion
   *
   */
  removeArcade() {
    this.serser.debugLog('deletion of : ' + this.currentId + ' with name ' + this.currentName);
    this.serser.deleteArcade(this.currentId, this.currentName).subscribe(value => this.gotDeleteCall(value));
  }

  gotDeleteCall(_event) {
   this.serser.debugLog(_event);
   this.serser.getAllCall().subscribe(value => this.gotgetAllCall(value));
   this.toastr.success(' :) ', 'Arcade is verwijderd');
  }



  /**
   *  Arcades datatable
   *
   */

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
    const val = _value.toLowerCase();
    // filter our data
    const temp = this.temp.filter(function (d) {
      return d.Library.toLowerCase().indexOf(val) !== -1 || !val;
    })
    // update the rows
    this.rows = temp;
    // Whenever the filter changes, always go back to the first page
    this.table.offset = 0;
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
