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
$dbSyb->Connect('localhost', user, psw, db); //=>>> Verbindungsaufbau mit der DB


$out = array();

if (!$dbSyb->IsConnected()) {

    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('stadionname' => ($dbSyb->ErrorMsg()));

    print json_encode($out);

    return;
}

$dbSyb->debug = false;


if (isset($_REQUEST["trainer_id"])) {
    $trainer_id = $_REQUEST["trainer_id"];
    if ($trainer_id != "null" && $trainer_id != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($trainer_id))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('trainer_id' => "Bitte die Trainer-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('trainer_id' => "Trainer-ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('trainer_id' => "Trainer-ID fehlt!");

    print json_encode($out);

    return;
}


if (isset($_REQUEST["name"])) {
    $name = $_REQUEST["name"];
    if ($name != "null" && $name != "") {
        if (strlen($name) > 264 || strlen($name) < 1) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('name' => "Bitte einen Spielernamen mit max. 264 Zeichen eingeben.");

            print json_encode($out);

            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('name' => "Spielername fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('name' => "Spielername fehlt!");

    print json_encode($out);

    return;
}

if (isset($_REQUEST["land"])) {
    $land = $_REQUEST["land"];
    if ($land != "null" && $land != "") {
        if (strlen($land) > 2 || strlen($land) < 1) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('land' => "Bitte ein Land bestehend aus 2 Zeichen eingeben.");

            print json_encode($out);

            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('land' => "Land fehlt!");

    print json_encode($out);

    return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('land' => "Land fehlt!");

    print json_encode($out);

    return;
}


if (isset($_REQUEST["geb_datum"])) {
    $geb_datum = $_REQUEST["geb_datum"];
    if ($geb_datum != "null" && $geb_datum != "") {
        if ((preg_match("/^[0-9-]{10}?$/", trim($geb_datum))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('geb_datum' => "Bitte den Geburtstag prüfen");

            print json_encode($out);
            return;
        }
    } else {
        $geb_datum = '1900-01-01';
    }
} else {
    $geb_datum = '1900-01-01';
}


$sqlQuery = "call editTrainer("
        . $dbSyb->Quote(($trainer_id)) .
        ", " . $dbSyb->quote($name) .
        ", " . $dbSyb->quote(($land));
if ($geb_datum == null) {
    $sqlQuery .= " ,NULL);";
} else {
    $sqlQuery .= ", " . $dbSyb->quote($geb_datum).");";
}



// file_put_contents("editSpieler.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);

$value = array();

if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('trainer_id' => ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}

If (isset($rs->fields{'ergebnis'})) {
    if ($rs->fields{'ergebnis'} == 1 ) {
        $i = 0;

while (!$rs->EOF) {

    $value{$i}{"ergebnis"} = $rs->fields{'ergebnis'};

    $i++;

    // den n�chsten Datensatz lesen
    $rs->MoveNext();
}

$rs->Close();

$out{'response'}{'status'} = 0;
$out{'response'}{'errors'} = array();
$out{'response'}{'data'} = $value;

print json_encode($out);

    }
	else if($rs->fields{'ergebnis'} == 0){
		$out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('trainer_id' => "Es wurden keine Änderungen vorgenommen. Entweder gab es keine Änderungen oder es ist ein Fehler aufgetreten. </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;}
	else if($rs->fields{'ergebnis'} == 99){$out{'response'}{'errors'} = array('trainer_id' => "Das von Ihnen eingegebene Land ist ungültig. Bitte prüfen Sie es erneut </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;}
		else if($rs->fields{'ergebnis'} == 98){$out{'response'}{'errors'} = array('trikot_nr' => "Diese Trikot-Nr ist in der Mannschaft bereits vergeben.</br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;}
	else{
	$out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('trainer_id' => "Update konnte nicht durchgeführt werden. </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
	}
} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('trainer_id' => "Keine Ergebnis-Rückmeldung erhalten </br>" . ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}


?>
