<?php 
session_start();
require '..\vendor\autoload.php';
use App\Controller\ErrorController;

$routes = require '../config/routes.php';

if(!isset($_GET['action'])){
	$action = 'home';
}else{
	$action =  $_GET['action'] ;
}

$route = $routes[$action] ?? ["controller" => ErrorController::class, "method" => "show", "private"=>false];

try {
	//verification si la route est privé
	if($route['private'] === true){
		//verifier la session
		if(!isset($_SESSION['username'])){
			//changement de l'action 
			$route = $routes['login'] ;
		}
	}
	
	$controller = $route['controller'];
	$method = $route['method'];
	$object = new $controller();
	$object->{$method}();

} catch(Throwable $e) {
	$object = new ErrorController();
	$object->show($e->getMessage());
}

