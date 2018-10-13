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
    return;
}

$dbSyb->debug = false;
$out = array();
$update = "";
function domainAvailable($strDomain) {
    $rCurlHandle = curl_init($strDomain);

    curl_setopt($rCurlHandle, CURLOPT_CONNECTTIMEOUT, 10);
    curl_setopt($rCurlHandle, CURLOPT_HEADER, TRUE);
    curl_setopt($rCurlHandle, CURLOPT_NOBODY, TRUE);
    curl_setopt($rCurlHandle, CURLOPT_RETURNTRANSFER, TRUE);

    $strResponse = curl_exec($rCurlHandle);

    curl_close($rCurlHandle);

    if (!$strResponse) {
        return FALSE;
    }

    return TRUE;
}

function updateCheck() {


    $update = shell_exec("git pull -f");
    $date = date("Y-m-d H:i:s") . ": \n";
    if (trim($update) != "Already up to date." && $update !== null) {

        file_put_contents("updates.txt", "$date$update\n", FILE_APPEND);
    }

    return $update;
//    exec('update.cmd');
}

if (domainAvailable('https://github.com/')) {
    $update = updateCheck();
} else {
    $out{'response'}{'status'} = 4;
    $out{'response'}{'errors'} = array('Update konnte nicht durchgeführt werden da keine Internetverbindung besteht.');

    print json_encode($out);

    return;
}


$out{'response'}{'status'} = 0;
$out{'response'}{'errors'} = array();
$out{'response'}{'data'} = $update;

print json_encode($out);
?>