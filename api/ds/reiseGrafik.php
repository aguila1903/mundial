<?php

session_start();

require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');
header("Cache-Control: no-cache, must-revalidate");
$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");

if (isset($_SESSION["login"]) && $_SESSION["login"] == login && $_SESSION["admin"] == admin) {

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


    if (isset($_REQUEST["jahr"])) {
        $jahr = $_REQUEST["jahr"];
    } else {
        $jahr = "";
    }



    if (isset($_REQUEST["verkehrsmittel"])) {
        $verkehrsmittel = $_REQUEST["verkehrsmittel"];
        if ($verkehrsmittel != "Alle") {
            $verkehrsmittel = " and verkehrsmittel = " . $dbSyb->Quote(($verkehrsmittel));
        } else {
            $verkehrsmittel = "";
        }
    } else {
        $verkehrsmittel = "";
    }

    if (isset($_REQUEST["auswahl"])) {
        $auswahl = $_REQUEST["auswahl"];
        if ($auswahl == "G" && $verkehrsmittel == "Alle") {
            $where = "";
        } elseif ($auswahl == "G" && $verkehrsmittel != "Alle") {
            $where = " Where lfd_nr > -1 " . $verkehrsmittel;
        } else {
            $where = " where year(sp_datum) = " . $jahr . $verkehrsmittel;
        }
    } else {
        $where = "";
    }

    $lookFor = " sum(entfernung_km) as gesamtstrecke ";

//if($verkehrsmittel != "Alle" && $verkehrsmittel != ""){ 
//$lookFor = "ifnull(entfernung_km,0) as gesamtstrecke ";
//}

    $sqlQuery = "select 
case when month(sp_datum) = 1 Then 'Januar' 
 when month(sp_datum) = 2 Then 'Februar'
 when month(sp_datum) = 3 Then 'März'
 when month(sp_datum) = 4 Then 'April'
 when month(sp_datum) = 5 Then 'Mai'
 when month(sp_datum) = 6 Then 'Juni'
 when month(sp_datum) = 7 Then 'Juli'
 when month(sp_datum) = 8 Then 'August'
 when month(sp_datum) = 9 Then 'September'
 when month(sp_datum) = 10 Then 'Oktober'
 when month(sp_datum) = 11 Then 'November'
 when month(sp_datum) = 12 Then 'Dezember' end as monat, "
            . $lookFor
            . ", substring(year(sp_datum),3) as jahr_ "
            . ", year(sp_datum) as jahr "
            . " from mobil m join sp_besuche sp on sp.spiel_id = m.spiel_id " . $where
            . "  group by monat, jahr_, jahr "
            . " order by sp_datum desc"
    ;
//    file_put_contents("reiseGrafik.txt", $sqlQuery);

    $rs = $dbSyb->Execute($sqlQuery);


    if (!$rs) {
        print $dbSyb->ErrorMsg() . "\n";
        return;
    }
    $i = 0;

    $value = array();

    while (!$rs->EOF) {


        $value{$i}{"gesamtstrecke"} = $rs->fields{'gesamtstrecke'};
        $value{$i}{"monat"} = $rs->fields{'monat'} . " " . $rs->fields{'jahr_'};
        $value{$i}{"jahr"} = $rs->fields{'jahr'};

        $i++;

        // den n�chsten Datensatz lesen
        $rs->MoveNext();
    }

    $rs->Close();

    $out = array();

    // zentrale Anwortfunktion f�r REST-Datenquellen
    // im Kern nicht anderes als print json_encode($value)
    $out{'response'}{'status'} = 0;
    $out{'response'}{'errors'} = array();
    $out{'response'}{'data'} = $value;

    print json_encode($out);
} else {
    header("Location: http://$host$uri/noadmin.php");
}
