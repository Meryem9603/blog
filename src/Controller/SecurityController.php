<?php
namespace App\Controller;

class SecurityController 
{
	private $db;

	function __construct()
	{
		$this->db = new \PDO ('mysql:host=localhost;dbname=blog', 'root', '');
	    $this->db->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
	    $this->db->exec("set names utf8");

	}

	public function login()
	{
		if(isset($_POST['username']) && isset($_POST['password']) &&!empty($_POST['username']) && !empty($_POST['password']) )
		{
			$username = $_POST['username'];
			$password = $_POST['password'];
				
			//  Récupération de l'utilisateur et de son pass hashé
			$req = $this->db->prepare('SELECT id, password, firstname, lastname FROM user WHERE username = :username');
			$req->execute(array('username' => $username));

			$resultat = $req->fetch();

			// Comparaison du pass envoyé via le formulaire avec la base
			
			$connected = 0;
			if (!$resultat)
			{
			    $connected = 0;
			}
			else
			{
				$isPasswordCorrect = password_verify($password, $resultat['password']);
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

			if($connected == 1){
				header("Location: index.php?action=admin");
			}else{
				echo "mauvais identifiants";
			}
		}
	}

	public function logout()
	{
		session_start(); //to ensure you are using same session
		session_destroy(); //destroy the session
		header("location: index.php"); //to redirect back to "index.php" after logging out
		exit();
	}
}
