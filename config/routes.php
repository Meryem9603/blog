<?php
require '..\vendor\autoload.php';
use App\Controller\PostController;
use App\Controller\CommentController;
use App\Controller\SecurityController;
return [
	'create-post'=>['controller'=> PostController::class, 'method'=>'create'],
	'update-post'=>['controller'=> PostController::class, 'method'=>'update'],
	'delete-post'=>['controller'=> PostController::class, 'method'=>'delete'],
	'detailpost'  =>['controller'=> PostController::class, 'method'=>'show'],
	'home'  =>['controller'=> PostController::class, 'method'=>'liste'],
	'admin' => ['controller'=> PostController::class, 'method'=>'listAdminPosts'],
	'createcomment' =>['controller'=> CommentController::class, 'method'=>'create'],
	'show-comment'  =>['controller'=> CommentController::class, 'method'=>'show'],
	'list-comments'  =>['controller'=> CommentController::class, 'method'=>'liste'],
	'delete-comment' =>['controller'=> CommentController::class, 'method'=>'delete'],
	'report'  =>['controller'=> CommentController::class, 'method'=>'report'],
	'login' => ['controller'=> SecurityController::class, 'method'=>'login'],
	'logout' => ['controller'=> SecurityController::class, 'method'=>'logout']
	

];
