<?php
session_start();

require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');
header("Cache-Control: no-cache, must-revalidate");
$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");






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
$out = array();



if (isset($_REQUEST["spiel_id"])) {
    $spiel_id = $_REQUEST["spiel_id"];
    if ($spiel_id != "null" && $spiel_id != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($spiel_id))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('spiel_id' => "Bitte die Spiel-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('spiel_id' => "Spiel-ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('spiel_id' => "Spiel-ID fehlt!");

    print json_encode($out);

    return;
}

    $querySQL = "SELECT "
		. " verkehrsmittel_zus "	
		. ", verkehrsmittel "	
		. ", entfernung_km "
        . "  From mobil "
		. "  Where spiel_id = ". $spiel_id
		. " order by lfd_nr";


// $fp = fopen("anreiseDaten.txt", "w"); 
// fputs($fp, $querySQL);             
// fclose($fp); 


$rs = $dbSyb->Execute($querySQL);



$data = array();

if (!$rs) {
  
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => "Es ist ein Fehler aufgetreten.\n". $dbSyb->ErrorMsg());

    print json_encode($out);
    return;
}

else {

    $i = 0;
	$ii = 1;

    while (!$rs->EOF) { 
		$data{$i}{"verkehrsmittel_zus"} = ($rs->fields{'verkehrsmittel_zus'});	
		$data{$i}{"verkehrsmittel"} = ($rs->fields{'verkehrsmittel'});
		$data{$i}{"entfernung_km"} = $rs->fields{'entfernung_km'};
		$data{$i}{"nr"} = $ii;	
        
        $i++;
		$ii++;

        $rs->MoveNext();
    }

    $rs->Close();


    $out{'response'}{'status'} = 0;
    $out{'response'}{'errors'} = array();
    $out{'response'}{'data'} = $data;

    print json_encode($out);
}

?>