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

 $data = array();
if (!$dbSyb->IsConnected()) {
    print ("Anmeldung: " . $dbSyb->ErrorMsg());

    return ($data);
}

$dbSyb->debug = false;
$out = array();

if (isset($_REQUEST["stadion_id"])) {  // überprüft ob alle Parameter belegt sind
    $stadion_id = $_REQUEST["stadion_id"];
}else{
    // keine Query hat nicht funtioniert

    print("Stadion_id fehlt!");

    return($data);
}
  

$querySQL = "SELECT 
    a.stadion_id, a.verein_id, b.gaengiger_name, a.lfd_nr
FROM
    stad_verein_tabelle a,
    vereine b,
    stadionliste c
WHERE
	a.stadion_id = c.stadion_id
    and a.verein_id = b.verein_id
    and 
    a.stadion_id = " . $stadion_id;
    

// file_put_contents("stadionVereine.txt",$querySQL);

$rs = $dbSyb->Execute($querySQL); 


$data = array();

if (!$rs) {
   
    print("Query 1: " . $dbSyb->ErrorMsg());

    return($data);
}

else {

    $i = 0;

    while (!$rs->EOF) { 
        $data{$i}{"stadion_id"} = $rs->fields{'stadion_id'};
        $data{$i}{"verein_id"} = $rs->fields{'verein_id'};
		$data{$i}{"lfd_nr"} = $rs->fields{'lfd_nr'};
        $data{$i}{"vereinsname"} = ($rs->fields{'gaengiger_name'});

        $i++;

        $rs->MoveNext();
    }

    $rs->Close();
  
    $out{'response'}{'status'} = 0;
    $out{'response'}{'errors'} = array();
    $out{'response'}{'data'} = $data;

    print json_encode($out);
}} else {
    header("Location: http://$host/mundial/noadmin.php");
}
?>