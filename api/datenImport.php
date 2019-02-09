<?php

date_default_timezone_set('europe/berlin');

$logFileName = date('Y-m-d') . ".log";

require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');

$ADODB_CACHE_DIR = 'C:/php/cache';


$ADODB_FETCH_MODE = ADODB_FETCH_ASSOC; // Liefert ein assoziatives Array, das der geholten Zeile entspricht 

$ADODB_COUNTRECS = true;

$dbSyb = ADONewConnection("mysqli");

// DB-Abfragen NICHT cachen
$dbSyb->memCache = false;
$dbSyb->memCacheHost = array('localhost'); /// $db->memCacheHost = $ip1; will work too
$dbSyb->memCacheCompress = false; /// Use 'true' arbeitet unter Windows nicht



$dbSyb->Connect('localhost', user, psw, 'mundialdb');  //=>>> Verbindungsaufbau mit der DB

if (!$dbSyb->IsConnected()) {


    print ("Anmeldung: " . $dbSyb->ErrorMsg());

    $data = array();

    return ($data);
}

$dbSyb->debug = false;

$path1 = __DIR__;
$dateiname = "\\worldcities.csv";

$path_parts = pathinfo($path1 . $dateiname);
$extension = $path_parts['extension'];





if (strtolower($extension) != "csv") {
    $result = 'Bei der übergebenen Datei handelt es sich nicht um eine CSV-Datei! ' . $fileType;
    print ($result);
    return;
}

$file = file_get_contents($path1 . $dateiname, true);

$file_repl = str_replace("\r", "", $file);
$split = explode("\n", $file_repl);

$ii = 1;
while ($ii < count($split)) {
    $zeile = $split[$ii];


    $spalte = explode(";", $zeile);

    if ($spalte[4] == "Germany") {
        $ii++;
        continue;
    }
    $querySQL = " insert into geo_data_world "
            . " values "
            . "("
            // . $dbSyb->Quote(utf8_encode($spalte[1]))
            . $dbSyb->Quote(($spalte[0]))
            . "," . $dbSyb->Quote(($spalte[1]))
            . "," . $dbSyb->Quote(($spalte[2]))
            . "," . $dbSyb->Quote(($spalte[3]))
            . "," . $dbSyb->Quote(($spalte[4]))
            . "," . $dbSyb->Quote(($spalte[5]))
            . "," . $dbSyb->Quote(($spalte[6]))
            . ")";

    // file_put_contents("query.sql", $querySQL);
    $rs = $dbSyb->Execute($querySQL);


    if (!$rs) {
        $result = 'Datenbank-Fehler aufgetregen<br>' . $dbSyb->ErrorMsg();
        print ($result);
        return;
    } else {
        echo $ii + 1 . ". Zeile erfolgreich eingefuegt<br>";
    }
    $ii++;
}
