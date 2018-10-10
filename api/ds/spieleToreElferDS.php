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
$out = array();


if (isset($_REQUEST["spiel_id"])) {
    $spiel_id = $_REQUEST["spiel_id"];
	$Where = " Where sp.spiel_id = ". $spiel_id. " and elfer in (1,2)";
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
        . "	 sp.lfd_nr "
        . ", sp.spiel_id "
		. ", sp.spieler_id_h "	
		. ", sp.spieler_id_a "
		. ", sp.elfer "
		// . ", s.name as spieler_h"
		. ", concat(ifnull(s.vorname,''),' ',s.name) as spieler_h "		
		. ", concat(ifnull(ss.vorname,''),' ',ss.name) as spieler_a "		
		// . ", ss.name as spieler_a "
		. ", sp.sp_minute "	
        . ", sp.besonderheit "
        . ", sp.team "
        . ", sp.spielstand "		
        . "  From sp_tore_spiel_tabelle sp Left join spieler s on sp.spieler_id_h = s.spieler_id	" 
		. "  Left join spieler ss on sp.spieler_id_a = ss.spieler_id	" 		
			 . $Where

        . "     order by sp.lfd_nr ";


// $fp = fopen("spieleToredDS.txt", "w"); 
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
	
	if(trim($rs->fields{'team'}) == 'h'){ 
		
		$data{$i}{"spielstand"} = trim($rs->fields{'spielstand'}). "  ". ($rs->fields{'spieler_h'});
	}
	
	if(trim($rs->fields{'team'}) == 'a'){ 
		
		$data{$i}{"spielstand_a"} = trim($rs->fields{'spielstand'}). "  ". ($rs->fields{'spieler_a'});
	}
		$data{$i}{"lfd_nr"} = trim($rs->fields{'lfd_nr'});
        $data{$i}{"spiel_id"} = trim($rs->fields{'spiel_id'});
		$data{$i}{"team"} = trim($rs->fields{'team'});
		$data{$i}{"elfer"} = trim($rs->fields{'elfer'});
		        
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