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
            $out{'response'}{'errors'} = array('errors' => "Bitte die Stadion-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('errors' => "Stadion-ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => "Stadion-ID fehlt!");

    print json_encode($out);

    return;
}


if (isset($_REQUEST["media_id"])) {
    $media_id = $_REQUEST["media_id"];
    if ($media_id != "null" && $media_id != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($media_id))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('errors' => "Bitte die Stadion-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('errors' => "Stadion-ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => "Stadion-ID fehlt!");

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

$sqlQuery = "call deleteStadBild(". $stadion_id .", ".$media_id. ");";



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
    if ($rs->fields{'ergebnis'} != 1 ) {
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

$mediaFile = 'images/media/' . ($dateiname);


if(file_exists($mediaFile)) {
   unlink($mediaFile );
}

	$thumbFile = 'images/media/thumbnails/' . ($dateiname);
	
	if(file_exists($thumbFile)) {
   unlink($thumbFile);
} 
	
	$coverFile = 'images/media/cover/' . ($dateiname);

if(file_exists($coverFile)) {
   unlink($coverFile);
} 

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

