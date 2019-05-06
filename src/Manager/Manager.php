<?php
namespace App\Manager;
 /**
 * global manager
 */
abstract class Manager 
{

	protected $db;
	public function __construct(){
		$this->connect();
	}
	//connexion to database
	public function connect(){
		
			$this->db = new \PDO ('mysql:host=localhost;dbname=blog', 'root', '');
		    $this->db->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
		    $this->db->exec("set names utf8");

		
		
	}

	abstract function add($objet);

	

	abstract function update($objet);
		
	

	abstract function delete($objet);
		
	
} 