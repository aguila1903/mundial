<?php
session_start();

require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');
header("Cache-Control: no-cache, must-revalidate");
$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");

if (isset($_SESSION["login"]) && $_SESSION["login"] == login && $_SESSION["admin"] == admin) {





$ADODB_CACHE_DIR = 'C:/php/cache';


$ADODB_FETCH_MODE = ADODB_FETCH_ASSOC; // Liefert ein assoziatives Array, das der geholten Zeile entspricht 

$ADODB_COUNTRECS = true;

$dbSyb = ADONewConnection("mysqli");

// DB-Abfragen NICHT cachen
$dbSyb->memCache = false;
$dbSyb->memCacheHost = array('localhost'); /// $db->memCacheHost = $ip1; will work too
$dbSyb->memCacheCompress = false; /// Use 'true' arbeitet unter Windows nicht
//$dsn = "'localhost','root',psw,'vitaldb'";
$dbSyb->Connect('localhost', user, psw, db); //=>>> Verbindungsaufbau mit der DB


if (!$dbSyb->IsConnected()) {


    print ("Anmeldung: " . $dbSyb->ErrorMsg());

    $data = array();

    return ($data);
}

$dbSyb->debug = false;

// if(isset($_REQUEST["ort"])){
    // $ort = $_REQUEST["ort"];
    // $Where = " where ort like ". $dbSyb->Quote(("%".$ort."%")).";";
// }else {
    // $Where =  "";
// }

if(isset($_REQUEST["land"])){
    $land = $_REQUEST["land"];
    $Where = " and land = ". $dbSyb->Quote(($land));
}else {
    $Where =  "";
}

if(isset($_REQUEST["liga_bez"])){
    $liga_bez = $_REQUEST["liga_bez"];
    $Where .= " and liga_bez like ". $dbSyb->Quote(("%".$liga_bez."%"));
}else {
    $Where .=  "";
}

$sqlQuery = "
SELECT distinct liga_bez, zusatz, liga_id, land as code, l.de as land from ligen join laender l on l.code = land ". $Where . " order by land, liga_id, liga_bez "
;
// file_put_contents("liegenDS.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);


if (!$rs) {
    print $dbSyb->ErrorMsg() . "\n";
    return;
}
$i = 0;

$value = array();

while (!$rs->EOF) {

   
    $value{$i}{"liga_bez"} = ($rs->fields{'liga_bez'});
	$value{$i}{"zusatz"} = ($rs->fields{'zusatz'});
	$value{$i}{"code"} = ($rs->fields{'code'});
	$value{$i}{"land"} = ($rs->fields{'land'});
	$value{$i}{"liga_id"} = $rs->fields{'liga_id'};
   
    $i++;

    // den n�chsten Datensatz lesen
    $rs->MoveNext();
}

$rs->Close();



$output = json_encode($value);

print($output);
} else {
    header("Location: http://$host$uri/noadmin.php");
}
