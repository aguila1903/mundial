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
$dbSyb->Connect('localhost', user, psw, db); //=>>> Verbindungsaufbau mit der DB


$out = array();

if (!$dbSyb->IsConnected()) {

    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('stadionname' => ($dbSyb->ErrorMsg()));

    print json_encode($out);

    return;
}

$dbSyb->debug = false;


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



$sqlQuery = "call addStadion("
        . $dbSyb->Quote(($stadionname)) .
        ", " . $dbSyb->quote(($ort)).
        ", " . $dbSyb->quote(($land));
		if($bundesland == null){
			$sqlQuery .= ", NULL);";
		}else{
		$sqlQuery .= ", " . $dbSyb->quote(($bundesland)).");";
		}


// file_put_contents("addStadion.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);

$value = array();

if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('stadionname' => ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}

If (isset($rs->fields{'ergebnis'})) {
    if ($rs->fields{'ergebnis'} == 1) {
       $i = 0;

while (!$rs->EOF) {

    $value{$i}{"lfd_nr"} = $rs->fields{'stadion_id'};
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
	else if($rs->fields{'ergebnis'} == -99){
	$out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('stadionname' => "Das von Ihnen eingegebene Land ist ungültig. Bitte prüfen Sie es erneut </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
	}
	else{
	 $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('stadionname' => "Es gab ein Problem beim Speichern in die Datenbank! </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
	}
} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('stadionname' => "Keine Ergebnis-Rückmeldung erhalten </br>" . ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}




