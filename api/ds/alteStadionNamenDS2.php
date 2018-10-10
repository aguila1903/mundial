<?php
session_start();

require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');
header("Cache-Control: no-cache, must-revalidate");
$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");

if (isset($_SESSION["login"]) && $_SESSION["login"] == login) {








$ADODB_CACHE_DIR = 'C:/php/cache';


$ADODB_FETCH_MODE = ADODB_FETCH_ASSOC; // Liefert ein assoziatives Array, das der geholten Zeile entspricht 

$ADODB_COUNTRECS = true;

$dbSyb = ADONewConnection("mysqli");

// DB-Abfragen NICHT cachen
$dbSyb->memCache = false;
$dbSyb->memCacheHost = array('localhost'); /// $db->memCacheHost = $ip1; will work too
$dbSyb->memCacheCompress = false; /// Use 'true' arbeitet unter Windows nicht
//$dsn = "'localhost','root',psw,'vitaldb'";
$dbSyb->Connect('localhost', user, psw, db); //=>>> Verbindungsaufbau mit der DB


if (!$dbSyb->IsConnected()) {


    print ("Anmeldung: " . $dbSyb->ErrorMsg());

    $data = array();

    return ($data);
}

$dbSyb->debug = false;
// Toplevel

if (isset($_REQUEST["stadion_id"])) {
    $stadion_id = $_REQUEST["stadion_id"];
	$where = " where stadion_id = ".$stadion_id;
    if ($stadion_id != "null" && $stadion_id != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($stadion_id))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('stadion_id_alt' => "Bitte die Stadion-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $where = "";
    }
} else {
     $where = "";
}

$sqlQuery = "select name_vor_ae, lfd_nr as stadion_id_alt from stadionnamen ". $where ." order by bis_jahr desc;";

$rs = $dbSyb->Execute($sqlQuery);


if (!$rs) {
    print $dbSyb->ErrorMsg() . "\n";
    return;
}
$i = 0;

$value = array();

while (!$rs->EOF) {

    $value{$i}{"stadion_id_alt"} = $rs->fields{'stadion_id_alt'};
    $value{$i}{"name_vor_ae"} = ($rs->fields{'name_vor_ae'});
	
    // if ($value{$i}{"aktiv"} == 0) {
        // $id = 0; 
        // $value{$i}{"_hilite"} = $id;
    // }
   
    $i++;

    // den n�chsten Datensatz lesen
    $rs->MoveNext();
}

$rs->Close();



$output = json_encode($value);

print($output);
} else {
    header("Location: http://$host/mundial/noadmin.php");
}
