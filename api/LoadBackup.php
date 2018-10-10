<?php

session_start();

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
//$dsn = "'localhost','root',psw,'vitaldb'";
$dbSyb->Connect('localhost', user, psw, db); //=>>> Verbindungsaufbau mit der DB


if (!$dbSyb->IsConnected()) {


    print ("Anmeldung: " . $dbSyb->ErrorMsg());

    $data = array();

    return ($data);
}

$dbSyb->debug = false;

if (isset($_REQUEST["dateiname"])) {
    $dateiname = ($_REQUEST["dateiname"]);
} else {
    $out = array();

    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => "Wo isn der Dateiname?");

    return;
}
$path = getcwd() . "\Backups\\";

//file_put_contents("LoadBackup.txt", $path);

if (is_file($path . $dateiname) != 1) {
    $out = array();

    $out{'response'}{'data'} = array();
    $out{'response'}{'status'} = -66;
    $out{'response'}{'errors'} = "Dateiname existiert nicht!";

    print json_encode($out);

    return;
}


//$datum = getdate();
//$dateiname = $datum["year"]."-".$datum["mon"]."-".$datum["mday"].".bak";



$batch = "@echo off\n
cd c:\\xampp\\mysql\\bin\n


c:\\xampp\\mysql\\bin\\mysql -uroot -p" . psw . " " . db . " < $path$dateiname \n

echo %errorlevel% ";

file_put_contents("$path$dateiname.bat", $batch);

$bathFileRun = "$path$dateiname.bat";


$output = exec("C:\\windows\\system32\\cmd.exe /c $bathFileRun");


$data = array();

if ($output == 0) {
    $data{"rueckmeldung"} = ($path) . $dateiname;
} else {

    unlink("$path$dateiname.sql");
    $out = array();

    $out{'response'}{'data'} = array();
    $out{'response'}{'status'} = -99;
    $out{'response'}{'errors'} = "Fehler in der Matrix!";

    print json_encode($out);

    return;
}

unlink("$path$dateiname.bat");

$out = array();

$out{'response'}{'status'} = 0;
$out{'response'}{'errors'} = array();
$out{'response'}{'data'} = $data;

print json_encode($out);
?>