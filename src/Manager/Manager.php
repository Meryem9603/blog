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
	public function connect(){
		//try {
			$this->db = new \PDO ('mysql:host=localhost;dbname=blog', 'root', '');
		    $this->db->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
		    $this->db->exec("set names utf8");

		/*} catch (\Exception $e) {
			echo "une erreur trouvée lors de la connexion à la base de données !";
		}*/
		
	}

	abstract function add($objet);

	

	abstract function update($objet);
		
	

	abstract function delete($objet);
		
	
} 