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
    $out{'response'}{'errors'} = array('ort' => ($dbSyb->ErrorMsg()));

    print json_encode($out);

    return;
}

$dbSyb->debug = false;


if (isset($_REQUEST["liga_id"])) {
    $liga_id = $_REQUEST["liga_id"];
    if ($liga_id != "null" && $liga_id != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($liga_id))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('liga_id' => "Bitte die Wettbewerb-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('liga_id' => "Wettbewerb-ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('liga_id' => "Wettbewerb-ID fehlt!");

    print json_encode($out);

    return;
}

if (isset($_REQUEST["liga_bez"])) {
    $liga_bez = $_REQUEST["liga_bez"];
    if ($liga_bez != "null" && $liga_bez != "") {
        if (strlen($liga_bez) > 264 || strlen($liga_bez) < 1) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('liga_bez' => "Bitte einen Wettbewerb mit max. 264 Zeichen eingeben.");

            print json_encode($out);

            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('liga_bez' => "Wettbewerb fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('liga_bez' => "Wettbewerb fehlt!");

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

if (isset($_REQUEST["zusatz"])) {
    $zusatz = $_REQUEST["zusatz"];
    if ($zusatz != "null" && $zusatz != "") {
        if (strlen($zusatz) > 100 ) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('zusatz' => "Bitte eine Zusatz-Bezeichnung mit max. 100 Zeichen eingeben.");

            print json_encode($out);

            return;
        }
    } else {
        $zusatz = null;
    }
} else {
    $zusatz = null;
}
		
		$sqlQuery = "call editWettbewerb("
		. $liga_id .
        ", " . $dbSyb->Quote(($liga_bez)) .
        ", " . $dbSyb->Quote(($land));
			if($zusatz == null){
		$sqlQuery .= " ,NULL);";
		}
else{	$sqlQuery .=  ", " . $dbSyb->Quote(($zusatz)).");";}


// file_put_contents("editWettbewerb.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);

$value = array();

if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('liga_id' => ($dbSyb->ErrorMsg()));

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
        $out{'response'}{'errors'} = array('liga_id' => "Es wurden keine Änderungen vorgenommen. Entweder gab es keine Änderungen oder es ist ein Fehler aufgetreten. </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
		}	
	else{
	$out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('liga_id' => "Update konnte nicht durchgeführt werden. </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
	}
} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('liga_id' => "Keine Ergebnis-Rückmeldung erhalten </br>" . ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}




