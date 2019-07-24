<?php

session_start();
require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');
header("Cache-Control: no-cache, must-revalidate");


    /*     * *****************************************************************************
      System: infotool - SVK-Versaende
      Funktion: Versandfehler anzeigen
      Autor: jra
      Datum: 04.12.2012

      Zusatzhinweise:

      �nderungen:

     * ***************************************************************************** */

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

    $sqlQuery = "Select id, version, bugfix from versionshistorie "
    ;
// file_put_contents("kostenGrafik.txt", $sqlQuery);

    $rs = $dbSyb->Execute($sqlQuery);


    if (!$rs) {
        print $dbSyb->ErrorMsg() . "\n";
        return;
    }
    $i = 0;

    $value = array();

    while (!$rs->EOF) {


        $value{$i}{"id"} = $rs->fields{'id'};
        $value{$i}{"version"} = $rs->fields{'version'};
        $value{$i}{"bugfix"} = (trim($rs->fields{'bugfix'}));

        $i++;

        // den n�chsten Datensatz lesen
        $rs->MoveNext();
    }

    $rs->Close();

    $out = array();

    $out{'response'}{'status'} = 0;
    $out{'response'}{'errors'} = array();
    $out{'response'}{'data'} = $value;

    print json_encode($out);

?>