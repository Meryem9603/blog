<?php
require '..\vendor\autoload.php';
use App\Controller\PostController;
use App\Controller\CommentController;
use App\Controller\SecurityController;
return [
	'create-post'=>['controller'=> PostController::class, 'method'=>'create', 'private'=>true],
	'update-post'=>['controller'=> PostController::class, 'method'=>'update', 'private'=>true],
	'delete-post'=>['controller'=> PostController::class, 'method'=>'delete', 'private'=>true],
	'detailpost'  =>['controller'=> PostController::class, 'method'=>'show', 'private'=>false],
	'home'  =>['controller'=> PostController::class, 'method'=>'liste', 'private'=>false],
	'admin' => ['controller'=> PostController::class, 'method'=>'listAdminPosts', 'private'=>true],
	'createcomment' =>['controller'=> CommentController::class, 'method'=>'create', 'private'=>false],
	'show-comment'  =>['controller'=> CommentController::class, 'method'=>'show', 'private'=>false],
	'list-comments'  =>['controller'=> CommentController::class, 'method'=>'liste', 'private'=>true],
	'deletecomment' =>['controller'=> CommentController::class, 'method'=>'delete', 'private'=>true],
	'report'  =>['controller'=> CommentController::class, 'method'=>'report', 'private'=>false],
	'login' => ['controller'=> SecurityController::class, 'method'=>'login', 'private'=>false],
	'logout' => ['controller'=> SecurityController::class, 'method'=>'logout', 'private'=>true]
	

];
