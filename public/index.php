<?php 
session_start();
require '..\vendor\autoload.php';

$routes = require '../config/routes.php';

$action = isset($_GET['action'])? $_GET['action'] : null ;
if(!isset($routes[$action]) or !$action){
	echo "page introuvable !";
}else{
	$controller = $routes[$action]['controller'];
	$method = $routes[$action]['method'];
	$object = new $controller();
	$object->{$method}();
}

#ajouter un nouveau commentaire
/*if(isset($_GET['action']) && $_GET['action']=='createcomment'){
	
	$commentController->createComment();
}elseif(isset($_GET['action']) && $_GET['action']=='report' && !empty($_GET['id']) ){

	$commentController->report();
}

elseif(isset($_GET['action']) && $_GET['action']=='show'){
	$postController = new PostController();
	$postController->show();

}elseif(isset($_GET['action']) && $_GET['action'] == "admin" ){
	
	$postController->listAdminPosts();
	
}elseif (isset($_GET['action']) && $_GET['action'] == 'editpost' && isset($_GET['id']) && !empty($_GET['id'])) {
	$postController->editPost();
	
}elseif (isset($_GET['action']) && $_GET['action'] == 'updatepost') {
	
		$postController->updatePost();
	}

elseif (isset($_GET['action']) && $_GET['action'] == 'deletepost' && isset($_GET['id']) && !empty($_GET['id'])) {

	$postController->deletePost();
}
elseif (isset($_GET['action']) && $_GET['action'] == "comment" ) {
	$commentController->listComment();
}
elseif (isset($_GET['action']) && $_GET['action'] == "deletecomment" && isset($_GET['id']) && !empty($_GET['id'])) {
	
	$commentController->deleteComment();
}

elseif(isset($_GET['action']) && $_GET['action'] == "newpost" ){

	$postController->newPost();
}
elseif(isset($_GET['action']) && $_GET['action'] == "creatpost" ){

	$postController->createPost();
}
#formlogin
elseif (isset($_GET['action']) && $_GET['action'] == 'formlogin') {
	require '..\template\Backend\login.html';
}
#login
elseif (isset($_GET['action']) && $_GET['action'] == 'login') {
		$login = new SecurityController();
		$login->login();
}elseif (isset($_GET['action']) && $_GET['action'] == 'logout'){
	$security = new SecurityController();
	$security->logout();
}
else{
	#afficher list post
	$postController = new PostController();
	$postController->listPosts();
}*/


