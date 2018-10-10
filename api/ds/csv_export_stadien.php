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


    if (isset($_REQUEST["stadionname"])) {
        $andStadionName = $_REQUEST["stadionname"];
        if ($andStadionName == "null" || $andStadionName == "" || $andStadionName == "undefined") {
            $andStadionName = "";
        } else {

            // $andStadionName = " and stadionname = " . $dbSyb->Quote(($andStadionName));
            $andStadionName = " and stadionname like '%" . ($andStadionName) . "%'";
        }
    } else {
        $andStadionName = "";
    }

    if (isset($_REQUEST["stadion_id"])) {
        $andStadionID = $_REQUEST["stadion_id"];
        if ($andStadionID == "null" || $andStadionID == "" || $andStadionID == "undefined") {
            $andStadionID = "";
        } else {

            // $andStadionName = " and stadionname = " . $dbSyb->Quote(($andStadionName));
            $andStadionID = " and s.stadion_id = " . $andStadionID;
        }
    } else {
        $andStadionID = "";
    }

    if (isset($_REQUEST["land"])) {
        $land = $_REQUEST["land"];
        if ($land == "null" || $land == "" || $land == "undefined") {
            $andLand = "";
        } else {

            $andLand = " and l.code = " . $dbSyb->Quote(($land));
        }
    } else {
        $andLand = "";
    }

    if (isset($_REQUEST["ort"])) {
        $ort = $_REQUEST["ort"];
        if ($ort == "null" || $ort == "" || $ort == "undefined") {
            $andOrt = "";
        } else {
            $andOrt = " and s.ort = " . $dbSyb->Quote(($ort));
        }
    } else {
        $andOrt = "";
    }

    if (isset($_REQUEST["stadtteil"])) {
        $stadtteil = $_REQUEST["stadtteil"];
        if ($stadtteil == "null" || $stadtteil == "" || $stadtteil == "undefined") {
            $andStadtTeil = "";
        } else {

            $andStadtTeil = " and stadtteil = " . $dbSyb->Quote(($stadtteil));
        }
    } else {
        $andStadtTeil = "";
    }

    if (isset($_REQUEST["freieSuche"])) {
        $freieSuche = $_REQUEST["freieSuche"];
        $likeFreieSuche = " and stadionname like '%" . $freieSuche . "%' or name_vor_ae like '%" . $freieSuche . "%'";
    } else {
        $likeFreieSuche = "";
    }

    if (isset($_REQUEST["verein_id"])) {
        $verein_id = $_REQUEST["verein_id"];
        $Where = " Where s.stadion_id not in ((Select stadion_id from stad_verein_tabelle where verein_id = " . $verein_id . " )) " . $andLand;
    } else {
        $Where = " Where land != 'nb' ";
    }


//if (isset($_REQUEST["erstbesuch"])) {
//        $andErstbesuch = $_REQUEST["erstbesuch"];
//        if ($andErstbesuch == "null" || $andErstbesuch == "" || $andErstbesuch == "undefined") {
//           $andErstbesuch = "";
//        } else {
//            
//        // $andErstbesuch = " and erstbesuch = " . $dbSyb->Quote(($andErstbesuch));
//		$andErstbesuch = " and erstbesuch like '%" . ($andErstbesuch)."%'";
//        }
//    } else {
//        $andErstbesuch = "";
//    }


    $sqlQuery = "Select distinct
    s.stadion_id as lfd_nr,
(select count(*) from sp_besuche where stadion_id = s.stadion_id) as anzahl,
DATE_FORMAT(l.erstbesuch,GET_FORMAT(DATE,'EUR')) as erstbesuch,
l.laenderpunkt_nr, 
stadionname, 
s.ort as ort_id, o.ort as ort, er_jahr, stadtteil, st.name as stadtteil_bez,
Ifnull(de,land) as land, l.code,
kapazitaet,
zusch_rek, anschrift, historie, abriss, gr_nr
from stadionliste s left join laender l on land = l.code 
left join orte o on s.ort = ort_id  
left join stadtteile st on s.stadtteil = st.stadtteil_id 
left join stadionnamen sn on sn.stadion_id = s.stadion_id "
            . $Where
            . $andLand
            . $andOrt
            . $andStadtTeil
            . $andStadionName
            . $andStadionID
            . $likeFreieSuche
            . " order by gr_nr, de, o.ort, stadtteil, st.name;";


// file_put_contents('stadienDS.txt', $sqlQuery);

    $rs = $dbSyb->Execute($sqlQuery);


    if (!$rs) {
        print $dbSyb->ErrorMsg() . "\n";
        return;
    }
    $export = "Ground-Nummer; Land; Ort; Stadtteil; Stadion; Anz. Spiele\r\n";
    $i = 0;

    $value = array();

    while (!$rs->EOF) {

        $value{$i}{"lfd_nr"} = $rs->fields{'lfd_nr'};
        $value{$i}{"ort_id"} = $rs->fields{'ort_id'};
        $value{$i}{"stadionname"} = ($rs->fields{'stadionname'});
        $value{$i}{"stadtteil_bez"} = ($rs->fields{'stadtteil_bez'});
        // $value{$i}{"nr"} = $rs->fields{'nr'};
        $value{$i}{"gr_nr"} = $rs->fields{'gr_nr'};
        $value{$i}{"ort"} = ($rs->fields{'ort'});
        $value{$i}{"stadtteil"} = ($rs->fields{'stadtteil'});
//        If ($rs->fields{'erstbesuch'} != '01.01.1900') {
//            $value{$i}{"land"} = ($rs->fields{'land'}) . " - " . $rs->fields{'erstbesuch'} . " Nr: " . $rs->fields{'laenderpunkt_nr'};
//        } else {
            $value{$i}{"land"} = ($rs->fields{'land'});
//        }
        $value{$i}{"code"} = $rs->fields{'code'};
        $value{$i}{"anzahl"} = $rs->fields{'anzahl'};
        $value{$i}{"kapazitaet"} = $rs->fields{'kapazitaet'};
        $value{$i}{"zusch_rek"} = $rs->fields{'zusch_rek'};
        $value{$i}{"er_jahr"} = $rs->fields{'er_jahr'};
        $value{$i}{"abriss"} = $rs->fields{'abriss'};
        $value{$i}{"erstbesuch"} = $rs->fields{'erstbesuch'};
        $value{$i}{"anschrift"} = ($rs->fields{'anschrift'});
        $value{$i}{"historie"} = htmlspecialchars_decode(($rs->fields{'historie'}));



        if ($value{$i}{"abriss"} == 1) {
            $id = 0;
            $value{$i}{"_hilite"} = $id;
        }

        $export .= $value{$i}{"gr_nr"} . ";" .  $value{$i}{"land"} . ";" . $value{$i}{"ort"} . ";"
                . $value{$i}{"stadtteil_bez"} . ";" . $value{$i}{"stadionname"} . ";" . $value{$i}{"anzahl"} . "\r\n";

        $i++;

        // den n�chsten Datensatz lesen
        $rs->MoveNext();
    }

    $rs->Close();



    file_put_contents("GroundListe.csv", ($export));

    header("Location: GroundListe.csv");
} else {
    header("Location: http://$host$uri/noadmin.php");
}
?>