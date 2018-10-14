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
    $dbSyb->Connect('localhost', user, psw, db); //=>>> Verbindungsaufbau mit der DB


    if (!$dbSyb->IsConnected()) {


        print ("Anmeldung: " . $dbSyb->ErrorMsg());

        $data = array();

        return ($data);
    }

    $dbSyb->debug = false;
    $out = array();


// $Where = " Where land != 'nb' ";

    $querySQLTore = "Select 'Tore' as gesehen, ergebnis as anzahl from sp_besuche ";


    $rs = $dbSyb->Execute($querySQLTore);

    if (!$rs) {

        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('errors' => "Es ist ein Fehler aufgetreten.");

        print json_encode($out);
        return;
    }


    $treffer = array();
    $tore = 0;

    while (!$rs->EOF) {

        $treffer = explode(':', trim($rs->fields{'anzahl'}));

        $tore += $treffer[0] + $treffer[1];


        $rs->MoveNext();
    }

    $rs->Close();


//    $querySQLElfer = "Select 'Tore' as gesehen, Ifnull(erg_elfer,'0:0') as anzahl from sp_besuche ";
//
//
//    $rs = $dbSyb->Execute($querySQLElfer);
//
//
//    if (!$rs) {
//
//        $out{'response'}{'status'} = -4;
//        $out{'response'}{'errors'} = array('errors' => "Es ist ein Fehler aufgetreten.");
//
//        print json_encode($out);
//        return;
//    }
//
//    $elfer = array();
//    $elfer_gesamt = 0;
//
//    while (!$rs->EOF) {
//
//        $elfer = explode(':', trim($rs->fields{'anzahl'}));
//
//        $elfer_gesamt += $elfer[0] + $elfer[1];
//
//
//        $rs->MoveNext();
//    }
//
//    $rs->Close();


    $querySQL = "Select 'Stadien / Spielstätten' as gesehen, count(*) as anzahl from stadionliste 
				Union
				Select 'Spiele' as gesehen, count(*) as anzahl from sp_besuche				
				Union
				Select 'Vereine' as gesehen, count(*) as anzahl from vereine
				Union
				Select 'Spieler' as gesehen, count(*) as anzahl from spieler 
				Union
				Select 'Trainer' as gesehen, count(*) as anzahl from trainer 
				Union
				Select 'Schiedsrichter' as gesehen, count(*) as anzahl from schiris ".
//				Union
//				Select 'Begleiter' as gesehen, count(*) as anzahl from begleiter 
			        " Union 
				SELECT '0:0 nach 90 Min.' as gesehen, count(*) as anzahl FROM sp_besuche where ergebnis = '0:0' and erg_zusatz is NULL
				Union 
				Select 'Tore' as gesehen, count(*) as anzahl from sp_besuche 
                                Union 
                                Select 'Ausgaben' as gesehen, sum(sp.sonstige+sp.bahn+sp.eintrittskarte+sp.flieger+sp.uebernachtung+sp.verpflegung+sp.sprit+sp.sprit_anteilig+sp.schiff+sp.souvenir+sp.taxi+sp.handy) as anzahl from sp_besuche sp 
                                Union
                                Select 'Abgerissene km' as gesehen, sum(entfernung_km) as anzahl from mobil"
    ;


// $fp = fopen("uebersicht.txt", "w"); 
// fputs($fp, $querySQL);             
// fclose($fp); 


    $rs = $dbSyb->Execute($querySQL);



    $data = array();

    if (!$rs) {

        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('errors' => $dbSyb->ErrorMsg());

        print json_encode($out);
        return;
    } else {

        $i = 0;
        $treffer = array();

        while (!$rs->EOF) {


            if ($rs->fields{'gesehen'} == "Tore") {
                $data{$i}{"gesehen"} = 'Tore';
                $data{$i}{"anzahl"} = $tore /*+ $elfer_gesamt*/;
            } else {
                $data{$i}{"anzahl"} = (trim($rs->fields{'anzahl'}))*1;
                $data{$i}{"gesehen"} = $rs->fields{'gesehen'};
            }
            $i++;

            $rs->MoveNext();
        }

        $rs->Close();


        $out{'response'}{'status'} = 0;
        $out{'response'}{'errors'} = array();
        $out{'response'}{'data'} = $data;

        print json_encode($out);
    }
} else {
    header("Location: http://$host$uri/noadmin.php");
}
?>