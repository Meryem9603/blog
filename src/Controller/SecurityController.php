<?php
namespace App\Controller;
use App\Manager\Manager;

class SecurityController extends Manager
{
	
	public function login()
	{
		if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['username']) && isset($_POST['password']) &&!empty($_POST['username']) && !empty($_POST['password']) )
		{
			
			$username = $_POST['username'];
			$password = $_POST['password'];
				
			//  Récupération de l'utilisateur et de son pass hashé
			$req = $this->db->prepare('SELECT id, password, firstname, lastname FROM user WHERE username = :username');
			$req->execute(array('username' => $username));

			$resultat = $req->fetch();

			// Comparaison du pass envoyé via le formulaire avec la base
						
			if ($resultat){

				$isPasswordCorrect = password_verify($password, $resultat['password']);
			    if ($isPasswordCorrect) {

			        $_SESSION['username'] = $username;
			        $_SESSION['firstname'] = $resultat['firstname'];
			        $_SESSION['lastname']  = $resultat['lastname'];
			        header("Location: index.php?action=admin");
			    }
			}
	
		}

		require '..\template\Backend\login.html';
	}

	public function logout()
	{
		session_start(); //to ensure you are using same session
		session_destroy(); //destroy the session
		header("location: index.php?action=home"); //to redirect back to "index.php" after logging out
		exit();
	}

	public function add($object){
	}

	public function update($object){
	}

	public function delete($object){
	}
}
