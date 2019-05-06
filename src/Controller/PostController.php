<?php
namespace App\Controller;
use App\Manager\PostManager;
use App\Manager\CommentManager;
use App\Model\Post;
use App\Model\Comment;

class PostController 
{

	public function liste()
	{
		$limit = 9;
		
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
		// show one post with its comments
		
		$postManager = new PostManager();
		$post = $postManager->detailPost($_GET['id']);
		$commentManager = new CommentManager();
		$comments = $commentManager->listComments($post);
		$allPosts = $postManager->listAllPosts();
		
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


	public function createComment(){
		if( $_SERVER['REQUEST_METHOD'] == 'POST' 
			&& isset($_POST['username']) 
			&& isset($_POST['mail']) 
			&& isset($_POST['comment']) 
			&& isset($_POST['post_id']) 
			&& !empty($_POST['username']) 
			&& !empty($_POST['mail']) 
			&& !empty($_POST['comment']) 
			&& !empty($_POST['post_id'])) {
			$comment = new Comment();
			$comment->setUsername($_POST['username']);
			$comment->setMail($_POST['mail']);
			$comment->setComment($_POST['comment']);
			$comment->setPost($_POST['post_id']);
			$commentManager = new CommentManager();
			$commentManager->add($comment);
			header("Location:index.php?action=detailpost&id=".$_POST['post_id']);
		
		}else{
			echo "Veuillez remplir tous les champs !";
		}
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