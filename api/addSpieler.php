<?php



session_start();

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
    $out{'response'}{'errors'} = array('name' => ($dbSyb->ErrorMsg()));

    print json_encode($out);

    return;
}

$dbSyb->debug = false;


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

if (isset($_REQUEST["vorname"])) {
    $vorname = $_REQUEST["vorname"];
    if ($vorname != "null" && $vorname != "") {
        if (strlen($vorname) > 264 || strlen($vorname) < 1) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('vorname' => "Bitte einen Vornamen mit max. 264 Zeichen eingeben.");

            print json_encode($out);

            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('vorname' => "Vornamen fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('vorname' => "Vornamen fehlt!");

    print json_encode($out);

    return;
}


// if (isset($_REQUEST["verein_id"])) {
    // $verein_id = $_REQUEST["verein_id"];
    // if ($verein_id != "null" && $verein_id != "") {
        // if ((preg_match("/^[0-9]{1,11}?$/", trim($verein_id))) == 0) {

            // $out{'response'}{'status'} = -4;
            // $out{'response'}{'errors'} = array('verein_id' => "Bitte die Verein-ID prüfen!");

            // print json_encode($out);
            // return;
        // }
    // } else {
        // $out{'response'}{'status'} = -1;
        // $out{'response'}{'errors'} = array('verein_id' => "Verein-ID fehlt!");

        // print json_encode($out);

        // return;
    // }
// } else {
    // $out{'response'}{'status'} = -1;
    // $out{'response'}{'errors'} = array('verein_id' => "Verein-ID fehlt!");

    // print json_encode($out);

    // return;
// }

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



$sqlQuery = "call addSpieler("
        . $dbSyb->Quote($name) .
        ", " . $dbSyb->Quote($vorname) .
        ", " . $dbSyb->Quote($land).");";


// file_put_contents("addStadion.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);

$value = array();

if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('name' => ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}

If (isset($rs->fields{'ergebnis'})) {
    if ($rs->fields{'ergebnis'} == 1) {
        $i = 0;

while (!$rs->EOF) {

    $value{$i}{"spieler_id"} = $rs->fields{'spieler_id'};
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
    }else if($rs->fields{'ergebnis'} == 0){
	$out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('name' => "Es wurden keine Änderungen vorgenommen. Entweder gab es keine Änderungen oder es ist ein Fehler aufgetreten. </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;}
	else if($rs->fields{'ergebnis'} == 99){
	$out{'response'}{'errors'} = array('name' => "Das von Ihnen eingegebene Land ist ungültig. Bitte prüfen Sie es erneut </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;}
		
	else{$out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('name' => "Es gab ein Problem beim Speichern in die Datenbank! </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;}
} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('name' => "Keine Ergebnis-Rückmeldung erhalten </br>" . ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}




