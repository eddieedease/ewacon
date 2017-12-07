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
	// 	header('Access-Control-Max-Age: 86400');
	// 	cache for 1 day
}
// Access-Control headers are received during OPTIONS requests
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
	if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
			        header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
	
	if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
			        header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");
}




// Start SLim API
$app = new \Slim\App;


// Basic call
$app->get('/hello/{name}', function (Request $request, Response $response) {
	$name = $request->getAttribute('name');
	$response->getBody()->write("Hello, $name");
	return $response;
}
);


// NOTE: the getAll API CALL
$app->get('/api/getall', function (Request $request, Response $response) {
	include 'db.php';
	$dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
	// 	NOTE 5 pieces --> [0] actions [1] arcades [2] archive [3] highscores [4] teams
	// 	a query get all the correct records from the gemeenten table
	$sqlactions = 'SELECT * FROM actions';
	$stmtactions = $dbh->prepare($sqlactions);
	$stmtactions->execute();
	$resultactions = $stmtactions->fetchAll(PDO::FETCH_ASSOC);
	
	$sqlarcades = 'SELECT * FROM arcades';
	$stmtarcades = $dbh->prepare($sqlarcades);
	$stmtarcades->execute();
	$resultarcades= $stmtarcades->fetchAll(PDO::FETCH_ASSOC);
	
	$sqlarchive= 'SELECT * FROM archive';
	$stmtarchive = $dbh->prepare($sqlarchive);
	$stmtarchive->execute();
	$resultarchive = $stmtarchive->fetchAll(PDO::FETCH_ASSOC);
	
	$sqlhighscores = 'SELECT * FROM highscores';
	$stmthighscores = $dbh->prepare($sqlhighscores);
	$stmthighscores->execute();
	$resulthighscores = $stmthighscores->fetchAll(PDO::FETCH_ASSOC);
	
	$sqlteams = 'SELECT * FROM teams';
	$stmtteams = $dbh->prepare($sqlteams);
	$stmtteams->execute();
	$resultteams = $stmtteams->fetchAll(PDO::FETCH_ASSOC);
	
	// 	NOTE colleting everything for converting
	$result = array();
	array_push($result, $resultactions, $resultarcades, $resultarchive, $resulthighscores, $resultteams);
	
	// 	convert it all to jSON TODO change result
	$response = json_encode($result);
	return $response;
}
);




/**
 * Insert New Arcade 
 * NOTE: Tested and works
 */
$app->get('/insert', function (Request $request, Response $response) {
	include 'db.php';
	$dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);

	$paramname= $request->getQueryParam('name', $default = null);
	$paramstatus= $request->getQueryParam('status', $default = null);
	$paramlocation= $request->getQueryParam('location', $default = null);
	$paramlonglat= $request->getQueryParam('longlat', $default = null);
	$paramteamstot= $request->getQueryParam('teamstot', $default = null);
	$paramdateplaced = $request->getQueryParam('dateplaced', $default = null);
	$paramdateend = $request->getQueryParam('dateend', $default = null);
	
	$sql = "INSERT INTO arcades (name,status,location,longlat,teamstot,dateplaced,dateend) VALUES ('$paramname','$paramstatus','$paramlocation','$paramlonglat','$paramteamstot','$paramdateplaced','$paramdateend')";
	
	// 	use prepared statements, even if not strictly required is good practice
	$stmt = $dbh->prepare($sql);
	$dbh = null;
	$stmt->execute();
	
	// 	another call for making the teams database row
	$dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
	$sql2 = "INSERT INTO teams (linkid) VALUES ('$paramname')";
	$stmt2 = $dbh->prepare($sql2);
	$dbh = null;
	$stmt2->execute();
	
	// 	another call for making the highscores database row
	$dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
	$sql3 = "INSERT INTO highscores (linkid) VALUES ('$paramname')";
	$stmt3 = $dbh->prepare($sql3);
	$dbh = null;
	$stmt3->execute();
	
	$data = array('Jsonresponse' => 'addnew', 'success' => true);
	$response = json_encode($data);
	// 	$response = 'Added!!!';
	return $response;
	//r	eturn $newResponse;
}
);





/** 
 * Edit existing Arcade 
 * NOTE: Not tested
*/
$app->get('/edit/{id}', function (Request $request, Response $response) {
	
	include 'db.php';
	$dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
	
	$id = $request->getAttribute('id');

	$paramname= $request->getQueryParam('name', $default = null);
	$paramstatus= $request->getQueryParam('status', $default = null);
	$paramlocation= $request->getQueryParam('location', $default = null);
	$paramlonglat= $request->getQueryParam('longlat', $default = null);
	$paramteamstot= $request->getQueryParam('teamstot', $default = null);
	$paramdateplaced = $request->getQueryParam('dateplaced', $default = null);
	$paramdateend = $request->getQueryParam('dateend', $default = null);
	
	// 	edit query
	$sql = "UPDATE arcades SET name = '$paramname', status = '$paramstatus',location ='$paramlocation',longlat ='$paramlonglat' ,teamstot ='$paramteamstot' ,dateplaced ='$paramdateplaced' ,dateend ='$paramdateend' WHERE id = '$id'";
	$stmt = $dbh->prepare($sql);
	// 	execute the query
	$dbh = null;
	$stmt->execute();
	
	$data = array('Jsonresponse' => 'Edit', 'success' => true);
	$response = json_encode($data);
	return $response;
}
);




