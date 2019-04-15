<?php
require '..\vendor\autoload.php';
use App\Controller\PostController;
use App\Controller\CommentController;

$routes = [
	'create-post'=>['controller'=> PostController::class, 'method'=>'create'],
	'update-post'=>['controller'=> PostController::class, 'method'=>'update'],
	'delete-post'=>['controller'=> PostController::class, 'method'=>'delete'],
	'show-post'  =>['controller'=> PostController::class, 'method'=>'show'],
	'list-posts'  =>['controller'=> PostController::class, 'method'=>'liste'],
	'create-comment' =>['controller'=> CommentController::class, 'method'=>'create'],
	'show-comment'  =>['controller'=> CommentController::class, 'method'=>'show'],
	'list-comments'  =>['controller'=> CommentController::class, 'method'=>'list'],
	'delete-comment' =>['controller'=> CommentController::class, 'method'=>'delete'],
	'report-post'  =>['controller'=> CommentController::class, 'method'=>'report']
	

];
