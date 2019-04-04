<?php 
session_start();
require '..\vendor\autoload.php';

use  App\Manager\PostManager;
use  App\Manager\CommentManager;
use App\Model\Post;
use App\Model\Comment;
use App\Controller\Login;

$postManager = new PostManager();
$commentManager = new CommentManager();


#ajouter un nouveau commentaire
if(isset($_POST['addComment'])){
	
	if(isset($_POST['username']) && isset($_POST['mail'])&& isset($_POST['comment']) && isset($_POST['post_id']) &&  !empty($_POST['username']) && !empty($_POST['mail']) && !empty($_POST['comment']) && !empty($_POST['post_id']) ) {

		$comment = new Comment();
		$comment->setUsername($_POST['username']);
		$comment->setMail($_POST['mail']);
		$comment->setComment($_POST['comment']);
		$comment->setPost($_POST['post_id']);

		$commentManager->add($comment);

	}else{
		echo "Veuillez remplir tous les champs !";
	}
}

#afficher detail post
if(isset($_GET['action']) && $_GET['action']=='detailpost' && isset($_GET['id']) && !empty($_GET['id'])){
	#get post from DB
	//$post= ...
	$post = $postManager->detailPost($_GET['id']);
	$comments = $commentManager->listComments($post);
	$allPosts = $postManager->listAllPosts();

	#require post template
	require '..\template\Frontend\post.php';	
}elseif(isset($_GET['action']) && $_GET['action'] == "admin" ){
	
	$posts = $postManager->listAllPosts();
	
	require '..\template\Backend\index.php';
	
}elseif (isset($_GET['action']) && $_GET['action'] == 'editpost' && isset($_GET['id']) && !empty($_GET['id'])) {
	$post = $postManager->detailPost($_GET['id']);
	require '..\template\Backend\editpost.php';
	
}elseif (isset($_POST['updatepost'])) {
	
		if(isset($_POST['title']) && isset($_POST['content']) && !empty($_POST['title']) && !empty($_POST['content']) && $_POST['id']){
		$post = $postManager->detailPost($_POST['id']);
		if ($post) {
		
		$post->setTitle($_POST['title']);
		$post->setContent($_POST['content']);

		$postManager->update($post);

		header("Location: //".$_SERVER['HTTP_HOST']."/Blog/public/index.php?action=admin");
		}

		}
	}

elseif (isset($_GET['action']) && $_GET['action'] == 'deletepost' && isset($_GET['id']) && !empty($_GET['id'])) {
	$post = $postManager->detailPost($_GET['id']);
	if($post){
		$postManager->delete($post);
		header("Location: //".$_SERVER['HTTP_HOST']."/Blog/public/index.php?action=admin");
	}else{
		echo "article introuvable";
	}
}
elseif (isset($_GET['action']) && $_GET['action'] == "comment" ) {
	$comments = $commentManager->listAllComments();
	require '..\template\Backend\commentAdmin.php';
}
elseif (isset($_GET['action']) && $_GET['action'] == "deletecomment" && isset($_GET['id']) && !empty($_GET['id'])) {
	$id = $_GET['id'];
	$comment = $commentManager->getComment($id);
	if($comment ){
		$commentManager->delete($comment);
	}else{
		echo "le commentaire est introuvable";
	}
	
	header("Location: //".$_SERVER['HTTP_HOST']."/Blog/public/index.php?action=comment");
}

elseif(isset($_GET['action']) && $_GET['action'] == "newpost" ){

	require '..\template\Backend\newpost.php';
}
elseif(isset($_GET['action']) && $_GET['action'] == "creatpost" ){
	if(isset($_POST['title']) && isset($_POST['content']) && !empty($_POST['title']) && !empty($_POST['content']) && isset($_FILES['image']) && !empty($_FILES['image'])) {
		$post = new Post();
		$post->setAuthor("Jean Forteroche");
		$post->setTitle($_POST['title']);
		$post->setContent($_POST['content']);
		$image_name = "";
		require 'upload.php';
		if(isset($image_name)){
			$post->setPicture($image_name);
		}

		$postManager->add($post);
		if($post->getId() != null){
			echo "L'article ".  $post->setTitle()." a bien été ajouté!";
			header("Location: //".$_SERVER['HTTP_HOST']."/Blog/public/index.php?action=admin");
		}
	}else{
		echo "Veuillez remplir tous les champs !";
	}
	
	require '..\template\Backend\newpost.php';
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
	$limit = 9;
	if(isset($_GET['page'])){
	$page = $_GET['page'];
	} else {
	$page = 1;
	}
	$posts = $postManager->listPosts($page,$limit);
	$total_element = $postManager->count();
	$total_pages = ceil($total_element/$limit);
	require '..\template\Frontend\index.php';
}

#signaler un commentaire
if(isset($_GET['report']) && !empty($_GET['report']) ){
	// récupérer le commentaire
	$commentReport = $commentManager->getComment($_GET['report']);
	$report = (int)$commentReport->getReport();
	$newReport = $report+1;

	$commentReport->setReport($newReport);
	$commentManager->addReport($commentReport);

	echo "le commentaire a bien été signalé !";
}
