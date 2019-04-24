<?php
namespace App\Controller;

class ErrorController 
{
	public function show($message)
	{
		require '../template/Frontend/error.php';
	}
}