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


if (isset($_REQUEST["stadion_id"])) {
    $stadion_id = $_REQUEST["stadion_id"];
    if ($stadion_id != "null" && $stadion_id != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($stadion_id))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('lfd_nr' => "Bitte die Stadion-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('lfd_nr' => "Stadion-ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('lfd_nr' => "Stadion-ID fehlt!");

    print json_encode($out);

    return;
}


if (isset($_REQUEST["stadionname"])) {
    $stadionname = $_REQUEST["stadionname"];
    if ($stadionname != "null" && $stadionname != "") {
        if (strlen($stadionname) > 200 || strlen($stadionname) < 1) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('stadionname' => "Bitte einen Stadion-Namen mit max. 200 Zeichen eingeben.");

            print json_encode($out);

            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('stadionname' => "Stadion-Name fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('stadionname' => "Stadion-Name fehlt!");

    print json_encode($out);

    return;
}


if (isset($_REQUEST["ort"])) {
    $ort = $_REQUEST["ort"];
    if ($ort != "null" && $ort != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($ort))) == 0) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('ort' => "Sie haben einen ungültigen Ort eingeben. Bitte prüfen.");

            print json_encode($out);

            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('ort' => "Ort fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('ort' => "Ort fehlt!");

    print json_encode($out);

    return;
}

if (isset($_REQUEST["stadtteil"])) {
    $stadtteil = $_REQUEST["stadtteil"];
    if ($stadtteil != "null" && $stadtteil != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($stadtteil))) == 0) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('stadtteil' => "Bitte den Stadtteil prüfen");

            print json_encode($out);

            return;
        }
    } else {
        $stadtteil = null;
    }
} else {
    $stadtteil = null;
}

if (isset($_REQUEST["land"])) {
    $land = $_REQUEST["land"];
    if ($land != "null" && $land != "") {
        if (strlen($land) > 2 || strlen($land) < 2) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('land' => "Sie haben ein ungültiges Land eingegeben. Bitte prüfen!");

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


if (isset($_REQUEST["kapazitaet"])) {
    $kapazitaet = $_REQUEST["kapazitaet"];
    if ($kapazitaet != "null" && $kapazitaet != "") {
        if ((preg_match("/^[0-9]{1,6}?$/", trim($kapazitaet))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('kapazitaet' => "Bitte die Kapzität prüfen");

            print json_encode($out);
            return;
        }
    } else {
        $kapazitaet = 0;
    }
} else {
    $kapazitaet = 0;
}

if (isset($_REQUEST["gr_nr"])) {
    $gr_nr = $_REQUEST["gr_nr"];
    if ($gr_nr != "null" && $gr_nr != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($gr_nr))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('gr_nr' => "Bitte die Ground-Nr. prüfen");

            print json_encode($out);
            return;
        }
    } else {
        $gr_nr = 0;
    }
} else {
    $gr_nr = 0;
}
if (isset($_REQUEST["laenderpunkt_nr"])) {
    $laenderpunkt_nr = $_REQUEST["laenderpunkt_nr"];
    if ($laenderpunkt_nr != "null" && $laenderpunkt_nr != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($laenderpunkt_nr))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('laenderpunkt_nr' => "Bitte den Länderpunkt prüfen");

            print json_encode($out);
            return;
        }
    } else {
        $laenderpunkt_nr = 0;
    }
} else {
    $laenderpunkt_nr = 0;
}

if (isset($_REQUEST["zusch_rek"])) {
    $zusch_rek = $_REQUEST["zusch_rek"];
    if ($zusch_rek != "null" && $zusch_rek != "") {
        if ((preg_match("/^[0-9]{1,6}?$/", trim($zusch_rek))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('zusch_rek' => "Bitte den Zuschauer-Rekord prüfen");

            print json_encode($out);
            return;
        }
    } else {
        $zusch_rek = 0;
    }
} else {
    $zusch_rek = 0;
}


if (isset($_REQUEST["anschrift"])) {
    $anschrift = $_REQUEST["anschrift"];
    if ($anschrift != "null" && $anschrift != "") {
        if (strlen($anschrift) > 200 || strlen($anschrift) < 1) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('anschrift' => "Bitte eine Anschrift mit max. 200 Zeichen eingeben.");

            print json_encode($out);

            return;
        }
    } else {
        $anschrift = null;
    }
} else {
    $anschrift = null;
}

if (isset($_REQUEST["historie"])) {
    if ($_REQUEST["historie"] != "null" && $_REQUEST["historie"] != "") {
        $historie = $_REQUEST["historie"];
    } else {
        $historie = null;
    }
} else {
    $historie = null;
}

