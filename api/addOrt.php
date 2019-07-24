<?php

session_start();

require_once('adodb5/adodb.inc.php');

$ADODB_CACHE_DIR = 'C:/php/cache';
require_once('db_psw.php');


$ADODB_FETCH_MODE = ADODB_FETCH_ASSOC; // Liefert ein assoziatives Array, das der geholten Zeile entspricht 

$ADODB_COUNTRECS = true;

$db = ADONewConnection("mysqli");

// DB-Abfragen NICHT cachen
$db->memCache = false;
$db->memCacheHost = array('localhost'); /// $db->memCacheHost = $ip1; will work too
$db->memCacheCompress = false; /// Use 'true' arbeitet unter Windows nicht
//$dsn = "'localhost','root',psw,'vitaldb'";
$db->Connect(link, 'root', psw, db); //=>>> Verbindungsaufbau mit der DB


$out = array();
$value = array();
$bindVariables = array();

if (!$db->IsConnected()) {

    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('ort' => ($db->ErrorMsg()));

    print json_encode($out);

    return;
}

$db->debug = false;


if (isset($_REQUEST["ort"])) {
    $ort = $_REQUEST["ort"];
    $bindVariables[] = ($ort);
    if ($ort != "null" && $ort != "") {
        if (strlen($ort) > 200 || strlen($ort) < 1) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('ort' => "Bitte einen Ort mit max. 200 Zeichen eingeben.");

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
    $out{'response'}{'errors'} = array('ort' => "Orte fehlt!");

    print json_encode($out);

    return;
}


if (isset($_REQUEST["land"])) {
    $land = $_REQUEST["land"];
    $bindVariables[] = $land;
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

$bindVariables[] = $bundesland;


$sqlQuery = $db->prepare("call addOrt(?,?,?);");

// file_put_contents("addOrt.txt", $sqlQuery);

$rs = $db->Execute($sqlQuery, $bindVariables);



if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('ort' => ($db->ErrorMsg()));

    print json_encode($out);
    return;
}

If (isset($rs->fields{'ergebnis'})) {
    if ($rs->fields{'ergebnis'} == 1) {
        $i = 0;

        while (!$rs->EOF) {

            $value{$i}{"ort_id"} = $rs->fields{'ort_id'};
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
    } else if ($rs->fields{'ergebnis'} == -99) {
        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('ort' => "Das von Ihnen eingegebene Land ist ungültig. Bitte prüfen Sie es erneut </br>" . ($db->ErrorMsg()));

        print json_encode($out);
        return;
    } else if ($rs->fields{'ergebnis'} == -98) {
        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('ort' => "Diser Ort wurde bereits einem Stadion zugewiesen. Sie müssen den Ort erst von dem Stadion entfernen bevor Sie es löschen können. </br>" . ($db->ErrorMsg()));

        print json_encode($out);
        return;
    } else if ($rs->fields{'ergebnis'} == -97) {
        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('ort' => "Diser Ort wurde bereits einem Verein zugewiesen. Sie müssen den Ort erst von dem Verein entfernen bevor Sie es löschen können. </br>" . ($db->ErrorMsg()));

        print json_encode($out);
        return;
    } else {
        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('ort' => "Es gab ein Problem beim Speichern in die Datenbank! </br>" . ($db->ErrorMsg()));

        print json_encode($out);
        return;
    }
} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('ort' => "Keine Ergebnis-Rückmeldung erhalten </br>" . ($db->ErrorMsg()));

    print json_encode($out);
    return;
}




