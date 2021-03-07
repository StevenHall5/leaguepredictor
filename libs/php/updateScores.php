<?php

	$executionStartTime = microtime(true);

	include("config.php");

	header('Content-Type: application/json; charset=UTF-8');

	$conn = new mysqli($cd_host, $cd_user, $cd_password, $cd_dbname, $cd_port, $cd_socket);

	if (mysqli_connect_errno()) {
		
		$output['status']['code'] = "300";
		$output['status']['name'] = "failure";
		$output['status']['description'] = "database unavailable";
		$output['status']['returnedIn'] = (microtime(true) - $executionStartTime) * 1000 . " ms";
		$output['data'] = [];

		mysqli_close($conn);

		echo json_encode($output);

		exit;

	}	

	$query = 'UPDATE prem SET played = played + 1, won = won + ' . $_REQUEST['won'] . ', drawn = drawn + ' . $_REQUEST['drawn'] . ', lost = lost + ' . $_REQUEST['lost'] . ', goalsFor = goalsFor + ' . $_REQUEST['goalsFor'] . ', goalsAgainst = goalsAgainst + ' . $_REQUEST['goalsAgainst'] . ', goalDifference = goalDifference + ' . $_REQUEST['goalDifference'] . ', points = points + ' . $_REQUEST['points'] . ' WHERE name = "' . $_REQUEST['name'] . '"';

	$result = $conn->query($query);
	
	if (!$result) {

		$output['status']['code'] = "400";
		$output['status']['name'] = "executed";
		$output['status']['description'] = "query failed";	
		$output['data'] = [];

		mysqli_close($conn);

		echo json_encode($output); 

		exit;

	}

	$output['status']['code'] = "200";
	$output['status']['name'] = "ok";
	$output['status']['description'] = "success";
	$output['status']['returnedIn'] = (microtime(true) - $executionStartTime) * 1000 . " ms";
	$output['data'] = [];
	
	mysqli_close($conn);

	echo json_encode($output); 

?>