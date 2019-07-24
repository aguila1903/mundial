<?php
session_start();

require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');
header("Cache-Control: no-cache, must-revalidate");






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

 $data = array();
if (!$dbSyb->IsConnected()) {
    print ("Anmeldung: " . $dbSyb->ErrorMsg());

    return ($data);
}

$dbSyb->debug = false;
$out = array();


if (isset($_REQUEST["spieler_id"])) {  
    $spieler_id = $_REQUEST["spieler_id"];
	if ((preg_match("/^[0-9]{1,11}$/", trim($spieler_id))) == 0) {
         print("Bitte die spieler_id prüfen!");

    return($data);
    }
}else{
    print("spieler_id fehlt!");

    return;
}

if (isset($_REQUEST["spiel_id"])) {  
    $spiel_id = $_REQUEST["spiel_id"];
	if ((preg_match("/^[0-9]{1,11}$/", trim($spiel_id))) == 0) {
         print("Bitte die spiel_id prüfen!");
	return;
    
    }
}else{
    print("spiel_id fehlt!");

    return;
}


if (isset($_REQUEST["spielstand"])) {  
    $spielstand = $_REQUEST["spielstand"];
	
	if ((preg_match("/^[0-9:]{3,5}$/", trim($spielstand))) == 0) {
         
		 $out{'response'}{'status'} = -1;
		$out{'response'}{'errors'} = array('errors' => "Spielstand fehlt!");

    print json_encode($out);

    return;
    }
}else{
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => "Spielstand fehlt!");

    print json_encode($out);

    return;
}

if (isset($_REQUEST["team"])) {  
    $team = $_REQUEST["team"];
	
	if ((preg_match("/^[ah]{1}$/", trim($team))) == 0) {
         
		 $out{'response'}{'status'} = -1;
		$out{'response'}{'errors'} = array('errors' => "Angabe über Heim oder Gast-Mannschaft fehlt!");

    print json_encode($out);

    return;
    }
}else{
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => "Angabe über Heim oder Gast-Mannschaft fehlt!");

    print json_encode($out);

    return;
}

if (isset($_REQUEST["elfer"])) {  
    $elfer = $_REQUEST["elfer"];
	
	if ((preg_match("/^[1-2]{1}$/", trim($elfer))) == 0) {
         
		 $out{'response'}{'status'} = -1;
		$out{'response'}{'errors'} = array('errors' => "Elfer fehlt!");

    print json_encode($out);

    return;
    }
}else{
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => "Elfer fehlt!");

    print json_encode($out);

    return;
}



$querySQL = "call spieleToreAdd_Elfer ("
        .  $spiel_id
        . ", ".  $spieler_id
		. ", ".  $dbSyb->Quote($spielstand)	
		. ", ".  $elfer
		. ", ".  $dbSyb->Quote($team). ");";
		
	
// file_put_contents("spielTore_Add_Elfer.txt",$querySQL);
$rs = $dbSyb->Execute($querySQL); 


$value = array();

if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}

If (isset($rs->fields{'ergebnis'})) {
    if ($rs->fields{'ergebnis'} != 1 && $rs->fields{'ergebnis'} != 0) {
        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('errors' => "Es gab ein Problem beim Speichern in die Datenbank! </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
    }
} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => "Keine Ergebnis-Rückmeldung erhalten </br>" . ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}


$i = 0;

while (!$rs->EOF) {

   
    $value{$i}{"ergebnis"} = $rs->fields{'ergebnis'};

    $i++;

    // den n?chsten Datensatz lesen
    $rs->MoveNext();
}

$rs->Close();

$out{'response'}{'status'} = 0;
$out{'response'}{'errors'} = array();
$out{'response'}{'data'} = $value;

print json_encode($out);


?>