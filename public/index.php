<?php 
session_start();
require '..\vendor\autoload.php';

use App\Model\Post;
use App\Model\Comment;
use App\Controller\Login;
use App\Controller\PostController;
use App\Controller\CommentController;

$postController = new PostController();
$commentController = new CommentController();


#ajouter un nouveau commentaire
if(isset($_GET['action']) && $_GET['action']=='createcomment'){
	
	$commentController->createComment();
}elseif(isset($_GET['action']) && $_GET['action']=='report' && !empty($_GET['id']) ){

	$commentController->report();
}
elseif(isset($_GET['action']) && $_GET['action']=='detailpost'){
	$postController = new PostController();
	$postController->getPost();

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
	if(isset($_POST['username']) && isset($_POST['password']) &&!empty($_POST['username']) && !empty($_POST['password']) ){
		$login = new Login();
		$connected = $login->authentification($_POST['username'],$_POST['password']);
		if($connected == 1){
			header("Location: //".$_SERVER['HTTP_HOST']."/Blog/public/index.php?action=admin");
		}else{
			echo "mauvais identifiants";
		}
	}
}
else{
	#afficher list post
	$postController = new PostController();
	$postController->listPosts();
}


