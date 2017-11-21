import { Component, OnInit } from '@angular/core';

declare var $: any;

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})



export class AdminComponent implements OnInit {

  rows = [];
  columns = [];
  constructor() { }

  ngOnInit() {

    // dummy data
    this.rows = [
      { id: '1', locatie: 'TU Einhoven', company: 'Swimlane' },
      { id: '2', locatie: 'Pakistan', company: 'KFC' },
      { id: '3', locatie: 'Klokhuis', company: 'Burger King' },
    ];
    this.columns = [
      { prop: 'id' },
      { name: 'locatie' }
    ];

    $(document).ready(function() {
      $('ul.tabs').tabs();
    });
  }

}
