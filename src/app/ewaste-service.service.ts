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

  constructor(private http_: Http, private router: Router) {
    // Make use of http & router modules
    this.debugLog('Service linked');
    this.apiUrl = environment.apiUrl;
  }


  debugLog(toDebug: any) {
    console.log(toDebug);
  }



  /**
   * GET CALL- Example
   */

  testCall(): Observable < any > {
    const url = this.apiUrl + 'api/joe?rnd='+ new Date().getTime() ;
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
      'JsonBlob': JSON.stringify('jsonobect*'),
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
