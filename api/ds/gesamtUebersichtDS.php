<?php
session_start();

require_once('db_psw.php');
header("Cache-Control: no-cache, must-revalidate");
$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");

if (isset($_SESSION["login"]) && $_SESSION["login"] == login && $_SESSION["admin"] == admin) {




$out = array();


$link = new mysqli('localhost', 'root', psw, db);

$result = $link->query("select count(*) as anzahl from stadionliste group by land;");
$result2 = $link->query("Select count(*) as anzahl from stadionliste");
$result3 = $link->query("Select count(*) as anzahl from stadionliste where land = 'DE'");
$result4 = $link->query("Select count(*) as anzahl from stadionliste where land != 'DE'");
$result5 = $link->query("Select count(*) as anzahl from sp_besuche");
$num_rows = mysqli_num_rows($result);

$stadien_gesamt = $result2->fetch_assoc(); // Gesamt Anzahl der Stadien
$spiele = $result5->fetch_assoc(); // Gesamt Anzahl der Spiele
$stadien_ger = $result3->fetch_assoc();  // Nur Deutschland
$stadien_aus = $result4->fetch_assoc();  // Nur Ausland

mysqli_close($link);

// $fp = fopen("spieleDS.txt", "w"); 
// fputs($fp, $querySQL);             
// fclose($fp); 

$data = array();


			
	$data{"laender_gesamt"} = $num_rows;	
	$data{"stadien_gesamt"} = $stadien_gesamt['anzahl'];
	$data{"stadien_ger"} = 	$stadien_ger['anzahl'];
	$data{"stadien_aus"} = 	$stadien_aus['anzahl'];
	$data{"spiele"} = 	$spiele['anzahl'];



    $out{'response'}{'status'} = 0;
    $out{'response'}{'errors'} = array();
    $out{'response'}{'data'} = $data;

    print json_encode($out);

} else {
    header("Location: http://$host/mundial/noadmin.php");
}
?>