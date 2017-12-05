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

  

  // modalstatus for keeping in check what to do with modals
  // [1] = new item  [2] = edit
  // does account for the arcades modal + the action
  modalstatus;

  // vars for editing view

    // Keeping track of curent selected/editted object Id & Name
    currentId;
    currentName;

  arcadeName;
  arcadeStatus = 1;
  arcadeLocation;
  arcadeLongLat;
  arcadeTeamsTot;
  arcadeDatePlaced;
  arcadeDateEnd;

  currentActionId;
  currentcurrentActionName;
  actionName;
  actionStart;
  actionEnd;
  actionStatus = 1;


  team1Name;
  team2Name;
  team3Name;
  team4Name;
  team5Name;
  team6Name;
  team7Name;
  team8Name;
  team9Name;
  team10Name;
  team11Name;




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

    // below not more nessy
/*     // toggle for arcade Online OffLine
  setOnOff(id: any): void {
    console.log(id);
    this.arcadeStatus = id;
  }

    // toggle for actions Active/Notactive
  setActiveNotActive(id: any): void {
    console.log(id);
    this.actionStatus = id;
  } */


  openAddModal() {
    // modalstatus = 1 add new  (2 = edit existing)
    this.modalstatus = 1;

    this.arcadeName = '';
    this.arcadeStatus = 1;
    this.arcadeLocation = '';
    this.arcadeLongLat = '';
    this.arcadeTeamsTot = '';
    
    this.arcadeDatePlaced = '';
    this.arcadeDateEnd = '';
    
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
        this.arcadeName = this.rows[i].name;
        this.arcadeStatus = this.rows[i].status;
        this.arcadeLocation = this.rows[i].location;
        this.arcadeLongLat = this.rows[i].longlat;
        this.arcadeTeamsTot = this.rows[i].teamstot;
        this.arcadeDatePlaced = this.rows[i].dateplaced;
        this.arcadeDateEnd = this.rows[i].dateend;
      }
    }
  

    $('#modal1').modal('open');
  }




  // Edit an existing arcade
  saveEditArcade() {
    if (this.arcadeName !== '') {
      // tslint:disable-next-line:max-line-length
      this.serser.editExisting(this.currentId, this.arcadeName, this.arcadeStatus, this.arcadeLocation, this.arcadeLongLat, this.arcadeTeamsTot, this.arcadeDatePlaced, this.arcadeDateEnd).subscribe(value => this.arcadeCreated(value));
    } else {
      // TOAST: NAME MAY NOT BE EMPTY!
    }
  }


  openTeamModal() {
    $('#modal2').modal('open');
  }

  openActionModal() {
    this.modalstatus = 1;
    this.actionName = '';
    this.actionStatus = 1
    this.actionStart = '';
    this.actionEnd = '';
    $('#modal3').modal('open');
  }

  openEditActionModal(_whichId, _whichname) {
    this.modalstatus = 2;
    this.currentActionId = _whichId;
    this.currentcurrentActionName = _whichname;
    this.serser.debugLog('Edit  ' + _whichId  + '  ' +_whichname);
    for (let i = 0; i < this.rowsActions.length; i++) {
      if (this.rowsActions[i].id === _whichId) {
        this.actionName = this.rowsActions[i].actionname;
        this.actionStatus = this.rowsActions[i].inuse;
        this.actionStart = this.rowsActions[i].datestart;
        this.actionEnd = this.rowsActions[i].dateend;
      }
    }

    $('#modal3').modal('open');
  }

  addAction() {
    if (this.actionName !== '') {
      // tslint:disable-next-line:max-line-length
      this.serser.insertNewAction(this.actionName, this.actionStatus, this.actionStart, this.actionEnd).subscribe(value => this.actionCreated(value));
    } else {

    }
  }

  editAction() {
    console.log('checksome');
    if (this.actionName !== '') {
      console.log('yeass');
      // tslint:disable-next-line:max-line-length
      this.serser.editAction(this.currentActionId, this.actionName, this.actionStatus, this.actionStart, this.actionEnd).subscribe(value => this.actionCreated(value));
    } else {
      
    }
  }



  actionCreated(_event) {
    // call is success, get everything from API
    console.log(_event);
    this.toastr.success(' :) ', ' Actie aangemaakt');
    this.serser.getAllCall().subscribe(value => this.gotgetAllCall(value));
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
    this.toastr.success(' :) ', 'Arcade aangemaakt');
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
