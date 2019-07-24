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


if (isset($_REQUEST["jahr"])){
    $jahr = $_REQUEST["jahr"];
}
else {    
$jahr = "";

}


if (isset($_REQUEST["verkehrsmittel"])){
    $verkehrsmittel = $_REQUEST["verkehrsmittel"];    
}
else {    
$verkehrsmittel = "alle";
}

if (isset($_REQUEST["monat"])){
    $monat_ = $_REQUEST["monat"]; 
if ($monat_ == "Januar") {
	$monat = 1;
}	
if ($monat_ == 'Februar'){
	$monat = 2;
}
if ($monat_ == 'März'){
	$monat = 3;
}
if ($monat_ == 'April'){
	$monat = 4;
}
if ($monat_ == 'Mai'){
	$monat = 5;
}
if ($monat_ == 'Juni'){
	$monat = 6;
}
if ($monat_ == 'Juli'){
	$monat = 7;
}
if ($monat_ == 'August'){
	$monat = 8;
}
if ($monat_ == 'September'){
	$monat = 9;
}
if ($monat_ == 'Oktober'){
	$monat = 10;
}
if ($monat_ ==  'November'){
	$monat = 11;
}
if ($monat_ ==  'Dezember'){
	$monat = 12;
}
}
else {    
$monat = 0;
}

if (isset($_REQUEST["auswahl"])){
    $auswahl = $_REQUEST["auswahl"];
   
        $where = " where year(sp_datum) = " . $jahr." and month(sp_datum) = ".$monat;
    
}
else {    
$where = "";
}

$sqlQuery = " Select verkehrsmittel as Titel, sum(entfernung_km) as Wert from mobil m join sp_besuche sp on sp.spiel_id = m.spiel_id " .$where. " Group by verkehrsmittel" ;

// file_put_contents("kostenGrafik.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);


if (!$rs) {
    print $dbSyb->ErrorMsg() . "\n";
    return;
}
$i = 0;

$value = array();

while (!$rs->EOF) {
   
    $value{$i}{"Wert"} = $rs->fields{'Wert'};
    $value{$i}{"Titel"} = $rs->fields{'Titel'};

   
    $i++;

    // den n�chsten Datensatz lesen
    $rs->MoveNext();
}

$rs->Close();

$out = array();

    // zentrale Anwortfunktion f�r REST-Datenquellen
    // im Kern nicht anderes als print json_encode($value)
    $out{'response'}{'status'} = 0;
    $out{'response'}{'errors'} = array();
    $out{'response'}{'data'} = $value;

    print json_encode($out);
} else {
    header("Location: http://$host$uri/noadmin.php");
}
