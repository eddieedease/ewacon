import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { RouterModule, Routes } from '@angular/router';

import { AppComponent } from './app.component';
import { SiteComponent } from './site/site.component';
import { NotFoundComponent } from './not-found/not-found.component';
import { MapComponent } from './map/map.component';
import { AdminComponent } from './admin/admin.component';

// Angular Google Maps
import { AgmCoreModule } from '@agm/core';
import { AgmSnazzyInfoWindowModule } from '@agm/snazzy-info-window';


const appRoutes: Routes = [
  { path: 'site', component: SiteComponent },
  { path: 'admin', component: AdminComponent },
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
    MapComponent,
    AdminComponent
  ],
  imports: [
    BrowserModule,
    RouterModule.forRoot(
      appRoutes),
      AgmCoreModule.forRoot({
        apiKey: 'AIzaSyANc3EJit-ICD0ua4rwoFb1FfBBQfGYNrQ'
      }),
      AgmSnazzyInfoWindowModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
