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
  allCo2 = 0;

  mapMode = 2;
  // TODO: mapMode selection from component still has to be configured

  // datatable vars
  rows = [];
  columns = [];
  temp = [];
  selected = [];

  // the whole arcades list
  arcadess = [];

  // first is all actions, second is only available actions
  actionss = [];
  actions = [];

  highScores = [];


  teams = [];

  check = 'whut';

  

  currentArcadeId;
  currentArcadeName;
  currentphoneTot;
  

  // current teams, not sorted
  currentTeamss;
  // current teams, sorted
  currentTeams;

  currentHighScores;
  currentTeamTot;

  dataLoaded = false;


  // tslint:disable-next-line:max-line-length
  constructor(private serser: EwasteServiceService, private router: Router, private route: ActivatedRoute, private _sanitizer: DomSanitizer) {
    this.activeArcades = [];
    this.notActiveArcades = [];

    // dummy data for tables
    this.rows = [];

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
      $('.modal').modal();
    });



    // example call
    this.serser.getAllCall().subscribe(value => this.gotgetAllCall(value));
  }

  gotgetAllCall(_value) {
    this.serser.debugLog(_value[1]);
    this.arcadess = _value[1];


    for (let a = 0; a < this.arcadess.length; a++) {
      if (this.arcadess[a].status === '2') {
        const activeArcade = this.arcadess[a];
        this.rows.push(activeArcade);
      }
    }



    this.dataLoaded = true;

    this.actionss = _value[0];
    this.highScores = _value[3];
    this.teams = _value[4];


    // get the runnings actions
    for (let i = 0; i < this.actionss.length; i++) {
      if (this.actionss[i].inuse === '2') {
        const actionobject = this.actionss[i];

        // TODO: Need the sum of all active arcades within this action
        let sumOfAction = 0;

        // search in all the arcades with matching actionlink
        this.arcadess.forEach(element => {
          if (element.actionlink === this.actionss[i].id) {
            console.log('YESSSSSSSSSS');
            sumOfAction = sumOfAction + parseInt(element.phonetot, 10);
          }
        });

        actionobject.sum = sumOfAction;

        // after object is created --> do this
        this.actions.push(actionobject);
      }
    }


    // Calculate all the phones collected
    for (let index = 0; index < this.arcadess.length; index++) {
      const x = this.arcadess[index].phonetot;
      const y = +x; // y: number
      this.allPhones = this.allPhones + y;

      this.allCo2 = this.allPhones * 250;
    }

  }

  /**
   * The filter arcades when clicked on action
   */
  filterOnRows(_whichaction) {
    if (_whichaction === 'all') {
      this.rows = [];
      for (let a = 0; a < this.arcadess.length; a++) {
        if (this.arcadess[a].status === '2') {
          const activeArcade = this.arcadess[a];
          this.rows.push(activeArcade);
        }

      }
    } else {
      this.serser.debugLog('Filtering rows for:  ' + _whichaction);
      this.rows = [];
      for (let a = 0; a < this.arcadess.length; a++) {
        if (this.arcadess[a].status === '2' && this.arcadess[a].actionlink === _whichaction) {
          const activeArcade = this.arcadess[a];
          this.rows.push(activeArcade);
        }

      }
    }
  }



  /**
   * Select event handler when clicking on an arcade from the list
   *
   */
  onSelect(_event) {
    // this.serser.debugLog(_event.selected[0]);

    // set current arcadeid + name
    this.currentArcadeId = _event.selected[0].id;
    this.currentArcadeName = _event.selected[0].name;
    this.currentphoneTot = _event.selected[0].phonetot;
    this.currentTeamTot = _event.selected[0].teamstot;

    

    // get current teams & current highscores
    // look up by arcadename

    // teams
    for (let index = 0; index < this.teams.length; index++) {
      if (this.teams[index].linkid === this.currentArcadeName) {
        this.currentTeamss = this.teams[index];
        this.serser.debugLog(this.currentTeamss);
        // Allright nice, now we have the teams... but... we need the right order


      }
    }

    console.log(this.currentTeamss.team1name);
    // sorting of the teams on phonetot
    // first make array of objects, then SORT on phonetot, hella yea beautifull object
    this.currentTeams = [{
        name: this.currentTeamss.team1name,
        phonetot: this.currentTeamss.team1tot
      },
      {
        name: this.currentTeamss.team2name,
        phonetot: this.currentTeamss.team2tot
      },
      {
        name: this.currentTeamss.team3name,
        phonetot: this.currentTeamss.team3tot
      },
      {
        name: this.currentTeamss.team4name,
        phonetot: this.currentTeamss.team4tot
      },
      {
        name: this.currentTeamss.team5name,
        phonetot: this.currentTeamss.team5tot
      },
      {
        name: this.currentTeamss.team6name,
        phonetot: this.currentTeamss.team6tot
      },
      {
        name: this.currentTeamss.team7name,
        phonetot: this.currentTeamss.team7tot
      },
      {
        name: this.currentTeamss.team8name,
        phonetot: this.currentTeamss.team8tot
      },
      {
        name: this.currentTeamss.team9name,
        phonetot: this.currentTeamss.team9tot
      },
      {
        name: this.currentTeamss.team10name,
        phonetot: this.currentTeamss.team10tot
      },
    ]

    // Actual sorting of highest score
    this.currentTeams.sort(function (obj1, obj2) {
      // Ascending: first age less than the previous
      return obj1.phonetot - obj2.phonetot;
    });

    this.currentTeams.reverse();

    // test it
    this.serser.debugLog(this.currentTeams);








    for (let i = 0; i < this.highScores.length; i++) {
      if (this.highScores[i].linkid === this.currentArcadeName) {
        this.currentHighScores = this.highScores[i];
        this.serser.debugLog(this.currentHighScores);

      }
    }



    this.serser.debugLog('Selected Arcade is ' + this.currentArcadeName + '  with ID: ' + this.currentArcadeId);
    $('#modal1').modal('open');
    
  }


  // compare teamscores
  compareTeams(a, b) {
    if (a.last_nom < b.last_nom) {
      return -1;
    } else if (a.last_nom > b.last_nom) {
      return 1;
    } else {
      return 0;
    }
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
