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
    $out{'response'}{'errors'} = array('vereinsname' => ($dbSyb->ErrorMsg()));

    print json_encode($out);

    return;
}

$dbSyb->debug = false;


if (isset($_REQUEST["vereinsname"])) {
    $vereinsname = $_REQUEST["vereinsname"];
    if ($vereinsname != "null" && $vereinsname != "") {
        if (strlen($vereinsname) > 264) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('vereinsname' => "Bitte einen Vereinsnamen mit max. 264 Zeichen eingeben.");

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


if (isset($_REQUEST["ort"])) {
    $ort = $_REQUEST["ort"];
    if ($ort != "null" && $ort != "") {
        if (strlen($ort) > 64 || strlen($ort) < 1) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('ort' => "Bitte einen Ort mit max. 64 Zeichen eingeben.");

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
        if (strlen($land) > 64 || strlen($land) < 1) {
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



$sqlQuery = "call addVerein("
			 . $dbSyb->quote(iconv("UTF-8", "CP1252//IGNORE",$vereinsname)) .
		", " . $dbSyb->quote(iconv("UTF-8", "CP1252//IGNORE",$gaengiger_name)) .
        ", " . $dbSyb->Quote(($ort)).
        ", " . $dbSyb->Quote(($land)).");";


// file_put_contents("addStadion.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);

$value = array();

if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('vereinsname' => ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}

If (isset($rs->fields{'ergebnis'})) {
    if ($rs->fields{'ergebnis'} == 1) {
        $i = 0;

while (!$rs->EOF) {

    $value{$i}{"verein_id"} = $rs->fields{'verein_id'};
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
        $out{'response'}{'errors'} = array('vereinsname' => "Es wurden keine Änderungen vorgenommen. Entweder gab es keine Änderungen oder es ist ein Fehler aufgetreten. </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;}
	else if($rs->fields{'ergebnis'} == 99){
	$out{'response'}{'errors'} = array('vereinsname' => "Das von Ihnen eingegebene Land ist ungültig. Bitte prüfen Sie es erneut </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;}
		
	else{$out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('vereinsname' => "Es gab ein Problem beim Speichern in die Datenbank! </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;}
} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('vereinsname' => "Keine Ergebnis-Rückmeldung erhalten </br>" . ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}




