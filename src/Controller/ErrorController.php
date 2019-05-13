<?php
namespace App\Controller;

class ErrorController 
{
	public function show($message = 'Controller inexistant')
	{
		require '../template/Frontend/error.php';
	}
}