<?php



use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require 'vendor/autoload.php';

header("Content-Type: application/json");
header('Access-Control-Allow-Origin: *');

// Allow from any origin
if (isset($_SERVER['HTTP_ORIGIN'])) {
    header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
    header('Access-Control-Allow-Credentials: true');
    // header('Access-Control-Max-Age: 86400');    // cache for 1 day
}
// Access-Control headers are received during OPTIONS requests
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
        header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");         

    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
        header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");
}


$app = new \Slim\App;
$app->get('/hello/{name}', function (Request $request, Response $response) {
    $name = $request->getAttribute('name');
    $response->getBody()->write("Hello, $name");
    return $response;
});


// NOTE: the getAll API CALL
$app->get('/api/getall', function (Request $request, Response $response) {
    // set up the connection variables
    include 'db.php';
    // connect to the database
    $dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
    // NOTE fixing the api over here
    // NOTE 5 pieces --> [0] actions [1] arcades [2] archive [3] highscores [4] teams
    //NOTE basis
    // a query get all the correct records from the gemeenten table
    $sqlactions = 'SELECT * FROM actions';
    // use prepared statements, even if not strictly required is good practice
    $stmtactions = $dbh->prepare($sqlactions);
    // execute the query
    $stmtactions->execute();
    // fetch the results into an array
    $resultactions = $stmtactions->fetchAll(PDO::FETCH_ASSOC);

    //NOTE instrument
    $sqlarcades = 'SELECT * FROM arcades';
    $stmtarcades = $dbh->prepare($sqlarcades);
    $stmtarcades->execute();
    $resultarcades= $stmtarcades->fetchAll(PDO::FETCH_ASSOC);

    //NOTE uplaods
    $sqlarchive= 'SELECT * FROM archive';
    $stmtarchive = $dbh->prepare($sqlarchive);
    $stmtarchive->execute();
    $resultarchive = $stmtarchive->fetchAll(PDO::FETCH_ASSOC);


    //NOTE uplaods
    $sqlhighscores = 'SELECT * FROM highscores';
    $stmthighscores = $dbh->prepare($sqlhighscores);
    $stmthighscores->execute();
    $resulthighscores = $stmthighscores->fetchAll(PDO::FETCH_ASSOC);


    //NOTE uplaods
    $sqlteams = 'SELECT * FROM teams';
    $stmtteams = $dbh->prepare($sqlteams);
    $stmtteams->execute();
    $resultteams = $stmtteams->fetchAll(PDO::FETCH_ASSOC);



    // NOTE colleting everything for converting
    $result = array();
    array_push($result, $resultactions, $resultarcades, $resultarchive, $resulthighscores, $resultteams);

    // convert it all to jSON TODO change result
    $response = json_encode($result);
    return $response;
});

/**
 * Insert New Arcade 
 * NOTE: Tested and works
 */
$app->get('/insert', function (Request $request, Response $response) { 

     // set up the connection variables
     include 'db.php';
     // connect to the database
     $dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
    
    $paramname= $request->getQueryParam('name', $default = null);
    $paramstatus= $request->getQueryParam('status', $default = null);
    $paramlocation= $request->getQueryParam('location', $default = null);
    $paramlonglat= $request->getQueryParam('longlat', $default = null);
    $paramteamstot= $request->getQueryParam('teamstot', $default = null);
    $paramdateplaced = $request->getQueryParam('dateplaced', $default = null);
    $paramdateend = $request->getQueryParam('dateend', $default = null);
    $sql = "INSERT INTO arcades (name,status,location,longlat,teamstot,dateplaced,dateend) VALUES ('$paramname','$paramstatus','$paramlocation','$paramlonglat','$paramteamstot','$paramdateplaced','$paramdateend')";

     // use prepared statements, even if not strictly required is good practice
    $stmt = $dbh->prepare($sql);
    // execute the query
    $dbh = null;
    $stmt->execute();

    // another call for making the teams database row
    $dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
    $sql2 = "INSERT INTO teams (linkid) VALUES ('$paramname')";

    $stmt2 = $dbh->prepare($sql2);
    $dbh = null;
    $stmt2->execute();

    // another call for making the teams database row
    $dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
    $sql3 = "INSERT INTO highscores (linkid) VALUES ('$paramname')";

    $stmt3 = $dbh->prepare($sql3);
    $dbh = null;
    $stmt3->execute();


    /* $sql3 = "INSERT INTO highscores (linkid) VALUES ('$paramname')";
    
        $stmt3 = $dbh->prepare($sql3);
        //$dbh = null;
        $stmt3->execute(); */






    $data = array('Jsonresponse' => 'addnew', 'success' => true);
     $response = json_encode($data);
    // $response = 'Added!!!';
    return $response;
    //return $newResponse;
});


/** 
 * Edit existing Arcade 
 * NOTE: Not tested
*/
$app->get('/edit/{id}', function (Request $request, Response $response) {
    $id = $request->getAttribute('id');
    // $data = array('Jsonresponse' => 'item1', 'type' => '40X');
    $paramname= $request->getQueryParam('name', $default = null);
    $paramstatus= $request->getQueryParam('status', $default = null);
    $paramlocation= $request->getQueryParam('location', $default = null);
    $paramlonglat= $request->getQueryParam('longlat', $default = null);
    $paramteamstot= $request->getQueryParam('teamstot', $default = null);
    $paramdateplaced = $request->getQueryParam('dateplaced', $default = null);
    $paramdateend = $request->getQueryParam('dateend', $default = null);
    // TODO: implement the right EDIT query
    $sql = "INSERT INTO arcades (name,status,location,longlat,teamstot,dateplaced,dateend) VALUES ('$paramname','$paramstatus','$paramlocation','$paramlonglat','$paramteamstot','$paramdateplaced','$paramdateend')";
    // use prepared statements, even if not strictly required is good practice
    $stmt = $dbh->prepare($sql);
    // execute the query
    $dbh = null;
    $stmt->execute();
    $data = array('Jsonresponse' => 'Edit', 'success' => true);
    $response = json_encode($data);
    return $response;
    //return $newResponse;
});

/** 
 * Delete  Arcade with ID
 * NOTE: Not tested
*/
$app->get('/delete/{id}', function (Request $request, Response $response) {
    $id = $request->getAttribute('id');
    // TODO: implement the right DELETE query
    $sql = "INSERT INTO arcades (name,status,location,longlat,teamstot,dateplaced,dateend) VALUES ('$paramname','$paramstatus','$paramlocation','$paramlonglat','$paramteamstot','$paramdateplaced','$paramdateend')";
    // use prepared statements, even if not strictly required is good practice
    $stmt = $dbh->prepare($sql);
    // execute the query
    $dbh = null;
    $stmt->execute();
    $data = array('Jsonresponse' => 'Delete', 'success' => true);
    $response = json_encode($data);
    return $response;
    //return $newResponse;
});





// EXAMPLE for copying
$app->get('/api/{name}', function (Request $request, Response $response) {
    $name = $request->getAttribute('name');
    $data = array('Jsonresponse' => 'item1', 'type' => '40X');
    $response = json_encode($data);
    return $response;
    //return $newResponse;
});







$app->run();
