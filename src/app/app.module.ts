import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { RouterModule, Routes } from '@angular/router';

import { AppComponent } from './app.component';
import { SiteComponent } from './site/site.component';
import { NotFoundComponent } from './not-found/not-found.component';
import { MapComponent } from './map/map.component';

const appRoutes: Routes = [
  { path: 'site', component: SiteComponent },
  { path: '',
    redirectTo: '/site',
    pathMatch: 'full'
  },
  { path: '**', component: NotFoundComponent }
];


@NgModule({
  declarations: [
    AppComponent,
    SiteComponent,
    NotFoundComponent,
    MapComponent
  ],
  imports: [
    BrowserModule,
    RouterModule.forRoot(
      appRoutes)
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
