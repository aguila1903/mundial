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


if (isset($_REQUEST["spieler_id"])) {
    $spieler_id = $_REQUEST["spieler_id"];
    if ($spieler_id != "null" && $spieler_id != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($spieler_id))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('spieler_id' => "Bitte die Spieler-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('spieler_id' => "Spieler-ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('spieler_id' => "Spieler-ID fehlt!");

    print json_encode($out);

    return;
}

// if (isset($_REQUEST["verein_id"])) {
// $verein_id = $_REQUEST["verein_id"];
// if ($verein_id != "null" && $verein_id != "") {
// if ((preg_match("/^[0-9]{1,11}?$/", trim($verein_id))) == 0) {
// $out{'response'}{'status'} = -4;
// $out{'response'}{'errors'} = array('spieler_id' => "Bitte die Verein-ID prüfen!");
// print json_encode($out);
// return;
// }
// } else {
// $out{'response'}{'status'} = -1;
// $out{'response'}{'errors'} = array('spieler_id' => "Verein-ID fehlt!");
// print json_encode($out);
// return;
// }
// } else {
// $out{'response'}{'status'} = -1;
// $out{'response'}{'errors'} = array('spieler_id' => "Verein-ID fehlt!");
// print json_encode($out);
// return;
// }

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

if (isset($_REQUEST["position"])) {
    $position = $_REQUEST["position"];
    if ($position != "null" && $position != "") {
        if (strlen($position) > 2) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('position' => "Bitte die Position prüfen!");

            print json_encode($out);

            return;
        }
    } else {
        $position = null;
    }
} else {
    $position = null;
}

if (isset($_REQUEST["trikot_nr"])) {
    $trikot_nr = $_REQUEST["trikot_nr"];
    if ($trikot_nr != "null" && $trikot_nr != "") {
        if ((preg_match("/^[0-9]{0,3}?$/", trim($trikot_nr))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('trikot_nr' => "Bitte Rücken-Nr prüfen");

            print json_encode($out);
            return;
        }
    } else {
        $trikot_nr = null;
    }
} else {
    $trikot_nr = null;
}


if (isset($_REQUEST["nati_spieler"])) {
    $nati_spieler = $_REQUEST["nati_spieler"];
    if ($nati_spieler != "null" && $nati_spieler != "") {
        if ((preg_match("/^[0-1]{0,1}?$/", trim($nati_spieler))) == 0) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('nati_spieler' => "Bitte die National-Mannschaft prüfen");

            print json_encode($out);

            return;
        }
    } else {
        $nati_spieler = 0;
    }
} else {
    $nati_spieler = 0;
}
if (isset($_REQUEST["status"])) {
    $status = $_REQUEST["status"];
    if ($status != "null" && $status != "") {
        if ((preg_match("/^[0-1]{0,1}?$/", trim($status))) == 0) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('status' => "Bitte den Status prüfen");

            print json_encode($out);

            return;
        }
    } else {
        $status = 0;
    }
} else {
    $status = 0;
}

// if (isset($_REQUEST["status"])) {
// $status = $_REQUEST["status"];
// if ($status != "null" && $status != "") {
// if ((preg_match("/^[0-1]{0,1}?$/", trim($status))) == 0) {
// $out{'response'}{'status'} = -1;
// $out{'response'}{'errors'} = array('status' => "Fehler, bitte Eintrag prüfen!");
// print json_encode($out);
// return;
// }
// } else {
// $status = 0;
// }
// } else {
// $status = 0;
// }



$sqlQuery = "call editSpieler("
        . $dbSyb->Quote(($spieler_id)) .
        ", " . $dbSyb->quote(($name)) .
        ", " . $dbSyb->quote(($vorname)) .
        ", " . $dbSyb->quote(($land));
if ($geb_datum == null) {
    $sqlQuery .= " ,NULL ";
} else {
    $sqlQuery .= ", " . $dbSyb->quote($geb_datum);
}
if ($position == null) {
    $sqlQuery .= " ,NULL ";
} else {
    $sqlQuery .= ", " . $dbSyb->quote($position);
}
if ($trikot_nr == null) {
    $sqlQuery .= " ,NULL ";
} else {
    $sqlQuery .= ", " . $trikot_nr;
}
$sqlQuery .= " ," . $nati_spieler .
        ", " . $status . ");";
// . ", " . $verein_id.");";
// file_put_contents("editSpieler.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);

$value = array();

if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('spieler_id' => ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}

If (isset($rs->fields{'ergebnis'})) {
    if ($rs->fields{'ergebnis'} == 1) {
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
    } else if ($rs->fields{'ergebnis'} == 0) {
        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('spieler_id' => "Es wurden keine Änderungen vorgenommen. Entweder gab es keine Änderungen oder es ist ein Fehler aufgetreten. </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
    } else if ($rs->fields{'ergebnis'} == 99) {
        $out{'response'}{'errors'} = array('spieler_id' => "Das von Ihnen eingegebene Land ist ungültig. Bitte prüfen Sie es erneut </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
    } else if ($rs->fields{'ergebnis'} == 98) {
        $out{'response'}{'errors'} = array('trikot_nr' => "Diese Trikot-Nr ist in der Mannschaft bereits vergeben.</br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
    } else if ($rs->fields{'ergebnis'} == 66) {


        $out{'response'}{'status'} = -66;
        $out{'response'}{'errors'} = array('spieler_id' => "Dieser Spieler ist eventuell schon in der Liste. Wollen Sie dennoch fortfahren?</br>" . ($dbSyb->ErrorMsg()));
        $out{'response'}{'data'} = $value;

        print json_encode($out);
    } else {
        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('spieler_id' => "Update konnte nicht durchgeführt werden. </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
    }
} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('spieler_id' => "Keine Ergebnis-Rückmeldung erhalten </br>" . ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}
?>
