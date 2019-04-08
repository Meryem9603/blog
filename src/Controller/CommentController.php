<?php
namespace App\Controller;
use App\Manager\CommentManager;
use App\Model\Comment;

class CommentController{

	public function listComment(){
		if(isset($_SESSION['username']) && !empty($_SESSION['username'])){
			$commentManager = new commentManager();
			$comments = $commentManager->listAllComments();
			require '..\template\Backend\commentAdmin.php';
		}else{
			echo "l'accés est interdit";
		}
	}

	public function deleteComment(){
		if(isset($_SESSION['username']) && !empty($_SESSION['username'])){
			
			$id = $_GET['id'];
			$commentManager = new commentManager();
			$comment = $commentManager->getComment($id);
			if($comment ){
				$commentManager->delete($comment);
			}else{
				echo "le commentaire est introuvable";
			}
			
			header("Location: //".$_SERVER['HTTP_HOST']."/Blog/public/index.php?action=comment");
		
		}else{
			echo "l'accés est interdit";
		}
	}

	function createComment(){
		if(isset($_POST['username']) && isset($_POST['mail'])&& isset($_POST['comment']) && isset($_POST['post_id']) &&  !empty($_POST['username']) && !empty($_POST['mail']) && !empty($_POST['comment']) && !empty($_POST['post_id']) ) {

			$comment = new Comment();
			$comment->setUsername($_POST['username']);
			$comment->setMail($_POST['mail']);
			$comment->setComment($_POST['comment']);
			$comment->setPost($_POST['post_id']);
			$commentManager = new commentManager();
			$commentManager->add($comment);

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

		echo "le commentaire a bien été signalé !";
	}
	
}