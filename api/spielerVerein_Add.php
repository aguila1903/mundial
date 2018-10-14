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
$dbSyb->Connect('localhost', user, psw, db); //=>>> Verbindungsaufbau mit der DB

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

    return($data);
}

if (isset($_REQUEST["verein_id"])) {  
    $verein_id = $_REQUEST["verein_id"];
	if ((preg_match("/^[0-9]{1,11}$/", trim($verein_id))) == 0) {
         print("Bitte die verein_id prüfen!");

    return($data);
    }
}else{
    print("verein_id fehlt!");

    return($data);
}



$querySQL = "call spielerVereinAdd ("
        .  $verein_id
        . ", ".  $spieler_id
		. ", '' );"
;
// file_put_contents("stadionVereine_Add.txt",$querySQL);
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