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



if (isset($_REQUEST["ort"])) {
    $ort = $_REQUEST["ort"];
    $WhereOrt = " and s.ort_id = ". $ort;
} else {
   $WhereOrt = "";
}


if(isset($_REQUEST["stadtteil"])){
    $stadtteil = $_REQUEST["stadtteil"];
    $Where = " and name like ". $dbSyb->Quote(("%".$stadtteil."%")).";";
}else {
    $Where =  "";
}

$sqlQuery = "SELECT distinct stadtteil_id, name, s.ort_id, o.ort,de as land, l.code
from stadtteile s Left join orte o on o.ort_id = s.ort_id
left join laender l on l.code = o.code 
 where length(stadtteil_id) > 0 " . $WhereOrt . $Where. " order by name ";
 
// file_put_contents("stadtteilDS.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);


if (!$rs) {
    print $dbSyb->ErrorMsg() . "\n";
    return;
}
$i = 0;

$value = array();

while (!$rs->EOF) {

   
    $value{$i}{"name"} = ($rs->fields{'name'});
	$value{$i}{"land"} = ($rs->fields{'land'});
	$value{$i}{"code"} = ($rs->fields{'code'});
	$value{$i}{"ort"} = ($rs->fields{'ort'});
	$value{$i}{"stadtteil_id"} = $rs->fields{'stadtteil_id'};
	$value{$i}{"ort_id"} = $rs->fields{'ort_id'};
   
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
