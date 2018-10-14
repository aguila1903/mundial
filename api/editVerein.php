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


if (isset($_REQUEST["verein_id"])) {
    $verein_id = $_REQUEST["verein_id"];
    if ($verein_id != "null" && $verein_id != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($verein_id))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('verein_id' => "Bitte die Verein-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('verein_id' => "Verein-ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('verein_id' => "Verein-ID fehlt!");

    print json_encode($out);

    return;
}


if (isset($_REQUEST["vereinsname"])) {
    $vereinsname = $_REQUEST["vereinsname"];
    if ($vereinsname != "null" && $vereinsname != "") {
        if (strlen($vereinsname) > 264 || strlen($vereinsname) < 1) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('vereinsname' => "Bitte einen Verein-Namen mit max. 264 Zeichen eingeben.");

            print json_encode($out);

            return;
        }
    } else {
        $vereinsname = "";
    }
} else {
    $vereinsname = "";
}

if (isset($_REQUEST["gaengiger_name"])) {
    $gaengiger_name = $_REQUEST["gaengiger_name"];
    if ($gaengiger_name != "null" && $gaengiger_name != "") {
        if (strlen($gaengiger_name) > 264 || strlen($gaengiger_name) < 1) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('gaengiger_name' => "Bitte einen Vereinsnamen mit max. 264 Zeichen eingeben.");

            print json_encode($out);

            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('gaengiger_name' => "Vereinsname fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('gaengiger_name' => "Vereinsname fehlt!");

    print json_encode($out);

    return;
}

if (isset($_REQUEST["spitzname"])) {
    $spitzname = $_REQUEST["spitzname"];
    if ($spitzname != "null" && $spitzname != "") {
        if (strlen($spitzname) > 264) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('spitzname' => "Bitte einen Spitznamen-Namen darf 264 Zeichen nicht überschreiten.");

            print json_encode($out);

            return;
        }
    } else {
        $spitzname = null;
    }
} else {
   $spitzname = null;
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


if (isset($_REQUEST["gr_datum"])) {
    $gr_datum = $_REQUEST["gr_datum"];
    if ($gr_datum != "null" && $gr_datum != "") {
        if ((preg_match("/^[0-9-]{10}?$/", trim($gr_datum))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('gr_datum' => "Bitte das Gründungsdatum prüfen");

            print json_encode($out);
            return;
        }
    } else {
        $gr_datum = '1900-01-01';
    }
} else {
    $gr_datum = '1900-01-01';
}

// if (isset($_REQUEST["liga_id"])) {
    // $liga_id = $_REQUEST["liga_id"];
    // if ($liga_id != "null" && $liga_id != "") {
        // if ((preg_match("/^[0-9]{1,6}?$/", trim($liga_id))) == 0) {

            // $out{'response'}{'status'} = -4;
            // $out{'response'}{'errors'} = array('liga_id' => "Bitte die Liga prüfen");

            // print json_encode($out);
            // return;
        // }
    // } else {
        // $liga_id = null;
    // }
// } else {
    // $liga_id = null;
// }


if (isset($_REQUEST["historie"])) {
    if ($_REQUEST["historie"] != "null" && $_REQUEST["historie"] != "") {
        $historie = $_REQUEST["historie"];
    } else {
        $historie = null;
    }
} else {
    $historie = null;
}

if (isset($_REQUEST["stadtteil"])) {
    $stadtteil = $_REQUEST["stadtteil"];
    if ($stadtteil != "null" && $stadtteil != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($ort))) == 0) {
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



$sqlQuery = "call editVerein("
        . $dbSyb->Quote(($verein_id)) .
        ", " . $dbSyb->quote(iconv("UTF-8", "CP1252//IGNORE",$vereinsname)) .
		", " . $dbSyb->quote(iconv("UTF-8", "CP1252//IGNORE",$gaengiger_name)) .
        ", " . $dbSyb->quote(($ort)) .
        ", " . $dbSyb->quote(($land));
if ($gr_datum == null) {
    $sqlQuery .= " ,NULL ";
} else {
    $sqlQuery .= ", " . $dbSyb->quote($gr_datum);
}
// if ($liga_id == null) {
    // $sqlQuery .= " ,NULL ";
// } else {
    // $sqlQuery .= ", " . $liga_id;
// }
if ($historie == null) {
    $sqlQuery .= " ,NULL ";
} else {
    $sqlQuery .= ", " . $dbSyb->quote(iconv("UTF-8", "CP1252//IGNORE", $historie));
}
if ($spitzname == null) {
    $sqlQuery .= " ,NULL ";
} else {
    $sqlQuery .= ", " . $dbSyb->quote(iconv("UTF-8", "CP1252//IGNORE", $spitzname));
}
if ($stadtteil == null) {
    $sqlQuery .= " ,NULL );";
} else {
    $sqlQuery .= ", " . $stadtteil.")";
}

// file_put_contents("editVerein.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);

$value = array();

if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('verein_id' => ($dbSyb->ErrorMsg()));

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
        $out{'response'}{'errors'} = array('verein_id' => "Es wurden keine Änderungen vorgenommen. Entweder gab es keine Änderungen oder es ist ein Fehler aufgetreten. </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;}
	else if($rs->fields{'ergebnis'} == 99){$out{'response'}{'errors'} = array('verein_id' => "Das von Ihnen eingegebene Land ist ungültig. Bitte prüfen Sie es erneut </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;}
	else{
	$out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('verein_id' => "Update konnte nicht durchgeführt werden. </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
	}
} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('verein_id' => "Keine Ergebnis-Rückmeldung erhalten </br>" . ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}


?>
