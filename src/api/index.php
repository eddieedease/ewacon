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



$app->get('/api/{name}', function (Request $request, Response $response) {
    $name = $request->getAttribute('name');
    $data = array('Jsonresponse' => 'item1', 'type' => '40X');
    $response = json_encode($data);
    return $response;
    //return $newResponse;
});


$app->run();