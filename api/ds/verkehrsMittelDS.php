<?php

session_start();

require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');
header("Cache-Control: no-cache, must-revalidate");
$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");






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

if (isset($_REQUEST["spiel_id"])) {
    $spiel_id = $_REQUEST["spiel_id"];
    $Where = " and spiel_id = " . $spiel_id;
} else {
    $Where = "";
}



$querySQL = "SELECT Distinct "
        . "  spiel_id "
        . ", lfd_nr "
        . ", routenpunkt1 "
        . ", routenpunkt2 "
        . ", ort_id1 "
        . ", Ifnull(o1.ort, ort_id1) as Ort1 "
        . ", ort_id2 "
        . ", Ifnull(o2.ort, ort_id2) as Ort2 "
        . ", land1 "
        . ", Ifnull(l1.de, land1) as Land1 "
        . ", land2 "
        . ", Ifnull(l2.de, land2) as Land2 "
        . ", verkehrsmittel "
        . ", verkehrsmittel_zus "
        . ", entfernung_km "
        . ", map_lnk "
        . "  From mobil "
        . " left join laender l1 on land1 = l1.code "
        . " left join laender l2 on land2 = l2.code "
        . " left join orte o1 on ort_id1 = o1.ort_id "
        . " left join orte o2 on ort_id2 = o2.ort_id "
        . " Where lfd_nr > -1 "
        . $Where
        . " Order by lfd_nr; "
;


// $fp = fopen("verkehrsmittelDS.txt", "w"); 
// fputs($fp, $querySQL);             
// fclose($fp); 


$rs = $dbSyb->Execute($querySQL);



$data = array();

if (!$rs) {

    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => "Es ist ein Fehler aufgetreten.\n" . $dbSyb->ErrorMsg());

    print json_encode($out);
    return;
} else {

    $i = 0;

    while (!$rs->EOF) {
        $data{$i}{"lfd_nr"} = trim($rs->fields{'lfd_nr'});
        $data{$i}{"spiel_id"} = trim($rs->fields{'spiel_id'});
        $data{$i}{"ort_id1"} = trim($rs->fields{'ort_id1'});
        $data{$i}{"ort_id2"} = trim($rs->fields{'ort_id2'});
        $data{$i}{"land1"} = trim($rs->fields{'land1'});
        $data{$i}{"land2"} = trim($rs->fields{'land2'});
        $data{$i}{"routenpunkt1"} = ($rs->fields{'routenpunkt1'});
        $data{$i}{"routenpunkt2"} = ($rs->fields{'routenpunkt2'});
        $data{$i}{"Ort1"} = ($rs->fields{'Ort1'});
        $data{$i}{"Ort2"} = ($rs->fields{'Ort2'});
        $data{$i}{"Land1"} = ($rs->fields{'Land1'});
        $data{$i}{"Land2"} = ($rs->fields{'Land2'});
        $data{$i}{"entfernung_km"} = trim($rs->fields{'entfernung_km'});
        $data{$i}{"verkehrsmittel_zus"} = ($rs->fields{'verkehrsmittel_zus'});
        $data{$i}{"verkehrsmittel"} = ($rs->fields{'verkehrsmittel'});
        $data{$i}{"map_lnk"} = ($rs->fields{'map_lnk'});

        $i++;

        $rs->MoveNext();
    }

    $rs->Close();


    $out{'response'}{'status'} = 0;
    $out{'response'}{'errors'} = array();
    $out{'response'}{'data'} = $data;

    print json_encode($out);
}
?>