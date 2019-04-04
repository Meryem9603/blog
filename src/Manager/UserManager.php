<?php
namespace App\Manager;
use App\Model\User;

class UserManager extends Manager{


	public function add($objectUser){
		$query = $this->db->prepare('INSERT INTO user(username, firstname, lastname, password, email,description, created ) VALUES (:username, :firstname ,:lastname,:password, :email, :description,NOW())');
		$query->bindValue(':username',$objectUser->getUsername());
		$query->bindValue(':firstname',$objectUser->getFirstname());
		$query->bindValue(':lastname',$objectUser->getLastname());
		$query->bindValue(':email',$objectUser->getEmail());
		$query->bindValue(':description',$objectUser->getDescription());
		$query->bindValue(':password',$objectUser->getPassword());
		$query->execute();
	}

	public function update($objectUser){
	}

	public function delete($userObjet){
	}
}