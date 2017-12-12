import {
  Http,
  Response,
  Headers,
  RequestOptions
} from '@angular/http';
import {
  Injectable
} from '@angular/core';
import {
  Router
} from '@angular/router';
import {
  Subject
} from 'rxjs/Subject';
import {
  Observable
} from 'rxjs/Rx';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/throttleTime';

// import evironment for current dev bunlde
import {
  environment
} from '../environments/environment';

@Injectable()
export class EwasteServiceService {

  apiUrl: string;
  loggedin = false;

  constructor(private http_: Http, private router: Router) {
    // Make use of http & router modules
    this.debugLog('Service linked');
    this.apiUrl = environment.apiUrl;
  }


  debugLog(toDebug: any) {
    console.log(toDebug);
  }



  /**
   * GET CALL- Get al Tables & Rows
   */
  getAllCall(): Observable < any > {
    const url = this.apiUrl + 'api/getall?rnd=' + new Date().getTime() ;
    // tslint:disable-next-line:prefer-const
    const headers = new Headers({
      'Content-Type': 'application/json'
    });

    const options = new RequestOptions({
      headers: headers
    });

    // tslint:disable-next-line:max-line-length
    return this.http_.get(url, options)
      .throttleTime(5000)
      .map(res => res.json());
  }


  insertNew(_arcadeid, _name, _status, _actionlink,  _location, _longlat, _teamstot, _dateplaced, _dateend ): Observable < any > {
    console.log('arcadeid = ' + _arcadeid);
    // tslint:disable-next-line:max-line-length
    const url = this.apiUrl + 'insert?rnd=' + new Date().getTime() + '&arcadeid=' + _arcadeid + '&name=' + _name + '&status=' + _status + '&actionlink=' + _actionlink + '&location=' + _location +  '&longlat=' + _longlat + '&teamstot=' + _teamstot  + '&dateplaced=' + _dateplaced + '&dateend=' + _dateend ;
    // tslint:disable-next-line:prefer-const
    const headers = new Headers({
      'Content-Type': 'application/json'
    });

   
    const options = new RequestOptions({
      headers: headers
    });

    // tslint:disable-next-line:max-line-length
    return this.http_.get(url, options)
      .throttleTime(5000)
      .map(res => res.json());


  }



  editExisting(_id, _arcadeid, _name, _status, _actionlink, _location, _longlat, _teamstot, _dateplaced, _dateend ): Observable < any > {
    console.log('arcadeid = ' + _arcadeid);
    // tslint:disable-next-line:max-line-length
    const url = this.apiUrl + 'edit/' + _id + '?rnd=' + new Date().getTime() + '&arcadeid=' + _arcadeid + '&name=' + _name + '&status=' + _status + '&actionlink=' + _actionlink + '&location=' + _location +  '&longlat=' + _longlat + '&teamstot=' + _teamstot  + '&dateplaced=' + _dateplaced + '&dateend=' + _dateend ;
    // tslint:disable-next-line:prefer-const
    const headers = new Headers({
      'Content-Type': 'application/json'
    });

    const options = new RequestOptions({
      headers: headers
    });

    // tslint:disable-next-line:max-line-length
    return this.http_.get(url, options)
      .throttleTime(5000)
      .map(res => res.json());
  }


  deleteArcade( _id, _name ): Observable < any > {
    // tslint:disable-next-line:max-line-length
    const url = this.apiUrl + 'delete/'  + _id + '/' + _name + '?rnd=' + new Date().getTime() ;
    // tslint:disable-next-line:prefer-const
    const headers = new Headers({
      'Content-Type': 'application/json'
    });

    const options = new RequestOptions({
      headers: headers
    });

    // tslint:disable-next-line:max-line-length
    return this.http_.get(url, options)
      .throttleTime(5000)
      .map(res => res.json());
  }


  deleteAction( _id ): Observable < any > {
    // tslint:disable-next-line:max-line-length
    const url = this.apiUrl + 'deleteaction/'  + _id + '?rnd=' + new Date().getTime() ;
    // tslint:disable-next-line:prefer-const
    const headers = new Headers({
      'Content-Type': 'application/json'
    });

    const options = new RequestOptions({
      headers: headers
    });

    // tslint:disable-next-line:max-line-length
    return this.http_.get(url, options)
      .throttleTime(5000)
      .map(res => res.json());
  }





  insertNewAction(_name, _status, _dateplaced, _dateend ): Observable < any > {
    // tslint:disable-next-line:max-line-length
    const url = this.apiUrl + 'insertaction?rnd=' + new Date().getTime() + '&name=' + _name + '&inuse=' + _status  + '&datestart=' + _dateplaced + '&dateend=' + _dateend ;
    // tslint:disable-next-line:prefer-const
    const headers = new Headers({
      'Content-Type': 'application/json'
    });

    const options = new RequestOptions({
      headers: headers
    });

    // tslint:disable-next-line:max-line-length
    return this.http_.get(url, options)
      .throttleTime(5000)
      .map(res => res.json());
  }


  editAction(_id, _name, _status, _dateplaced, _dateend ): Observable < any > {
    // tslint:disable-next-line:max-line-length
    const url = this.apiUrl + 'editaction/'  + _id + '?rnd=' + new Date().getTime() + '&name=' + _name + '&inuse=' + _status  + '&datestart=' + _dateplaced + '&dateend=' + _dateend ;
    // tslint:disable-next-line:prefer-const
    const headers = new Headers({
      'Content-Type': 'application/json'
    });

    const options = new RequestOptions({
      headers: headers
    });

    // tslint:disable-next-line:max-line-length
    return this.http_.get(url, options)
      .throttleTime(5000)
      .map(res => res.json());
  }


  // tslint:disable-next-line:max-line-length
  editTeamNames(_idname, _teamnames ): Observable < any > {

    // teamnames is array of strings
    // tslint:disable-next-line:max-line-length
    const url = this.apiUrl + 'editteamnames/'  + _idname + '?rnd=' + new Date().getTime() + '&team1=' + _teamnames[0] + '&team2=' + _teamnames[1] +'&team3=' + _teamnames[2] +'&team4=' + _teamnames[3] + '&team5=' + _teamnames[4] + '&team6=' + _teamnames[5] +'&team7=' + _teamnames[6] +'&team8=' + _teamnames[7] + '&team9=' + _teamnames[8] + '&team10=' + _teamnames[9] + '&team11=' + _teamnames[10];
    // tslint:disable-next-line:prefer-const
    const headers = new Headers({
      'Content-Type': 'application/json'
    });

    const options = new RequestOptions({
      headers: headers
    });

    // tslint:disable-next-line:max-line-length
    return this.http_.get(url, options)
      .throttleTime(5000)
      .map(res => res.json());
  }





  /**
   * API CALL- Example
   */
  createEPSS(_title) {
    // tslint:disable-next-line:prefer-const
    let url = this.apiUrl;


    const upt = {
      'JsonBlob': JSON.stringify('jsonobject*'),
      'Title': _title
    };
    console.log(_title);
    const body = JSON.stringify(upt);
    const headers = new Headers({
      'Content-Type': 'application/json',
      'Cache-control': 'no-cache',
      'Expires': '0',
      'Pragma': 'no-cache'
    });
    const options = new RequestOptions({
      headers: headers,
      method: 'post'
    });
    console.log(body);

    console.log(url);

    return this.http_.post(url, body, options)
      .throttleTime(5000)
      .map((res: Response) => res.json())
      .subscribe(
        res => console.log(res),
        error => console.log(error),
        () => location.reload()
      )
  }




}
