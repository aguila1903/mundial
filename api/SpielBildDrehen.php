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


if (isset($_REQUEST["id"])) {
    $id = $_REQUEST["id"];
    if ($id != "null" && $id != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($id))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('errors' => "Bitte die Spiele-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('errors' => "Spiele-ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => "Spiele-ID fehlt!");

    print json_encode($out);

    return;
}


if (isset($_REQUEST["media_id"])) {
    $media_id = $_REQUEST["media_id"];
    if ($media_id != "null" && $media_id != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($media_id))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('errors' => "Bitte die Media-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('errors' => "Media-ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => "Media-ID fehlt!");

    print json_encode($out);

    return;
}

if (isset($_REQUEST["dateiname"])) {
    $dateiname = $_REQUEST["dateiname"];
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => "Dateiname fehlt!");

    print json_encode($out);

    return;
}


// Begin Rotation
//Pfad des zu drehenden Bildes Thumbnail
$thumbFile = 'images/media/thumbnails/' . ($dateiname);
$thumb_info = pathinfo($thumbFile);
//Pfad und neuer Name des gedrehten Bildes Thumbnail
$thumbFileR = ($thumb_info['dirname'] ."/".$thumb_info['filename']."_r.".$thumb_info['extension']);

//Pfad des zu drehenden Bildes PDF
$PDFFile = 'images/media/pdf/' . ($dateiname);
$PDF_info = pathinfo($PDFFile);
//Pfad und neuer Name des gedrehten Bildes PDF
$PDFFileR = ($PDF_info['dirname'] ."/".$PDF_info['filename']."_r.".$PDF_info['extension']);


//Bilder werden verschoben
rename(($thumbFile), ($thumbFileR));
rename(($PDFFile),  ($PDFFileR));

//Alte Bilder werden aus der Datenbank entfernt
$sqlQuery = "call deleteStadBild(" . $id . ", " . $media_id . ");";

$rs = $dbSyb->Execute($sqlQuery);

if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}

If (isset($rs->fields{'ergebnis'})) {
    if ($rs->fields{'ergebnis'} != 1) {
        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('errors' => "Das gewählte Bild konnte nicht gelöscht werden! </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
    }
} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => "Keine Ergebnis-Rückmeldung erhalten. Löschvorgang evtl. nicht erfolgreich. </br>" . ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}

$rs->Close();

//Längen und Breiten der Bilder werden ausgelesen
list($width, $height, $type, $attr) = getimagesize($PDFFileR);
list($widthTh, $heightTh, $typeTh, $attrTh) = getimagesize($thumbFileR);


//Der Grad der Drehung
$degrees = 90;


$source = imagecreatefromjpeg($PDFFileR);
$sourceTh = imagecreatefromjpeg($thumbFileR);

// Rotate
$rotate = imagerotate($source, $degrees, 0);
$rotateTh = imagerotate($sourceTh, $degrees, 0);

// Output
if (imagejpeg($rotate, $PDFFileR, 100)) {
    imagejpeg($rotateTh, $thumbFileR, 100);


    // Free the memory
    imagedestroy($source);
    imagedestroy($rotate);
    imagedestroy($sourceTh);
    imagedestroy($rotateTh);
} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => "Fehler bei der Rotation. </br>");

    // Free the memory
    imagedestroy($source);
    imagedestroy($rotate);

    print json_encode($out);

    return;
}

$querySQL = " insert into media (ref, dateiname, id, art) Values(" . $dbSyb->Quote('sb')
        . ", " . $dbSyb->Quote(($PDF_info['filename']."_r.".$PDF_info['extension']))
        . ", " . $id
        . ", " . $dbSyb->Quote('ga') . ")";

$rs = $dbSyb->Execute($querySQL);

$value = array();

if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}
$out{'response'}{'status'} = 0;
$out{'response'}{'errors'} = array();
$out{'response'}{'data'} = $value;

print json_encode($out);
?>



