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


if (isset($_REQUEST["schiri_id"])) {
    $schiri_id = $_REQUEST["schiri_id"];
    if ($schiri_id != "null" && $schiri_id != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($schiri_id))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('schiri_id' => "Bitte die Schiri-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('schiri_id' => "Schiri-ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('schiri_id' => "Schiri-ID fehlt!");

    print json_encode($out);

    return;
}


if (isset($_REQUEST["name"])) {
    $name = $_REQUEST["name"];
    if ($name != "null" && $name != "") {
        if (strlen($name) > 264 || strlen($name) < 1) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('name' => "Bitte einen Schiedsrichter-Namen mit max. 264 Zeichen eingeben.");

            print json_encode($out);

            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('name' => "Schiedsrichter-Name fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('name' => "Schiedsrichter-Name fehlt!");

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

if (isset($_REQUEST["ort"])) {
    $ort = $_REQUEST["ort"];
    if ($ort != "null" && $ort != "") {
        if (strlen($ort) > 64 || strlen($ort) < 1) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('ort_id' => "Bitte einen Ort mit max. 64 Zeichen eingeben.");

            print json_encode($out);

            return;
        }
    } else {
        $ort = null;
    }
} else {
    $ort = null;
}


if (isset($_REQUEST["verein"])) {
    $verein = $_REQUEST["verein"];
    if ($verein != "null" && $verein != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($verein))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('verein' => "Bitte die Verein-ID prüfen!");

            print json_encode($out);
            return;
            }
    } else {
        $verein = null;
    }
} else {
    $verein = null;
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
        $geb_datum = null;
    }
} else {
    $geb_datum = null;
}


$sqlQuery = "call editSchiri("
        . $dbSyb->Quote(($schiri_id)) .
        ", " . $dbSyb->quote(iconv("UTF-8", "CP1252//IGNORE",$name)) .
        ", " . $dbSyb->quote(($land));

if ($ort == null) {
    $sqlQuery .= " ,NULL";
} else {
    $sqlQuery .= ", " . $ort;
}

if ($verein == null) {
    $sqlQuery .= " ,NULL";
} else {
    $sqlQuery .= ", " . $verein;
}

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
    $out{'response'}{'errors'} = array('schiri_id' => ($dbSyb->ErrorMsg()));

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
        $out{'response'}{'errors'} = array('schiri_id' => "Es wurden keine Änderungen vorgenommen. Entweder gab es keine Änderungen oder es ist ein Fehler aufgetreten. </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;}
	else if($rs->fields{'ergebnis'} == 99){$out{'response'}{'errors'} = array('schiri_id' => "Das von Ihnen eingegebene Land ist ungültig. Bitte prüfen Sie es erneut </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;}
		else if($rs->fields{'ergebnis'} == 98){$out{'response'}{'errors'} = array('schiri_id' => "Diese Trikot-Nr ist in der Mannschaft bereits vergeben.</br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;}
	else{
	$out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('schiri_id' => "Update konnte nicht durchgeführt werden. </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
	}
} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('schiri_id' => "Keine Ergebnis-Rückmeldung erhalten </br>" . ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}


?>
