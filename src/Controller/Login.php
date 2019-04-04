<?php
namespace App\Controller;

class Login 
{
	private $db;

	function __construct()
	{
		$this->db = new \PDO ('mysql:host=localhost;dbname=blog', 'root', '');
	    $this->db->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
	    $this->db->exec("set names utf8");

	}

	public function authentification($username, $password)
	{
		//  Récupération de l'utilisateur et de son pass hashé
		$req = $this->db->prepare('SELECT id, password, firstname, lastname FROM user WHERE username = :username');
		$req->execute(array('username' => $username));

		$resultat = $req->fetch();

		// Comparaison du pass envoyé via le formulaire avec la base
		$isPasswordCorrect = password_verify($password, $resultat['password']);
		$connected = 0;
		if (!$resultat)
		{
		    $connected = 0;
		}
		else
		{
		    if ($isPasswordCorrect) {
		        $_SESSION['id'] = $resultat['id'];
		        $_SESSION['username'] = $username;
		        $_SESSION['firstname'] = $resultat['firstname'];
		        $_SESSION['lastname']  = $resultat['lastname'];
		        $connected = 1;
		    }
		    else {
		        $connected = 0;
		    }
		}
		return $connected;
	}
}
