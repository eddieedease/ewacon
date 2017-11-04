<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require 'vendor/autoload.php';

header("Content-Type: application/json");



$app = new \Slim\App;
$app->get('/hello/{name}', function (Request $request, Response $response) {
    $name = $request->getAttribute('name');
    $response->getBody()->write("Hello, $name");
    
    return $response;
});

$app->get('/api/{name}', function (Request $request, Response $response) {
    $name = $request->getAttribute('name');
    $response->getBody()->write("EDease_ <b>Api</b> is running with argument:<br><br><br><br>$name");
   

    $data = array('Jsonresponse' => 'item1', 'type' => '40X');
    //$newResponse = $oldResponse->withJson($data);
    $response = json_encode($data);
    return $response;
    //return $newResponse;
});


$app->run();