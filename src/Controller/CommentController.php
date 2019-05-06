<?php
namespace App\Controller;
use App\Manager\CommentManager;
use App\Model\Comment;

class CommentController{
    // affichage des commentaires dans l'admin
	public function liste(){
		$commentManager = new CommentManager();
		$comments = $commentManager->listAllComments();
		require '..\template\Backend\commentAdmin.php';
		
	}
	//supression des commentaires signalés
	public function delete(){
		$id = $_GET['id'];
		$commentManager = new CommentManager();
		$comment = $commentManager->getComment($id);
		$commentManager->delete($comment);
		header("Location: index.php?action=list-comments");
	}

	
  

	public function report()
	{
		$commentManager = new CommentManager();
		// récupérer le commentaire
		$commentReport = $commentManager->getComment($_GET['id']);
		$report = (int)$commentReport->getReport();
		$newReport = $report+1;

		$commentReport->setReport($newReport);
		$commentManager->addReport($commentReport);

		header("Location:index.php?action=detailpost&id=".$commentReport->getPost());
	
	}
	
}