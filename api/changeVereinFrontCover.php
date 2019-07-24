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
    $out{'response'}{'errors'} = array('errors' => ($dbSyb->ErrorMsg()));

    print json_encode($out);

    return;
}

$dbSyb->debug = false;


if (isset($_REQUEST["verein_id"])) {
    $verein_id = $_REQUEST["verein_id"];
    if ($verein_id != "null" && $verein_id != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($verein_id))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('errors' => "Bitte die Verein-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('errors' => "Verein-ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => "Verein-ID fehlt!");

    print json_encode($out);

    return;
}


if (isset($_REQUEST["media_id"])) {
    $media_id = $_REQUEST["media_id"];
    if ($media_id != "null" && $media_id != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($media_id))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('errors' => "Bitte die Verein-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('errors' => "Verein-ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => "Verein-ID fehlt!");

    print json_encode($out);

    return;
}

if (isset($_REQUEST["dateiname"])) {
    $bild_name = ($_REQUEST["dateiname"]);
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => "Dateiname fehlt!");

    print json_encode($out);

    return;
}

$sqlQuery = "call changeVereinFrontCover(" . $verein_id . ", " . $media_id . ");";



// file_put_contents("deleteStadName.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);

$value = array();

if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}

If (isset($rs->fields{'ergebnis'})) {
    if ($rs->fields{'ergebnis'} != 1) {
        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('errors' => "Das gewählte Bild konnte nicht zum Front-Bild geändert werden! </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
    }
} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => "Keine Ergebnis-Rückmeldung erhalten. Änderung evtl. nicht erfolgreich. </br>" . ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}




include("resizer.php");
$target = 'images/media/' . $bild_name; // Der Pfad wo er sich die original Datei hernimmt
//list($wo, $ho) = getimagesize($target);
$new = 'images/media/cover/' . $bild_name; // Pfad für den Thumbnail

$imgInfo = getimagesize($target);
$wo = $imgInfo[0];
$ho = $imgInfo[1];
$type = $imgInfo['mime'];
$new = 'images/media/cover/' . $bild_name; // Pfad für den Thumbnail

switch ($type) {
    case "image/jpeg": $type = "jpg";
        break;
    case "image/jpg": $type = "jpg";
        break;
    case "image/gif": $type = "gif";
        break;
    case "image/png": $type = "png";
        break;
    case "image/bmp": $type = "bmp";
        break;
}


//$ersetzungen = array();
//$ersetzungen[2] = 'gif';
//$ersetzungen[1] = 'png';
//$ersetzungen[0] = 'jpeg';
//
//if (preg_match('/.jpg/i', $bild_name)) {
//    $type = $ersetzungen[0];
//} elseif (preg_match('/.jpeg/i', $bild_name)) {
//    $type = $ersetzungen[0];
//} elseif (preg_match('/.png/i', $bild_name)) {
//    $type = $ersetzungen[1];
//} elseif (preg_match('/.gif/i', $bild_name)) {
//    $type = $ersetzungen[2];
//}

if ($wo < $ho) {
    $w = ($wo / $ho) * 220;
    $h = 220;
} else if ($wo == $ho) {
    $w = 220;
    $h = 220;
} else if ($wo > $ho) {
    $w = 220;
    $h = ($ho / $wo) * 220;
}

resize($target, $new, $w, $h, $type); // Funktion in der reseizer.php wird ausgeführt


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

