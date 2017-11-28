<?php



use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require 'vendor/autoload.php';

header("Content-Type: application/json");
header('Access-Control-Allow-Origin: *');


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


$app->get('/insert/{name}', function (Request $request, Response $response) { 

    
    
    $paramname= $request->getQueryParam('name', $default = null);
    $paramstatus= $request->getQueryParam('status', $default = null);
    $paramlocation= $request->getQueryParam('location', $default = null);
    
    $paramlonglat= $request->getQueryParam('longlat', $default = null);
    $paramphonetot= $request->getQueryParam('phonetot', $default = null);
    $paramphonefailed= $request->getQueryParam('phonefailed', $default = null);
    $paramteamstot= $request->getQueryParam('teamstot', $default = null);

    $paramdateplaced = $request->getQueryParam('dateplaced', $default = null);
    $paramdateend = $request->getQueryParam('dateend', $default = null);
    $paramdateend = $request->getQueryParam('lastused', $default = null);
    
    // $name = $request->getAttribute('name');

    // set up the connection variables
    include 'db.php';
    // connect to the database
    $dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
    $sql = "INSERT INTO arcades (name,status,location,longlat,phonetot,phonefailed,teamstot,dateplaced,dateend,lastused) VALUES ('$paramname','$paramstatus','$paramlocation','$paramlonglat','$paramphonetot','$paramphonefailed','$teamstot','$dateplaced','$dateend','$lastued')";

     // use prepared statements, even if not strictly required is good practice
    $stmt = $dbh->prepare($sql);
    // execute the query
    $dbh = null;
    $stmt->execute();

    $data = array('Jsonresponse' => 'item1', 'type' => $param1);
    // $response = json_encode($data);
    $response = 'Added!!!?';
    return $response;
    //return $newResponse;
});





// EXAMPLE
$app->get('/api/{name}', function (Request $request, Response $response) {
    $name = $request->getAttribute('name');
    $data = array('Jsonresponse' => 'item1', 'type' => '40X');
    $response = json_encode($data);
    return $response;
    //return $newResponse;
});







$app->run();