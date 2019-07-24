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


if (isset($_REQUEST["spiel_id"])) {
    $spiel_id = $_REQUEST["spiel_id"];
	$Where = " Where v.spiel_id = ". $spiel_id;
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


if (isset($_REQUEST["status"])) {  
    $status = $_REQUEST["status"];
	 $Where .= " and v.status = " . $dbSyb->Quote($status);
	
	if ((preg_match("/^[a-z]{2}$/", trim($status))) == 0) {
         
		 $out{'response'}{'status'} = -1;
		$out{'response'}{'errors'} = array('errors' => "Status fehlt!");

    print json_encode($out);

    return;
    }
}else{
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => "Status fehlt!");

    print json_encode($out);

    return;
}

if (isset($_REQUEST["status2"])) {  
    $status2 = $_REQUEST["status2"];
	 $Where .= " and v.status2 = " . $dbSyb->Quote($status2);
	
	if ((preg_match("/^[ah]{1}$/", trim($status2))) == 0) {
         
		 $out{'response'}{'status'} = -1;
		$out{'response'}{'errors'} = array('errors' => "Status2 fehlt!");

    print json_encode($out);

    return;
    }
}else{
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => "Status2 fehlt!");

    print json_encode($out);

    return;
}

    $querySQL = "SELECT Distinct "         
        . "	 v.lfd_nr "
        . ", v.spiel_id "
		. ", v.spieler_id "	
		. ", concat(ifnull(s.vorname,''),' ',s.name) as name "	
		. ", s.trikot_nr "
		. ", v.aw "
		. ", v.aw_minute "
        . "  From sp_spieler_spiel_tabelle v Left join spieler s on v.spieler_id = s.spieler_id	"           
			 . $Where

        . "     order by v.aw_minute, v.lfd_nr";


// $fp = fopen("spielerSpielAddDS.txt", "w"); 
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
		$data{$i}{"trikot_nr"} = trim($rs->fields{'trikot_nr'});
		$data{$i}{"lfd_nr"} = trim($rs->fields{'lfd_nr'});
        $data{$i}{"aw"} = trim($rs->fields{'aw'});
		$data{$i}{"spiel_id"} = trim($rs->fields{'spiel_id'});
		$data{$i}{"aw_minute"} = trim($rs->fields{'aw_minute'});
		$data{$i}{"spieler_id"} = trim($rs->fields{'spieler_id'});	
		
		if(trim($rs->fields{'aw_minute'}) > 0){
			$data{$i}{"name"} = ($rs->fields{'name'}). " (".trim($rs->fields{'aw_minute'}).".)";
		}else{
			$data{$i}{"name"} = ($rs->fields{'name'});
		}
		        
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