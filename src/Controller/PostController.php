<?php
namespace App\Controller;
use App\Manager\PostManager;
use App\Manager\CommentManager;
use App\Model\Post;

class PostController 
{

	public function liste()
	{
		$limit = $_GET['limit'];
		#afficher list post
		if(isset($_GET['page'])){
			$page = $_GET['page'];
		} else {
			$page = 1;
		}
		$postManager = new PostManager();
		$posts = $postManager->listPosts($page,$limit);
		$total_element = $postManager->count();
		$total_pages = ceil($total_element/$limit);

		require '..\template\Frontend\index.php';
	}

	public function show(){
		if(isset($_GET['id']) && !empty($_GET['id'])){
			#get post from DB
			$postManager = new PostManager();
			$post = $postManager->detailPost($_GET['id']);
			$commentManager = new CommentManager();
			$comments = $commentManager->listComments($post);
			$allPosts = $postManager->listAllPosts();

			#require post template
			require '..\template\Frontend\post.php';
		}
	}

	public function create()
	{
		if (isset($_SESSION['username']) && !empty($_SESSION['username'])) {

			if($_SERVER['REQUEST_METHOD'] == 'POST'){

				if(isset($_POST['title']) && isset($_POST['content']) && !empty($_POST['title']) && !empty($_POST['content']) && isset($_FILES['image']) && !empty($_FILES['image'])) {
						$post = new Post();
						$post->setAuthor("Jean Forteroche");
						$post->setTitle($_POST['title']);
						$post->setContent($_POST['content']);
						$image_name = "";
						require 'upload.php';
						if(!empty($image_name)){
							$post->setPicture($image_name);
						}
					$postManager = new PostManager();
					$postManager->add($post);
					if($post->getId() != null){
						echo "L'article ".  $post->setTitle()." a bien été ajouté!";
						header("Location: //".$_SERVER['HTTP_HOST']."/Blog/public/index.php?action=admin");
					}
				}else{
					echo "Veuillez remplir tous les champs !";
				}
			}
			require '..\template\Backend\newpost.php';
		}else{
			echo "accès interdit au non admins!";
		}
	}

	public function editPost()
	{
		if (isset($_SESSION['username']) && !empty($_SESSION['username'])) {
			$postManager = new PostManager();
			$post = $postManager->detailPost($_GET['id']);
			require '..\template\Backend\editpost.php';
		}else{
			echo "accès interdit au non admins!";
		}
	}

	public function updatePost()
	{
		if (isset($_SESSION['username']) && !empty($_SESSION['username'])) {
			if(isset($_POST['title']) && isset($_POST['content']) && !empty($_POST['title']) && !empty($_POST['content']) && $_POST['id']){
				$post = $postManager->detailPost($_POST['id']);
				if ($post) {
				
					$post->setTitle($_POST['title']);
					$post->setContent($_POST['content']);

					$postManager->update($post);

					header("Location: //".$_SERVER['HTTP_HOST']."/Blog/public/index.php?action=admin");
				}
			}
		}else{
			echo "accès interdit au non admins!";
		}
	}

	public function deletePost()
	{
		if (isset($_SESSION['username']) && !empty($_SESSION['username'])) {
			$postManager = new PostManager();
			$post = $postManager->detailPost($_GET['id']);
			if($post){

				$postManager->delete($post);
				header("Location: //".$_SERVER['HTTP_HOST']."/Blog/public/index.php?action=admin");
			}else{
				echo "article introuvable";
			}
		}else{
			echo "accès interdit au non admins!";
		}
	}

	public function listAdminPosts()
	{
		if (isset($_SESSION['username']) && !empty($_SESSION['username'])) {
			$postManager = new PostManager();
			$posts = $postManager->listAllPosts();
		
			require '..\template\Backend\index.php';
		}else{
			echo "accès interdit au non admins!";
		}
	}
}