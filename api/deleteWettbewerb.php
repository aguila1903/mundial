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
    $out{'response'}{'errors'} = array('vereinsname' => ($dbSyb->ErrorMsg()));

    print json_encode($out);

    return;
}

$dbSyb->debug = false;


if (isset($_REQUEST["liga_id"])) {
    $liga_id = $_REQUEST["liga_id"];
    if ($liga_id != "null" && $liga_id != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($liga_id))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('errors' => "Bitte die Wettbewerb-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('errors' => "Wettbewerb-ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => "Wettbewerb-ID fehlt!");

    print json_encode($out);

    return;
}




$sqlQuery = "call deleteWettbewerb(". $liga_id . ");";



// file_put_contents("deleteStadion.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);

$value = array();

if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => ($dbSyb->ErrorMsg()));

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
    }else if($rs->fields{'ergebnis'} == -1) {
        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('errors' => "Der gewählte Wettbewerb wurde bereits einem Spiel zugewiesen.</br> Bitte löschen Sie zuerst das Spiel.</br>" . ($dbSyb->ErrorMsg()));
		$out{'response'}{'data'} = array('ergebnis' =>$rs->fields{'ergebnis'});
        print json_encode($out);
        return;
} else{
        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('errors' => "Der gewählte Wettbewerb konnte nicht gelöscht werden! </br>" . ($dbSyb->ErrorMsg()));
		$out{'response'}{'data'} = array('ergebnis' =>$rs->fields{'ergebnis'});
        print json_encode($out);
        return;
    }
}
else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => "Keine Ergebnis-Rückmeldung erhalten. Löschvorgang evtl. nicht erfolgreich. </br>" . ($dbSyb->ErrorMsg()));
	$out{'response'}{'data'} = array('ergebnis' =>$rs->fields{'ergebnis'});
    print json_encode($out);
    return;
}




