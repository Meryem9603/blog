<?php
namespace App\Controller;
use App\Manager\CommentManager;
use App\Model\Comment;

class CommentController{
    // affichage des commentaires dans l'admin
	public function liste(){
		$commentManager = new commentManager();
		$comments = $commentManager->listAllComments();
		require '..\template\Backend\commentAdmin.php';
		
	}
	//supression des commentaires signalés
	public function delete(){
		$id = $_GET['id'];
		$commentManager = new commentManager();
		$comment = $commentManager->getComment($id);
		$commentManager->delete($comment);
		header("Location: index.php?action=list-comments");
	}

	function create(){
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
			$commentManager = new commentManager();
			$commentManager->add($comment);
			header("Location:index.php?action=detailpost&id=".$_POST['post_id']);
		
		}else{
			echo "Veuillez remplir tous les champs !";
		}
	}

	public function report()
	{
		$commentManager = new commentManager();
		// récupérer le commentaire
		$commentReport = $commentManager->getComment($_GET['id']);
		$report = (int)$commentReport->getReport();
		$newReport = $report+1;

		$commentReport->setReport($newReport);
		$commentManager->addReport($commentReport);

		header("Location:index.php?action=detailpost&id=".$commentReport->getPost());
	
	}
	
}