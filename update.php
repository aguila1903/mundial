<?php

session_start();

require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');

$ADODB_CACHE_DIR = 'C:/php/cache';


$ADODB_FETCH_MODE = ADODB_FETCH_ASSOC; // Liefert ein assoziatives Array, das der geholten Zeile entspricht 

$ADODB_COUNTRECS = true;

$dbSyb = ADONewConnection("mysql");

// DB-Abfragen NICHT cachen
$dbSyb->memCache = false;
$dbSyb->memCacheHost = array('localhost'); /// $db->memCacheHost = $ip1; will work too
$dbSyb->memCacheCompress = false; /// Use 'true' arbeitet unter Windows nicht
//$dsn = "'localhost','root',psw,'vitaldb'";
$dbSyb->Connect('localhost', 'root', psw, 'mundialdb_bk'); //=>>> Verbindungsaufbau mit der DB


if (!$dbSyb->IsConnected()) {


    print ("Anmeldung: " . $dbSyb->ErrorMsg());  
    return;
}

$dbSyb->debug = false;




$path = getcwd()."\script.txt";

$file = file_get_contents($path);

$file_replaced = str_replace("\r", '', $file); // Entfernen der Wagenrückläufe 

$exploded = explode("/**/", $file_replaced);     //Text wird nach den jeweiligen SQL-Statements in ein Array zerlegt
$i = 0;
$sum = count($exploded) - 1;

/*
 * **************** Beginn der While-Schleife **********************************
 * =============================================================================
 */
while ($i < $sum) {


    $rs = $dbSyb->Execute($exploded[$i]); // Die SQL-Statements werden nacheinander eingelesen

    if (!$rs) {
        print $dbSyb->ErrorMsg() . "\n";
        return;
    }


    $i++;
}

print "Ich gratuliere, Futbol Mundial wurde erfolgreich aktualisiert";

		





?>