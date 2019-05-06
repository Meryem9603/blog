<?php
namespace App\Manager;
use App\Model\Post;

class PostManager extends Manager{

	// add a new post
	public function add($objectPost){
		$query = $this->db->prepare('INSERT INTO post(author, title, content, picture, created, updated ) VALUES (:author, :title ,:content,:picture, NOW(), NOW())');
		$query->bindValue(':author',$objectPost->getAuthor());
		$query->bindValue(':title',$objectPost->getTitle());
		$query->bindValue(':content',$objectPost->getContent());
		$query->bindValue(':picture',$objectPost->getPicture());
		$query->execute();
	}
	//update post
	public function update($objectPost){
		$query =$this->db->prepare('UPDATE post SET author =:author ,title =:title, content=:content, updated=NOW() WHERE id=:id ');
		$query->bindValue(':author',$objectPost->getAuthor());
		$query->bindValue(':title',$objectPost->getTitle());
		$query->bindValue(':content',$objectPost->getContent());
		$query->bindValue(':id',$objectPost->getId());
		$query->execute();
	}
	//delete post 
	public function delete($postObjet){
		$query =$this->db->prepare('DELETE FROM post where id=:id');
		$query->bindValue(':id',$postObjet->getId());
		$query->execute();
	}
	//list posts 
	public function listPosts($page=1,$limit = 9){
		
		$offset  = ($page-1)*$limit; 
		$post =$this->db->query('SELECT * FROM post LIMIT '.$limit.' OFFSET '.$offset)->fetchAll(\PDO::FETCH_CLASS, Post::class);
		return $post;
	}
	//list posts
	public function listAllPosts(){
		
		
		return $this->db->query('SELECT * FROM post')->fetchAll(\PDO::FETCH_CLASS, Post::class);
		
	}

	public function count()
	{
		$count = $this->db->query('SELECT count(*) as total FROM post')->fetch();
		return $count['total'];
	}
	// get one post
	public function detailPost($id){

		$query =$this->db->prepare('SELECT * FROM post WHERE id=:id');
		$query ->bindValue(':id' ,$id);
		$query->execute();
		
		$query->setFetchMode(\PDO::FETCH_CLASS | \PDO::FETCH_PROPS_LATE, Post::class);
		return $query->fetch();
	}
}