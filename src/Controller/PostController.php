<?php
namespace App\Controller;
use App\Manager\PostManager;
use App\Manager\CommentManager;
use App\Model\Post;

class PostController 
{

	public function liste()
	{
		$limit = 9;
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
		
		#get post from DB
		$postManager = new PostManager();
		$post = $postManager->detailPost($_GET['id']);
		$commentManager = new CommentManager();
		$comments = $commentManager->listComments($post);
		$allPosts = $postManager->listAllPosts();
		#require post template
		require '..\template\Frontend\post.php';	
	}

	public function create()
	{
		
		if($_SERVER['REQUEST_METHOD'] == 'POST' 
			&& isset($_POST['title']) 
			&& isset($_POST['content']) 
			&& !empty($_POST['title']) 
			&& !empty($_POST['content']) 
			&& isset($_FILES['image']) 
			&& !empty($_FILES['image'])){

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
				header("Location: index.php?action=admin");
			
		}
		require '..\template\Backend\newpost.php';
		
	}

	

	public function update()
	{

		$postManager = new PostManager();
		$post = $postManager->detailPost($_GET['id']);
		if($_SERVER['REQUEST_METHOD'] == 'POST'
		  &&  isset($_POST['title']) 
		  && isset($_POST['content']) 
		  && !empty($_POST['title'])
		  && !empty($_POST['content']) 
		  && $_POST['id']){
			$post = $postManager->detailPost($_POST['id']);

			$post->setTitle($_POST['title']);
			$post->setContent($_POST['content']);

			$postManager->update($post);

			header("Location: index.php?action=admin");
		}
	
		require '..\template\Backend\editpost.php';
	
	}

	public function delete()
	{
		
		$postManager = new PostManager();
		$post = $postManager->detailPost($_GET['id']);
		$postManager->delete($post);
		header("Location:index.php?action=admin");
					
	}

	public function listAdminPosts()
	{
		
		$postManager = new PostManager();
		$posts = $postManager->listAllPosts();
	
		require '..\template\Backend\index.php';
		
	}
}