/** 
* Delete  Arcade with ID
 * NOTE: Not tested
*/
$app->get('/delete/{id}/{name}', function (Request $request, Response $response) {
	// 	set up the connection variables
	include 'db.php';
	
	$dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
	$id = $request->getAttribute('id');
	$name = $request->getAttribute('name');

	$sql = "DELETE FROM arcades WHERE id = '$id'";
	$stmt = $dbh->prepare($sql);
	$dbh = null;
	$stmt->execute();
	
	$dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
	$sql2 = "DELETE FROM teams WHERE linkid = '$name'";
	$stmt2 = $dbh->prepare($sql2);
	$dbh = null;
	$stmt2->execute();
	
	$dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
	$sql3 = "DELETE FROM highscores WHERE linkid = '$name'";
	$stmt3 = $dbh->prepare($sql3);
	$dbh = null;
	$stmt3 -> execute();
	
	$data = array('Jsonresponse' => 'Delete', 'success' => true);
	$response = json_encode($data);
	return $response;
}
);




/** 
 * Delete  Arcade with ID
 * NOTE: Not tested
*/
$app->get('/deleteaction/{id}', function (Request $request, Response $response) {
	include 'db.php';
	$dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
	$id = $request->getAttribute('id');
	$name = $request->getAttribute('name');
	$sql = "DELETE FROM actions WHERE id = '$id'";
	$stmt = $dbh->prepare($sql);
	$dbh = null;
	$stmt->execute();
	
	$data = array('Jsonresponse' => 'Delete', 'success' => true);
	$response = json_encode($data);
	return $response;
}
);


$app->get('/insertaction', function (Request $request, Response $response) {
	include 'db.php';
	$dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);

	$paramname= $request->getQueryParam('name', $default = null);
	$paraminuse= $request->getQueryParam('inuse', $default = null);
	$paramdatestart = $request->getQueryParam('datestart', $default = null);
	$paramdateend = $request->getQueryParam('dateend', $default = null);
	$sql = "INSERT INTO actions (actionname,datestart,dateend , inuse) VALUES ('$paramname','$paramdateplaced','$paramdateend','$paraminuse')";
	
	$stmt = $dbh->prepare($sql);
	$dbh = null;
	$stmt->execute();
	
	$data = array('Jsonresponse' => 'insert new team', 'success' => true);
	$response = json_encode($data);
	return $response;
}
);


$app->get('/editaction/{id}', function (Request $request, Response $response) {
	// 	set up the connection variables
	include 'db.php';
	// 	connect to the database
	$dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
	
	$id = $request->getAttribute('id');
	$paramname= $request->getQueryParam('name', $default = null);
	$paraminuse= $request->getQueryParam('inuse', $default = null);
	$paramdatestart = $request->getQueryParam('datestart', $default = null);
	$paramdateend = $request->getQueryParam('dateend', $default = null);
	
	$sql = "UPDATE actions SET actionname = '$paramname', datestart = '$paramdatestart',dateend ='$paramdateend', inuse ='$paraminuse' WHERE id = '$id'";

	$stmt = $dbh->prepare($sql);
	$dbh = null;
	$stmt->execute();

	$data = array('Jsonresponse' => 'Edit the action', 'success' => true);
	$response = json_encode($data);
	return $response;
}
);



$app->get('/editteamnames/{idname}', function (Request $request, Response $response) {
	// 	set up the connection variables
	include 'db.php';
	// 	connect to the database
	$dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
	
	$id = $request->getAttribute('idname');
	$team1 = $request->getQueryParam('team1', $default = null);
	$team2 = $request->getQueryParam('team2', $default = null);
	$team3 = $request->getQueryParam('team3', $default = null);
	$team4 = $request->getQueryParam('team4', $default = null);
	$team5 = $request->getQueryParam('team5', $default = null);
	$team6 = $request->getQueryParam('team6', $default = null);
	$team7 = $request->getQueryParam('team7', $default = null);
	$team8 = $request->getQueryParam('team8', $default = null);
	$team9 = $request->getQueryParam('team9', $default = null);
	$team10 = $request->getQueryParam('team10', $default = null);
	$team11 = $request->getQueryParam('team11', $default = null);

	
	$sql = "UPDATE teams SET team1name = '$team1', team2name = '$team2',team3name ='$team3', team4name ='$team4', team5name ='$team5' , team6name ='$team6' , team7name ='$team7' , team8name ='$team8' , team9name ='$team9' , team10name = '$team10' , team11name = '$team11' WHERE linkid = '$id'";

	$stmt = $dbh->prepare($sql);
	$dbh = null;
	$stmt->execute();

	$data = array('Jsonresponse' => 'Edit the action', 'success' => true);
	$response = json_encode($data);
	return $response;
}
);


// EXAMPLE for copying
$app->get('/api/{name}', function (Request $request, Response $response) {
	$name = $request->getAttribute('name');
	$data = array('Jsonresponse' => 'item1', 'type' => '40X');
	$response = json_encode($data);
	return $response;
}
);

$app->run();