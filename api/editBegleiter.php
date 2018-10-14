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


if (isset($_REQUEST["begleiter_id"])) {
    $begleiter_id = $_REQUEST["begleiter_id"];
    if ($begleiter_id != "null" && $begleiter_id != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($begleiter_id))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('begleiter_id' => "Bitte die Begleiter-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('begleiter_id' => "Begleiter-ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('begleiter_id' => "Begleiter-ID fehlt!");

    print json_encode($out);

    return;
}


if (isset($_REQUEST["name"])) {
    $name = $_REQUEST["name"];
    if ($name != "null" && $name != "") {
        if (strlen($name) > 264 || strlen($name) < 1) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('name' => "Bitte einen Schiedsrichter-Namen mit max. 264 Zeichen eingeben.");

            print json_encode($out);

            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('name' => "Schiedsrichter-Name fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('name' => "Schiedsrichter-Name fehlt!");

    print json_encode($out);

    return;
}

if (isset($_REQUEST["spitzname"])) {
    $spitzname = $_REQUEST["spitzname"];
    if ($spitzname != "null" && $spitzname != "") {
        if (strlen($spitzname) > 264 ) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('spitzname' => "Bitte einen Spitzname mit max. 264 Zeichen eingeben.");

            print json_encode($out);

            return;
        }
    }else {
        $spitzname = null;
    } 
}else {
    $spitzname = null;
}


if (isset($_REQUEST["geb_datum"])) {
    $geb_datum = $_REQUEST["geb_datum"];
    if ($geb_datum != "null" && $geb_datum != "") {
        if ((preg_match("/^[0-9-]{10}?$/", trim($geb_datum))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('geb_datum' => "Bitte den Geburtstag prüfen");

            print json_encode($out);
            return;
        }
    } else {
        $geb_datum = '1900-01-01';
    }
} else {
    $geb_datum = '1900-01-01';
}


$sqlQuery = "call editBegleiter("
        . $dbSyb->Quote(($begleiter_id)) .
        ", " . $dbSyb->quote(iconv("UTF-8", "CP1252//IGNORE",$name));
        // ", " . $dbSyb->quote(($land));
if ($spitzname == null) {
    $sqlQuery .= " ,NULL ";
} else {
    $sqlQuery .= ", " . $dbSyb->quote(iconv("UTF-8", "CP1252//IGNORE",$spitzname));
}		
if ($geb_datum == null) {
    $sqlQuery .= " ,NULL);";
} else {
    $sqlQuery .= ", " . $dbSyb->quote($geb_datum).");";
}



// file_put_contents("editBegleiter.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);

$value = array();

if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('begleiter_id' => ($dbSyb->ErrorMsg()));

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

    }
	else if($rs->fields{'ergebnis'} == 0){
		$out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('begleiter_id' => "Es wurden keine Änderungen vorgenommen. Entweder gab es keine Änderungen oder es ist ein Fehler aufgetreten. </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;}
	
	else{
	$out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('begleiter_id' => "Update konnte nicht durchgeführt werden. </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
	}
} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('begleiter_id' => "Keine Ergebnis-Rückmeldung erhalten </br>" . ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}


?>
