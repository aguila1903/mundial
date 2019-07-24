<?php




require_once('adodb5/adodb.inc.php');

$ADODB_CACHE_DIR = 'C:/php/cache';
require_once('db_psw.php');


$ADODB_FETCH_MODE = ADODB_FETCH_ASSOC; // Liefert ein assoziatives Array, das der geholten Zeile entspricht 

$ADODB_COUNTRECS = true;

$dbSyb = ADONewConnection("mysqli");

// DB-Abfragen NICHT cachen
$dbSyb->memCache = false;
$dbSyb->memCacheHost = array('localhost'); /// $db->memCacheHost = $ip1; will work too
$dbSyb->memCacheCompress = false; /// Use 'true' arbeitet unter Windows nicht
//$dsn = "'localhost','root',psw,'vitaldb'";
$dbSyb->Connect(link, user, psw, db); //=>>> Verbindungsaufbau mit der DB


$out = array();

if (!$dbSyb->IsConnected()) {

    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('stadionname' => ($dbSyb->ErrorMsg()));

    print json_encode($out);

    return;
}

$dbSyb->debug = false;


if (isset($_REQUEST["spiel_id_akt"])) {
    $spiel_id_akt = $_REQUEST["spiel_id_akt"];
    if ($spiel_id_akt != "null" && $spiel_id_akt != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($spiel_id_akt))) == 0) {

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

if (isset($_REQUEST["spiel_id_11"])) {
    $spiel_id_11 = $_REQUEST["spiel_id_11"];
    if ($spiel_id_11 != "null" && $spiel_id_11 != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($spiel_id_11))) == 0) {

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

if (isset($_REQUEST["team"])) {  
    $team = $_REQUEST["team"];
	
	if ((preg_match("/^[ah]{1}$/", trim($team))) == 0) {
         
		 $out{'response'}{'team'} = -1;
		$out{'response'}{'errors'} = array('errors' => "Team fehlt!");

    print json_encode($out);

    return;
    }
}else{
    $out{'response'}{'team'} = -1;
    $out{'response'}{'errors'} = array('errors' => "Team fehlt!");

    print json_encode($out);

    return;
}

$sqlQuery = "call set11("
        . $spiel_id_11 
        . ", " . $spiel_id_akt .
		", " . $dbSyb->Quote($status) .
		", " . $dbSyb->Quote($status2) .
		", " . $dbSyb->Quote($team)
		.");";
 
	

// file_put_contents("set11.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);

$value = array();

if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}

If (isset($rs->fields{'ergebnis'})) {
    if ($rs->fields{'ergebnis'} != 11 && $rs->fields{'ergebnis'} != 0) {
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
