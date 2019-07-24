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


if (isset($_REQUEST["kostenPunkt"])){
    $kostenPunkt = $_REQUEST["kostenPunkt"];    
}
else {    
$kostenPunkt = "alle";
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

$sqlQuery = " Select ifnull(sum(sprit),0) as Wert, 'Sprit (Eigenanteil)' as Titel  from sp_besuche " .$where 
." Union Select ifnull(sum(bahn),0) as Wert, 'Bahn' as bahn  from sp_besuche " .$where  
." Union Select ifnull(sum(flieger),0) as Wert, 'Flieger' as flieger  from sp_besuche " .$where 
." Union Select ifnull(sum(uebernachtung),0) as Wert, 'Übernachtung' as uebernachtung  from sp_besuche " .$where 
." Union Select ifnull(sum(verpflegung),0) as Wert, 'Speis und Trank' as verpflegung  from sp_besuche " .$where 
." Union Select ifnull(sum(sonstige),0) as Wert, 'Sonstige' as sonstige  from sp_besuche " .$where 
." Union Select ifnull(sum(taxi),0) as Wert, 'Taxi' as sonstige  from sp_besuche " .$where 
." Union Select ifnull(sum(handy),0) as Wert, 'Handy' as sonstige  from sp_besuche " .$where 
." Union Select ifnull(sum(souvenir),0) as Wert, 'Souvenir/Devotionalien' as souvenir  from sp_besuche " .$where 
." Union Select ifnull(sum(schiff),0) as Wert, 'Schiffsfahrkarte' as schiff  from sp_besuche " .$where 
." Union Select ifnull(sum(sonstige),0) as Wert, 'Sprit (anteilig)' as spirt_anteilig  from sp_besuche " .$where 
." Union Select ifnull(sum(eintrittskarte),0) as Wert, 'Eintrittskarte' as eintrittskarte  from sp_besuche " .$where  ;

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
	
	if($rs->fields{'Titel'} == 'Sprit (Eigenanteil)'){
	$value{$i}{"color"} = '#DFFFDF';}
	else if ($rs->fields{'Titel'} == 'Bahn'){$value{$i}{"color"} = '#FFDFFF';}
	else if ($rs->fields{'Titel'} == 'Flieger'){$value{$i}{"color"} = '#00ACAC';}
	else if ($rs->fields{'Titel'} == 'Übernachtung'){$value{$i}{"color"} = '#AE5EFF';}
	else if ($rs->fields{'Titel'} == 'Speis und Trank'){$value{$i}{"color"} = '#DCCC5F';}
	else if ($rs->fields{'Titel'} == 'Sonstige'){$value{$i}{"color"} = '#DE7D61';}
	else if ($rs->fields{'Titel'} == 'Handy'){$value{$i}{"color"} = '#DF2D61';}
	else if ($rs->fields{'Titel'} == 'Taxi'){$value{$i}{"color"} = '#DE3D53';}
	else if ($rs->fields{'Titel'} == 'Eintrittskarte'){$value{$i}{"color"} = '#8080FF';}
	else if ($rs->fields{'Titel'} == 'Sprit (anteilig)'){$value{$i}{"color"} = '#FF5C26';}
	else if ($rs->fields{'Titel'} == 'Schiffsfahrkarte'){$value{$i}{"color"} = '#00B386';}
	else if ($rs->fields{'Titel'} == 'Souvenir/Devotionalien'){$value{$i}{"color"} = '#BFFF00';}
   
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
