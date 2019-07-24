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
$out = array();


// $Where = " Where land != 'nb' ";


if (isset($_REQUEST["spiel_id"])) {
    $spiel_id = $_REQUEST["spiel_id"];
	$Where = " Where v.spieler_id not in (select vs.spieler_id from sp_spieler_spiel_tabelle vs where vs.spiel_id = ". $spiel_id.") ";
    if ($spiel_id != "null" && $spiel_id != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($spiel_id))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('errors' => "Bitte die Spiel-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('errors' => "Spiel-ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => "Spiel-ID fehlt!");

    print json_encode($out);

    return;
}


    $querySQL = "SELECT Distinct "         
        . "	 v.spieler_id "
        . ", concat(ifnull(v.vorname,''),' ',v.name) as name "		
		. ", DATE_FORMAT(v.geb_datum,GET_FORMAT(DATE,'EUR')) as geb_datum "
        . "  From spieler v	"           
			 . $Where

        . "     order by v.name";


// $fp = fopen("spielerSpielQuellListe.txt", "w"); 
// fputs($fp, $querySQL);             
// fclose($fp); 


$rs = $dbSyb->Execute($querySQL);



$data = array();

if (!$rs) {
  
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => "Es ist ein Fehler aufgetreten.");

    print json_encode($out);
    return;
}

else {

    $i = 0;

    while (!$rs->EOF) { 
        $data{$i}{"spieler_id"} = trim($rs->fields{'spieler_id'});
		$data{$i}{"geb_datum"} = trim($rs->fields{'geb_datum'});
		$data{$i}{"name"} = ($rs->fields{'name'});
		        
        $i++;

        $rs->MoveNext();
    }

    $rs->Close();


    $out{'response'}{'status'} = 0;
    $out{'response'}{'errors'} = array();
    $out{'response'}{'data'} = $data;

    print json_encode($out);
}
} else {
    header("Location: http://$host/mundial/noadmin.php");
}
?>