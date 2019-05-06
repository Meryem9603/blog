<?php
namespace App\Manager;
use App\Model\Comment;

class CommentManager extends Manager { 
	// add new comment
	public function add($commentObject){
		$requete = $this->db->prepare('INSERT INTO comment(username, mail, comment,post ,created, updated) VALUES(:username, :mail, :comment, :post_id, NOW(), NOW())');

		$requete->bindValue(':username',$commentObject->getUsername());
		$requete->bindValue(':mail',$commentObject->getMail() );
		$requete->bindValue(':comment',$commentObject->getComment());
		$requete->bindValue(':post_id',$commentObject->getPost());
		$requete->execute();
	}
	//list comments
	public function listComments($Post){
		$query = $this->db->prepare('SELECT * FROM comment WHERE post = :idPost ORDER BY created DESC');
		$query->bindValue(':idPost',$Post->getId());
		$query->execute();
		return $query->fetchAll(\PDO::FETCH_CLASS, Comment::class);
		 
	}
	//list comments
	public function listAllComments(){
		$query = $this->db->prepare('SELECT * FROM comment ORDER BY report DESC');
		$query->execute();
		return $query->fetchAll(\PDO::FETCH_CLASS, Comment::class);
		 
	}
	//get comments
	public function getComment($id){
		$query =$this->db->prepare('SELECT * FROM comment WHERE id=:id');
		$query ->bindValue(':id' ,$id);
		$query->execute();
		
		$query->setFetchMode(\PDO::FETCH_CLASS | \PDO::FETCH_PROPS_LATE, Comment::class);
		return $query->fetch();
	}
	public function update($objet){

	}
	// add report 
	public function addReport($objectComment){
		$query =$this->db->prepare('UPDATE comment SET report =:report, updated=NOW() WHERE id=:id ');
		$query->bindValue(':report',$objectComment->getReport());

		$query->bindValue(':id',$objectComment->getId());
		
		$query->execute();
	}
	//delete comment
	public function delete($commentObjet){
		$query =$this->db->prepare('DELETE FROM comment WHERE id=:id');
		$query->bindValue(':id',$commentObjet->getId());
		$query->execute();
	}
		 

}
