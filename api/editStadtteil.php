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
    $out{'response'}{'errors'} = array('ort' => ($dbSyb->ErrorMsg()));

    print json_encode($out);

    return;
}

$dbSyb->debug = false;


if (isset($_REQUEST["stadtteil_id"])) {
    $stadtteil_id = $_REQUEST["stadtteil_id"];
    if ($stadtteil_id != "null" && $stadtteil_id != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($stadtteil_id))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('stadtteil_id' => "Bitte die Stadtteil-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('stadtteil_id' => "Stadtteil-ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('stadtteil_id' => "Stadtteil-ID fehlt!");

    print json_encode($out);

    return;
}

if (isset($_REQUEST["stadtteil"])) {
    $stadtteil = $_REQUEST["stadtteil"];
    if ($stadtteil != "null" && $stadtteil != "") {
        if (strlen($stadtteil) > 200 || strlen($stadtteil) < 1) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('stadtteil' => "Bitte einen Stadtteil mit max. 200 Zeichen eingeben.");

            print json_encode($out);

            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('stadtteil' => "Stadtteil fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('stadtteil' => "Stadtteil fehlt!");

    print json_encode($out);

    return;
}

if (isset($_REQUEST["ort"])) {
    $ort = $_REQUEST["ort"];
    if ($ort != "null" && $ort != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($ort))) == 0) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('ort_id' => "Sie haben einen ungültigen Ort eingeben. Bitte prüfen.");

            print json_encode($out);

            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('ort_id' => "Ort fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('ort_id' => "Ort fehlt!");

    print json_encode($out);

    return;
}



$sqlQuery = "call editStadtteil("
		. $stadtteil_id .
        ", " . $dbSyb->Quote(($stadtteil)) .
        ", " . $ort.");";


// file_put_contents("addStadion.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);

$value = array();

if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('ort' => ($dbSyb->ErrorMsg()));

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
        $out{'response'}{'errors'} = array('ort' => "Es wurden keine Änderungen vorgenommen. Entweder gab es keine Änderungen oder es ist ein Fehler aufgetreten. </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
		}	
	else{
	$out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('ort' => "Update konnte nicht durchgeführt werden. </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
	}
} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('ort' => "Keine Ergebnis-Rückmeldung erhalten </br>" . ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}