if (isset($_REQUEST["er_jahr"])) {
    $er_jahr = $_REQUEST["er_jahr"];
    if ($er_jahr != "null" && $er_jahr != "") {
        if ((preg_match("/^[0-9]{4}?$/", trim($er_jahr))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('er_jahr' => "Sie haben kein gültiges Jahr eingegeben");

            print json_encode($out);
            return;
        }
        
        $tag_ = 1;
        $monat_ = 1;
        $jahr_ = $er_jahr;

        $isdate = checkdate($monat_, $tag_, $jahr_);

        if (!$isdate) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('er_jahr' => "Sie haben kein gültiges Jahr eingegeben");

            print json_encode($out);
            return;
        }
        
    } else {
        $er_jahr = null;
    }
} else {
    $er_jahr = null;
}

if (isset($_REQUEST["abriss"])) {
    $abriss = $_REQUEST["abriss"];
    if ($abriss != "null" && $abriss != "") {
        if ((preg_match("/^[0-1]{1}?$/", trim($abriss))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('abriss' => "Bitte prüfen Sie hier noch einmal Ihre Eingaben");

            print json_encode($out);
            return;
        }
    } else {
        $abriss = 0;
    }
} else {
    $abriss = 0;
}


if (isset($_REQUEST["bundesland"])) {
    $bundesland = $_REQUEST["bundesland"];
    if ($bundesland != "null" && $bundesland != "") {
        if (strlen($bundesland) > 2 || strlen($bundesland) < 1) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('bundesland' => "Sie haben ein ungültiges Bundesland eingegeben. Bitte prüfen!");

            print json_encode($out);

            return;
        }
    } else {
        $bundesland = null;
    }
} else {
    $bundesland = null;
}

if (isset($_REQUEST["erstbesuch"])) {
    $erstbesuch = $_REQUEST["erstbesuch"];
    if ($erstbesuch != "null" && $erstbesuch != "") {
        if ((preg_match("/^[0-9-]{10}?$/", trim($erstbesuch))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('erstbesuch' => "Bitte den Erstbesuchstag prüfen");

            print json_encode($out);
            return;
        }
    } else {
        $erstbesuch = '1900-01-01';
    }
} else {
    $erstbesuch = '1900-01-01';
}


$sqlQuery = "call editStadion("
        . $dbSyb->Quote(($stadion_id)) .
        ", " . $dbSyb->Quote(($stadionname)) .
        ", " . $dbSyb->Quote(($ort)) .
        ", " . $dbSyb->Quote(($land)) .
        ", " . $laenderpunkt_nr .
        ", " . $dbSyb->Quote($erstbesuch);
if ($stadtteil == null) {
    $sqlQuery .= " ,NULL ";
} else {
    $sqlQuery .= ", " . $stadtteil;
}
if ($anschrift == null) {
    $sqlQuery .= " ,NULL ";
} else {
    $sqlQuery .= ", " . $dbSyb->Quote(($anschrift));
}
$sqlQuery .= ", " . $kapazitaet .
        ", " . $zusch_rek;

if ($historie == null) {
    $sqlQuery .= " ,NULL ";
} else {
    $sqlQuery .= ", " . $dbSyb->Quote($historie);
}
if ($er_jahr == null) {
    $sqlQuery .= " ,NULL ";
} else {
    $sqlQuery .= ", " . $dbSyb->Quote(($er_jahr));
}
    $sqlQuery .= ", " . $abriss .
                 ", " . $gr_nr ;
		if($bundesland == null){
			$sqlQuery .= ", NULL);";
		}else{
		$sqlQuery .= ", " . $dbSyb->quote(($bundesland)).");";
		}



// file_put_contents("editStadion.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);

$value = array();

if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('lfd_nr' => ($dbSyb->ErrorMsg()));

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

    }else if($rs->fields{'ergebnis'} == 0){$out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('lfd_nr' => "Es wurden keine Änderungen vorgenommen. Entweder gab es keine Änderungen oder es ist ein Fehler aufgetreten. </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;}
	else if($rs->fields{'ergebnis'} == 99){$out{'response'}{'errors'} = array('stadionname' => "Das von Ihnen eingegebene Land ist ungültig. Bitte prüfen Sie es erneut </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;}
	else{
	$out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('stadionname' => "Update konnte nicht durchgeführt werden. </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
	}
} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('lfd_nr' => "Keine Ergebnis-Rückmeldung erhalten </br>" . ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}



