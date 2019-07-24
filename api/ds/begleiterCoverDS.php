<?php
session_start();

require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');
header("Cache-Control: no-cache, must-revalidate");
$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");

if (isset($_SESSION["login"]) && $_SESSION["login"] == login && $_SESSION["admin"] == admin) {





$ADODB_CACHE_DIR = 'C:/php/cache';


$ADODB_FETCH_MODE = ADODB_FETCH_ASSOC; // Liefert ein assoziatives Array, das der geholten Zeile entspricht 

$ADODB_COUNTRECS = true;

$dbSyb = ADONewConnection("mysqli");

// DB-Abfragen NICHT cachen
$dbSyb->memCache = false;
$dbSyb->memCacheHost = array('localhost'); /// $db->memCacheHost = $ip1; will work too
$dbSyb->memCacheCompress = false; /// Use 'true' arbeitet unter Windows nicht
//$dsn = "'localhost','root',psw,'vitaldb'";
$dbSyb->Connect(link, user, psw, db); //=>>> Verbindungsaufbau mit der DB


if (!$dbSyb->IsConnected()) {


    print ("Anmeldung: " . $dbSyb->ErrorMsg());

    $data = array();

    return ($data);
}

$dbSyb->debug = false;
$out = array();

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

// String mit DB-Abfrage f�r den Rest


$querySQL = "select dateiname, id, media_id from media where id = ". $begleiter_id. " and ref = 'bg' and art = 'fr';";



$rs = $dbSyb->Execute($querySQL);


$data = array();

if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('begleiter_id' => ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}
else {
    $i = 0;

    while (!$rs->EOF) {
        $data{$i}{"begleiter_id"} = $rs->fields{'id'};
        $data{$i}{"media_id"} = $rs->fields{'media_id'};
        $data{$i}{"dateiname"} = ($rs->fields{'dateiname'});

        $i++;

        // den n�chsten Datensatz lesen
        $rs->MoveNext();
    }

    $rs->Close();
     
    $out{'response'}{'status'} = 0;
    $out{'response'}{'errors'} = array();
    $out{'response'}{'data'} = $data;

    print json_encode($out);  

}

} else {
    header("Location: http://$host$uri/noadmin.php");
}
?>