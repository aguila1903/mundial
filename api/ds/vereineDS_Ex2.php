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


// $Where = " Where land != 'nb' ";


if (isset($_REQUEST["spieler_id"])) {
    $spieler_id = $_REQUEST["spieler_id"];
	$Where = " Where v.verein_id not in (select vs.verein_id from verein_spieler_tabelle vs where spieler_id = ". $spieler_id ." and vs.aktuell = 0)";
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
        . "	 v.verein_id "
        . ", v.vereinsname "		
        . "  From vereine v	"           
			 . $Where

        . "     order by v.vereinsname";


$fp = fopen("vereineDS_Ex2.txt", "w"); 
fputs($fp, $querySQL);             
fclose($fp); 


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