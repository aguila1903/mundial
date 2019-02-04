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
    $dbSyb->Connect('localhost', user, psw, db); //=>>> Verbindungsaufbau mit der DB


    if (!$dbSyb->IsConnected()) {


        print ("Anmeldung: " . $dbSyb->ErrorMsg());

        $data = array();

        return ($data);
    }

    $dbSyb->debug = false;
    $out = array();



    $sqlQuery = "SELECT DISTINCT
    c.latitude AS lat, c.longitude AS lon, b.ort AS name
FROM
    stadionliste a
        JOIN
    orte b ON a.ort = b.ort_id
        JOIN
    geo_data_ger c ON b.ort = c.ort
GROUP BY b.ort
UNION SELECT 
    b.latitude AS lat, b.longitude AS lon, b.de AS name
FROM
    stadionliste a
        JOIN
    laender b ON a.land = b.code;";


// file_put_contents('stadienDS.txt', $sqlQuery);

    $rs = $dbSyb->Execute($sqlQuery);


    if (!$rs) {
        print $dbSyb->ErrorMsg() . "\n";
        return;
    }
    $export = "lat;lon;name\r\n";
  
    while (!$rs->EOF) {

        $export .= $rs->fields{'lat'} . ";" . $rs->fields{'lon'} . ";" . utf8_decode($rs->fields{'name'}) . "\r\n";
   
        $rs->MoveNext();
    }

    $rs->Close();

    file_put_contents("mundial.csv", $export);

    header("Location: mundial.csv");
} else {
    header("Location: http://$host$uri/noadmin.php");
}
?>