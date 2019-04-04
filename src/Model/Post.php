<?php
namespace App\Model;

class Post
{
	private $id;
	private $author;
	private $title;
	private $content;
	private $created;
	private $updated;
	private $picture;


	public function getId(){
		return $this->id;
	}

	public function getAuthor(){
		return $this->author;
	}

	public function getTitle(){
		return $this->title;
	}

	public function getContent(){
		return $this->content;
	}

	public function getCreated(){
		return $this->created;
	}

	public function getUpdated(){
		return $this->updated;
	}

	public function getPicture(){
		return $this->picture;
	}

	public function setAuthor($author){
		$this->author =$author;
		return $this;
	}

	public function setTitle($title){
		$this->title =$title;
		return $this;
	}

	public function setContent($content){
		$this->content =$content;
		return $this;
	}

	public function setCreated($created){
		$this->created =$created;
		return $this;
	}

	public function setUpdated($updated){
		$this->updated =$updated;
		return $this;
	}

	public function setPicture($picture){
		$this->picture =$picture;
		return $this;
	}
}