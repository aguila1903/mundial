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
    $out{'response'}{'errors'} = array('routenpunkt1' => ($dbSyb->ErrorMsg()));

    print json_encode($out);

    return;
}

$dbSyb->debug = false;


if (isset($_REQUEST["spiel_id"])) {
    $spiel_id = $_REQUEST["spiel_id"];
    if ($spiel_id != "null" && $spiel_id != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($spiel_id))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('spiel_id' => "Bitte die Spiel-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('spiel_id' => "Spiel-ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('spiel_id' => "Spiel-ID fehlt!");

    print json_encode($out);

    return;
}

if (isset($_REQUEST["routenpunkt1"])) {
    $routenpunkt1 = $_REQUEST["routenpunkt1"];
    if ($routenpunkt1 != "null" && $routenpunkt1 != "") {
        if (strlen($routenpunkt1) > 250 || strlen($routenpunkt1) < 1) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('routenpunkt1' => "Bitte eine Start-Position mit max. 250 Zeichen eingeben.");

            print json_encode($out);

            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('routenpunkt1' => "Start-Position fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('routenpunkt1' => "Start-Position fehlt!");

    print json_encode($out);

    return;
}

if (isset($_REQUEST["routenpunkt2"])) {
    $routenpunkt2 = $_REQUEST["routenpunkt2"];
    if ($routenpunkt2 != "null" && $routenpunkt2 != "") {
        if (strlen($routenpunkt2) > 250 || strlen($routenpunkt2) < 1) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('routenpunkt2' => "Bitte eine Ziel-Position mit max. 250 Zeichen eingeben.");

            print json_encode($out);

            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('routenpunkt2' => "Ziel-Position fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('routenpunkt2' => "Ziel-Position fehlt!");

    print json_encode($out);

    return;
}



if (isset($_REQUEST["ort_id1"])) {
    $ort_id1 = $_REQUEST["ort_id1"];
    if ($ort_id1 != "null" && $ort_id1 != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($ort_id1))) == 0) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('ort_id1' => "Sie haben einen ungültigen Ort für die Start-Position eingeben. Bitte prüfen.");

            print json_encode($out);

            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('ort_id1' => "Ort der Start-Position fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('ort_id1' => "Ort der Start-Position fehlt!");

    print json_encode($out);

    return;
}

if (isset($_REQUEST["ort_id2"])) {
    $ort_id2 = $_REQUEST["ort_id2"];
    if ($ort_id2 != "null" && $ort_id2 != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($ort_id2))) == 0) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('ort_id2' => "Sie haben einen ungültigen Ort für die Ziel-Position eingeben. Bitte prüfen.");

            print json_encode($out);

            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('ort_id2' => "Ort der Ziel-Position fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('ort_id2' => "Ort der Ziel-Position fehlt!");

    print json_encode($out);

    return;
}

if (isset($_REQUEST["land1"])) {
    $land1 = $_REQUEST["land1"];
    if ($land1 != "null" && $land1 != "") {
        if (strlen($land1) > 2 || strlen($land1) < 2) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('land1' => "Sie haben ein ungültiges Land für die Start-Position eingegeben. Bitte prüfen!");

            print json_encode($out);

            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('land1' => "Land für die Start-Position fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('land1' => "Land für die Start-Position fehlt!");

    print json_encode($out);

    return;
}


if (isset($_REQUEST["land2"])) {
    $land2 = $_REQUEST["land2"];
    if ($land2 != "null" && $land2 != "") {
        if (strlen($land2) > 2 || strlen($land2) < 2) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('land2' => "Sie haben ein ungültiges Land für die Ziel-Position eingegeben. Bitte prüfen!");

            print json_encode($out);

            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('land2' => "Land für die Ziel-Position fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('land2' => "Land für die Ziel-Position fehlt!");

    print json_encode($out);

    return;
}


if (isset($_REQUEST["land2"])) {
    $land2 = $_REQUEST["land2"];
    if ($land2 != "null" && $land2 != "") {
        if (strlen($land2) > 2 || strlen($land2) < 2) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('land2' => "Sie haben ein ungültiges Land für die Ziel-Position eingegeben. Bitte prüfen!");

            print json_encode($out);

            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('land2' => "Land für die Ziel-Position fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('land2' => "Land für die Ziel-Position fehlt!");

    print json_encode($out);

    return;
}

if (isset($_REQUEST["entfernung_km"])) {
    $entfernung_km = str_replace(".", "", $_REQUEST["entfernung_km"]);
    if ($entfernung_km != "null" && $entfernung_km != "") {
        if ((preg_match("/^[0-9,]{1,13}?$/", trim($entfernung_km))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('entfernung_km' => "Bitte die Entfernung prüfen.");

            print json_encode($out);
            return;
        }
    } else {
        $entfernung_km = 0;
    }
} else {
    $entfernung_km = 0;
}

if (isset($_REQUEST["verkehrsmittel"])) {
    $verkehrsmittel = $_REQUEST["verkehrsmittel"];
    if ($verkehrsmittel != "null" && $verkehrsmittel != "") {
        if (strlen($verkehrsmittel) > 200 ) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('verkehrsmittel' => "Bitte ein Verkehrsmittel mit max. 200 Zeichen eingeben.");

            print json_encode($out);

            return;
        }
    } else {
       $verkehrsmittel = null;
    }
} else {
   $verkehrsmittel = null;
}

if (isset($_REQUEST["verkehrsmittel_zus"])) {
    $verkehrsmittel_zus = $_REQUEST["verkehrsmittel_zus"];
    if ($verkehrsmittel_zus != "null" && $verkehrsmittel_zus != "") {
        if (strlen($verkehrsmittel_zus) > 200 ) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('verkehrsmittel_zus' => "Bitte ein Verkehrsmittel-Zusatz mit max. 200 Zeichen eingeben.");

            print json_encode($out);

            return;
        }
    } else {
       $verkehrsmittel_zus = null;
    }
} else {
   $verkehrsmittel_zus = null;
}

if (isset($_REQUEST["map_lnk"])) {
    $map_lnk = str_replace("\"", "'", $_REQUEST["map_lnk"]);
	$map_lnk = str_replace("width='600'", "width='100%'", $map_lnk);
	$map_lnk = str_replace("height='450'", "height='100%'", $map_lnk);
	
 } else {
   $map_lnk = null;
}


$sqlQuery = "call addRoute("
        . $spiel_id .
        ", " . $dbSyb->quote(($routenpunkt1)).
		", " . $dbSyb->quote(($routenpunkt2)).
		", " . $dbSyb->quote(($ort_id1)).
		", " . $dbSyb->quote(($ort_id2)).
		", " . $dbSyb->quote(($land1)).
		", " . $dbSyb->quote(($land2)).
        ", " . str_replace(",",".",$entfernung_km);
		if($verkehrsmittel == null){
			$sqlQuery .= ", NULL";
		}else{
		$sqlQuery .= ", " . $dbSyb->quote(($verkehrsmittel));
		}
		if($verkehrsmittel_zus == null){
			$sqlQuery .= ", NULL";
		}
                else{
		$sqlQuery .= ", " . $dbSyb->quote(($verkehrsmittel_zus));
		}
		if($map_lnk == null){
			$sqlQuery .= ", NULL);";
		}else{
		$sqlQuery .= ", " . $dbSyb->quote(($map_lnk)).");";
		}


// file_put_contents("addRoute.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);

$value = array();

if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('routenpunkt1' => ($dbSyb->ErrorMsg()));

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
 }
	else if($rs->fields{'ergebnis'} != 1){
		
	 $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('routenpunkt1' => "Es gab ein Problem beim Speichern in die Datenbank! </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
	return;
}

} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('routenpunkt1' => "Keine Ergebnis-Rückmeldung erhalten </br>" . ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}




