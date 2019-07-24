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

if (isset($_REQUEST["auswahl"])){
    $auswahl = $_REQUEST["auswahl"];
    if($auswahl == "G"){
        $where = "";
    }else{
        $where = " where year(sp_datum) = " . $jahr;
    }
}
else {    
$where = "";
}

if (isset($_REQUEST["kostenPunkt"])){
    $kostenPunkt = $_REQUEST["kostenPunkt"];    
}
else {    
$kostenPunkt = "alle";
}

$lookFor = " sum(ifnull(sprit_anteilig,0)+ifnull(schiff,0)+ifnull(taxi,0)+ifnull(handy,0)+ifnull(souvenir,0)+ifnull(sprit,0)+ifnull(bahn,0)+ifnull(flieger,0)+ifnull(uebernachtung,0)+ifnull(verpflegung,0)+ifnull(sonstige,0)+ifnull(eintrittskarte,0)) as gesamtkosten ";

if($kostenPunkt == "sprit"){ 
$lookFor = "sum(ifnull(sprit,0)) as gesamtkosten ";
}
else if($kostenPunkt == "verpflegung"){ 
$lookFor = "sum(ifnull(verpflegung,0)) as gesamtkosten ";
}
else if($kostenPunkt == "uebernachtung"){ 
$lookFor = "sum(ifnull(uebernachtung,0)) as gesamtkosten ";
}
else if($kostenPunkt == "bahn"){ 
$lookFor = "sum(ifnull(bahn,0)) as gesamtkosten ";
}
else if($kostenPunkt == "flieger"){ 
$lookFor = "sum(ifnull(flieger,0)) as gesamtkosten ";
}
else if($kostenPunkt == "eintrittskarte"){ 
$lookFor = "sum(ifnull(eintrittskarte,0)) as gesamtkosten ";
}
else if($kostenPunkt == "sonstige"){ 
$lookFor = "sum(ifnull(sonstige,0)) as gesamtkosten ";
}
else if($kostenPunkt == "schiff"){ 
$lookFor = "sum(ifnull(schiff,0)) as gesamtkosten ";
}
else if($kostenPunkt == "souvenir"){ 
$lookFor = "sum(ifnull(souvenir,0)) as gesamtkosten ";
}
else if($kostenPunkt == "sprit_anteilig"){ 
$lookFor = "sum(ifnull(sprit_anteilig,0)) as gesamtkosten ";
}
else if($kostenPunkt == "taxi"){ 
$lookFor = "sum(ifnull(taxi,0)) as gesamtkosten ";
}
else if($kostenPunkt == "handy"){ 
$lookFor = "sum(ifnull(handy,0)) as gesamtkosten ";
}

$sqlQuery = "select 
case when month(sp_datum) = 1 Then 'Januar' 
 when month(sp_datum) = 2 Then 'Februar'
 when month(sp_datum) = 3 Then 'März'
 when month(sp_datum) = 4 Then 'April'
 when month(sp_datum) = 5 Then 'Mai'
 when month(sp_datum) = 6 Then 'Juni'
 when month(sp_datum) = 7 Then 'Juli'
 when month(sp_datum) = 8 Then 'August'
 when month(sp_datum) = 9 Then 'September'
 when month(sp_datum) = 10 Then 'Oktober'
 when month(sp_datum) = 11 Then 'November'
 when month(sp_datum) = 12 Then 'Dezember' end
as monat, "
. $lookFor
. ", substring(year(sp_datum),3) as jahr_ "
. ", year(sp_datum) as jahr "
. " from sp_besuche " .$where
."  group by monat, jahr_, jahr "
. " order by sp_datum desc"
;
// file_put_contents("kostenGrafik.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);


if (!$rs) {
    print $dbSyb->ErrorMsg() . "\n";
    return;
}
$i = 0;

$value = array();

while (!$rs->EOF) {

   
    $value{$i}{"gesamtkosten"} = $rs->fields{'gesamtkosten'};
	$value{$i}{"monat"} = $rs->fields{'monat'}." ".$rs->fields{'jahr_'};
	$value{$i}{"jahr"} = $rs->fields{'jahr'};
   
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
