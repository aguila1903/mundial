<?php
session_start();

require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');
header("Cache-Control: no-cache, must-revalidate");
$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");

if (isset($_SESSION["login"]) && $_SESSION["login"] == login) {





$ADODB_CACHE_DIR = 'C:/php/cache';


$ADODB_FETCH_MODE = ADODB_FETCH_ASSOC; // Liefert ein assoziatives Array, das der geholten Zeile entspricht 

$ADODB_COUNTRECS = true;

$dbSyb = ADONewConnection("mysqli");

// DB-Abfragen NICHT cachen
$dbSyb->memCache = false;
$dbSyb->memCacheHost = array('localhost'); /// $db->memCacheHost = $ip1; will work too
$dbSyb->memCacheCompress = false; /// Use 'true' arbeitet unter Windows nicht
//$dsn = "'localhost','root',psw,'vitaldb'";
$dbSyb->Connect(link, user, psw, db); //=>>> Verbindungsaufbau mit der DB


if (!$dbSyb->IsConnected()) {


    print ("Anmeldung: " . $dbSyb->ErrorMsg());

    $data = array();

    return ($data);
}

$dbSyb->debug = false;
// Toplevel


// $Where = " Where stadion_id > 0 ";
// $Where = " Where land != 'nb' ";


if(isset($_REQUEST["wettbewerb_zusatz"])){
    $wettbewerb_zusatz = $_REQUEST["wettbewerb_zusatz"];
    $Where = " where wettbewerb_zusatz like ". $dbSyb->Quote(("%".$wettbewerb_zusatz."%"));
}else {
    $Where =  "";
}




$sqlQuery = "Select Distinct
wettbewerb_zusatz from sp_besuche "
. $Where
. " order by wettbewerb_zusatz;";



// file_put_contents('wettbewerb_zusatzDS.txt', $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);


if (!$rs) {
    print $dbSyb->ErrorMsg() . "\n";
    return;
}
$i = 0;

$value = array();

while (!$rs->EOF) {

    $value{$i}{"wettbewerb_zusatz"} = ($rs->fields{'wettbewerb_zusatz'});	
	  
    $i++;

    // den n�chsten Datensatz lesen
    $rs->MoveNext();
}

$rs->Close();



$output = json_encode($value);

print($output);
}  else {
    header("Location: http://$host/mundial/noadmin.php");
}
