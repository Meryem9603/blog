<?php
namespace App\Manager;
use App\Model\Comment;

class CommentManager extends Manager {

	public function add($commentObject){
		$requete = $this->db->prepare('INSERT INTO comment(username, mail, comment,post ,created, updated) VALUES(:username, :mail, :comment, :post_id, NOW(), NOW())');

		$requete->bindValue(':username',$commentObject->getUsername());
		$requete->bindValue(':mail',$commentObject->getMail() );
		$requete->bindValue(':comment',$commentObject->getComment());
		$requete->bindValue(':post_id',$commentObject->getPost());
		$requete->execute();
	}

	public function listComments($Post){
		$query = $this->db->prepare('SELECT * FROM comment WHERE post = :idPost ORDER BY created DESC');
		$query->bindValue(':idPost',$Post->getId());
		$query->execute();
		return $query->fetchAll(\PDO::FETCH_CLASS, Comment::class);
		 
	}

	public function listAllComments(){
		$query = $this->db->prepare('SELECT * FROM comment ORDER BY report DESC');
		$query->execute();
		return $query->fetchAll(\PDO::FETCH_CLASS, Comment::class);
		 
	}
	public function getComment($id){
		$query =$this->db->prepare('SELECT * FROM comment WHERE id=:id');
		$query ->bindValue(':id' ,$id);
		$query->execute();
		//retourner un object de type post1
		$query->setFetchMode(\PDO::FETCH_CLASS | \PDO::FETCH_PROPS_LATE, Comment::class);
		return $query->fetch();
	}
	public function update($objet){

	}
	
	public function addReport($objectComment){
		$query =$this->db->prepare('UPDATE comment SET report =:report, updated=NOW() WHERE id=:id ');
		$query->bindValue(':report',$objectComment->getReport());

		$query->bindValue(':id',$objectComment->getId());
		$query->bindValue(':report',$objectComment->getReport());
		$query->execute();
	}
	
	public function delete($commentObjet){
		$query =$this->db->prepare('DELETE FROM comment where id=:id');
		$query->bindValue(':id',$commentObjet->getId());
		$query->execute();
	}
		 

}
