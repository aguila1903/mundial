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
$dbSyb->Connect(link, user, psw, db); //=>>> Verbindungsaufbau mit der DB


if (!$dbSyb->IsConnected()) {


    print ("Anmeldung: " . $dbSyb->ErrorMsg());

    $data = array();

    return ($data);
}

$dbSyb->debug = false;

if(isset($_REQUEST["spiel"])){
    $spiel = $_REQUEST["spiel"];
    $Where = 
	" where vh.gaengiger_name like ". $dbSyb->Quote(("%".$spiel."%"))
	. " or va.gaengiger_name like ". $dbSyb->Quote(("%".$spiel."%"))
	. " or DATE_FORMAT(sp.sp_datum,GET_FORMAT(DATE,'EUR')) like ". $dbSyb->Quote(("%".$spiel."%"))
	. " or ta.name like ". $dbSyb->Quote(("%".$spiel."%"))
	. " or th.name like ". $dbSyb->Quote(("%".$spiel."%"));
	
}else {
    $Where =  "";
}

$sqlQuery = "SELECT spiel_id, concat(DATE_FORMAT(sp.sp_datum,GET_FORMAT(DATE,'EUR')),' - ',vh.gaengiger_name, ' - ',va.gaengiger_name,' ',ergebnis) as spiel"
. " from sp_besuche sp left join vereine vh on sp.verein_id_h = vh.verein_id  "
. " left join vereine va on sp.verein_id_a = va.verein_id "
. " left join trainer ta on sp.trainer_id_a = ta.trainer_id "
. " left join trainer th on sp.trainer_id_h = th.trainer_id "
.$Where . " order by nr ";



// file_put_contents("laenderDS.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);


if (!$rs) {
    print $dbSyb->ErrorMsg() . "\n";
    return;
}
$i = 0;

$value = array();



while (!$rs->EOF) {

   
    $value{$i}{"spiel"} = ($rs->fields{'spiel'});
   $value{$i}{"spiel_id"} = ($rs->fields{'spiel_id'});
   
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
