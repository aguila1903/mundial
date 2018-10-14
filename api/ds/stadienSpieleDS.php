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
$dbSyb->Connect('localhost', user, psw, db); //=>>> Verbindungsaufbau mit der DB


if (!$dbSyb->IsConnected()) {


    print ("Anmeldung: " . $dbSyb->ErrorMsg());

    $data = array();

    return ($data);
}

$dbSyb->debug = false;
// Toplevel


// $Where = " Where stadion_id > 0 ";
// $Where = " Where land != 'nb' ";


    if (isset($_REQUEST["land"])) {
	$land = $_REQUEST["land"];
	if ($land == "null" || $land == "" ) {
            $andLand = "";
        }
		else{        
        
		$andLand = " and l.code = ". $dbSyb->Quote(($land));}
    }  	
	else {
       $andLand = "";
    }

    if (isset($_REQUEST["ort"])) {
        $ort = $_REQUEST["ort"];
        if ($ort == "null" || $ort == "") {
            $andOrt = "";
        }else{		
        $andOrt = " and s.ort = " . $dbSyb->Quote(($ort));
		}
    }
 else {
    $andOrt = "";
}



if(isset($_REQUEST["freieSuche"])){
    $freieSuche = $_REQUEST["freieSuche"];
    $Where = " where stadionname like ". $dbSyb->Quote(("%".$freieSuche."%"));
}else {
    $Where =  " where stadion_id > -1 ";
}

$sqlQuery = "Select 
stadion_id as lfd_nr, 
stadionname, 
s.ort as ort_id, o.ort as ort,
Ifnull(de,land) as land, l.code,
kapazitaet,anschrift
from stadionliste s left join laender l on land = l.code 
left join orte o on s.ort = ort_id  
left join stadtteile st on s.stadtteil = st.stadtteil_id "
. $Where
. $andLand
. $andOrt
. " order by s.stadionname, s.ort;";


// file_put_contents('stadienSpieleDS.txt', $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);


if (!$rs) {
    print $dbSyb->ErrorMsg() . "\n";
    return;
}
$i = 0;

$value = array();

while (!$rs->EOF) {

    $value{$i}{"stadion_id"} = $rs->fields{'lfd_nr'};
	$value{$i}{"ort_id"} = $rs->fields{'ort_id'};
    $value{$i}{"stadionname"} = ($rs->fields{'stadionname'});
    $value{$i}{"ort"} = ($rs->fields{'ort'});
    $value{$i}{"land"} = ($rs->fields{'land'});
    $value{$i}{"code"} = $rs->fields{'code'};
	$value{$i}{"kapazitaet"} = $rs->fields{'kapazitaet'};
	$value{$i}{"anschrift"} = ($rs->fields{'anschrift'});
	
	  
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
