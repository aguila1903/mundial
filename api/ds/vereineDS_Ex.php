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


if (isset($_REQUEST["spieler_id"])) {
    $spieler_id = $_REQUEST["spieler_id"];
	$Where = " Where aktuell = 0 and vs.spieler_id = ". $spieler_id;
    if ($spieler_id != "null" && $spieler_id != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($spieler_id))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('errors' => "Bitte die Spieler-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('errors' => "Spieler-ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => "Spieler-ID fehlt!");

    print json_encode($out);

    return;
}


    $querySQL = "SELECT Distinct "         
        . "	 vs.lfd_nr "	
        . ", vs.verein_id "
		. ", vs.spieler_id "
        . ", v.vereinsname "		
        . "  From verein_spieler_tabelle vs	
		     left join vereine v on v.verein_id = vs.verein_id "             
			 . $Where

        . "     order by vs.lfd_nr";


// $fp = fopen("vereineDS.txt", "w"); 
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
         $data{$i}{"verein_id"} = trim($rs->fields{'verein_id'});
		$data{$i}{"lfd_nr"} = trim($rs->fields{'lfd_nr'});
		$data{$i}{"spieler_id"} = trim($rs->fields{'spieler_id'});
		$data{$i}{"vereinsname"} = ($rs->fields{'vereinsname'});
		        
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