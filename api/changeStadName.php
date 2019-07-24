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

if (isset($_REQUEST["name_vor_ae"])) {
    $name_vor_ae = $_REQUEST["name_vor_ae"];
    if ($name_vor_ae != "null" && $name_vor_ae != "") {
        if (strlen($name_vor_ae) > 200 || strlen($name_vor_ae) < 1) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('name_vor_ae' => "Bitte einen Stadion-Namen mit max. 200 Zeichen eingeben.");

            print json_encode($out);

            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('name_vor_ae' => "Stadion-Name fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('name_vor_ae' => "Stadion-Name fehlt!");

    print json_encode($out);

    return;
}

if (isset($_REQUEST["von_jahr"])) {
    $von_jahr = $_REQUEST["von_jahr"];
    if ($von_jahr != "null" && $von_jahr != "") {
        if ((preg_match("/^[0-9]{4}?$/", trim($von_jahr))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('von_jahr' => "Sie haben kein gültiges Jahr eingegeben");

            print json_encode($out);
            return;
        }
        
        $tag_ = 1;
        $monat_ = 1;
        $jahr_ = $von_jahr;

        $isdate = checkdate($monat_, $tag_, $jahr_);

        if (!$isdate) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('von_jahr' => "Sie haben kein gültiges Jahr eingegeben");

            print json_encode($out);
            return;
        }
        
    } else {
        $von_jahr = null;
    }
} else {
    $von_jahr = null;
}


if (isset($_REQUEST["bis_jahr"])) {
    $bis_jahr = $_REQUEST["bis_jahr"];
    if ($bis_jahr != "null" && $bis_jahr != "") {
        if ((preg_match("/^[0-9]{4}?$/", trim($bis_jahr))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('bis_jahr' => "Sie haben kein gültiges Jahr eingegeben");

            print json_encode($out);
            return;
        }
        
        $tag_ = 1;
        $monat_ = 1;
        $jahr_ = $bis_jahr;

        $isdate = checkdate($monat_, $tag_, $jahr_);

        if (!$isdate) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('bis_jahr' => "Sie haben kein gültiges Jahr eingegeben");

            print json_encode($out);
            return;
        }
        
    } else {
        $bis_jahr = null;
    }
} else {
    $bis_jahr = null;
}

if($bis_jahr < $von_jahr){
$out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('bis_jahr' => "Das Von-Jahr darf nicht größer als das Bis-Jahr sein. Bitte überprüfen Sie noch einmal Ihre Eingaben.");

            print json_encode($out);
            return;
}


$sqlQuery = "call changeStadName("
        . $dbSyb->Quote(($stadion_id)) .
        ", " . $dbSyb->Quote(($stadionname)) .
        ", " . $dbSyb->quote(($name_vor_ae));
if ($von_jahr == null) {
    $sqlQuery .= " ,NULL);";
} else {
    $sqlQuery .= ", " . $dbSyb->quote(($von_jahr));
}
if ($bis_jahr == null) {
    $sqlQuery .= " ,NULL);";
} else {
    $sqlQuery .= ", " . $dbSyb->quote(($bis_jahr)) . ");";
}


// file_put_contents("changeStadName.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);

$value = array();

if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('lfd_nr' => ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}

If (isset($rs->fields{'ergebnis'})) {
    if ($rs->fields{'ergebnis'} < 1 ) {
        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('lfd_nr' => "Es wurden keine Änderungen vorgenommen. Entweder gab es keine Änderungen oder es ist ein Fehler aufgetreten. </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
    }
} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('lfd_nr' => "Keine Ergebnis-Rückmeldung erhalten </br>" . ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}


If (isset($rs->fields{'ergebnis2'})) {
    if ($rs->fields{'ergebnis2'} < 1 ) {
        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('lfd_nr' => "Es wurden keine Änderungen beim Stadionnamen vorgenommen. Entweder gab es keine Änderungen oder es ist ein Fehler aufgetreten. </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
    }
} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('lfd_nr' => "Keine Ergebnis-Rückmeldung für den Stadionnamen-Update erhalten </br>" . ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}

$i = 0;

while (!$rs->EOF) {

    $value{$i}{"ergebnis2"} = $rs->fields{'ergebnis2'};
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

