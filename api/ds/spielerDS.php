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
    $out = array();


// $Where = " Where land != 'nb' ";

    if (isset($_REQUEST["name"])) {
        $andName = $_REQUEST["name"];
        if ($andName == "null" || $andName == "") {
            $andName = "";
        } else {

            // $andName = " and trim(concat(ifnull(vorname,''), ' ', name)) = " . $dbSyb->Quote(($andName));
            $andName = " and trim(name) = " . $dbSyb->Quote(($andName));
        }
    } else {
        $andName = "";
    }

    if (isset($_REQUEST["vorname"])) {
        $andVorName = $_REQUEST["vorname"];
        if ($andVorName == "null" || $andVorName == "") {
            $andVorName = "";
        } else {
            $andVorName = " and vorname = " . $dbSyb->Quote(($andVorName));
        }
    } else {
        $andVorName = "";
    }


    if (isset($_REQUEST["land"])) {
        $land = $_REQUEST["land"];
        if ($land == "null" || $land == "") {
            $andLand = "";
        } else {

            $andLand = " and s.land = " . $dbSyb->Quote(($land));
        }
    } else {
        $andLand = "";
    }

    if (isset($_REQUEST["pos_id"])) {
        $pos_id = $_REQUEST["pos_id"];
        if ($pos_id == "null" || $pos_id == "") {
            $andPos = "";
        } else {
            $andPos = " and s.position = " . $dbSyb->Quote(($pos_id));
        }
    } else {
        $andPos = "";
    }

    if (isset($_REQUEST["nati_spieler"])) {
        $nati_spieler = $_REQUEST["nati_spieler"];
        if ($nati_spieler == "null" || $nati_spieler == "") {
            $andNati = "";
        } else {
            $andNati = " and s.nati_spieler = " . $nati_spieler;
        }
    } else {
        $andNati = "";
    }


    if (isset($_REQUEST["freieSuche"])) {
        $freieSuche = $_REQUEST["freieSuche"];
        $likeFreieSuche = " and name like '%" . $freieSuche . "%' or vorname like '%" . $freieSuche . "%'";
    } else {
        $likeFreieSuche = "";
    }



// if (isset($_REQUEST["verein_id"])) {
    // $verein_id = $_REQUEST["verein_id"];
    // $Where =" Where verein_id not in ((Select verein_id from stad_verein_tabelle where verein_id = ". $verein_id." )) ".$andLand;
// }else {
    // $Where = " Where verein_id > -1 ";
// }
// if (isset($_REQUEST["verein_id"])) {
    // $verein_id = $_REQUEST["verein_id"];
    // $andVerein =" Where sv.verein_id  = ". $verein_id;
// }else {
    // $andVerein = " Where s.spieler_id > -1 ";
// }

    $querySQL = "SELECT Distinct "
            . "	 spieler_id "
            . ", (select count(*) from sp_spieler_spiel_tabelle ss where ss.spieler_id = s.spieler_id ) as anzahl "
            . ", rtrim(ltrim(name)) as name "
            . ", rtrim(ltrim(vorname)) as vorname "
            . ", concat(ifnull(vorname,''), ' ', name) as spielername "
            // . ", vereinsname "
            // . ", sv.verein_id "
            . ", position as pos_id "
            . ", p.pos_bez as position "
            . ", trikot_nr "
            . ", nati_spieler "
            . ", status "
            . ", DATE_FORMAT(geb_datum,GET_FORMAT(DATE,'EUR')) as geb_datum "
            . ", Ifnull(de, s.land) as land, l.code "
            . ", IFNULL((SELECT  count(*)  FROM sp_tore_spiel_tabelle  where spieler_id_a Is not NULL and spieler_id_a = s.spieler_id group by spieler_id_a),0) as tore_a "
            . ", IFNULL((SELECT  count(*)  FROM sp_tore_spiel_tabelle  where spieler_id_h Is not NULL and spieler_id_h = s.spieler_id group by spieler_id_h),0) as tore_h "
            . ", IFNULL((SELECT  count(*)  FROM sp_tore_spiel_tabelle  where spieler_id_a Is not NULL and spieler_id_a = s.spieler_id and (besonderheit = 'FE' or besonderheit = 'HE') group by spieler_id_a),0) as elfer_a "
            . ", IFNULL((SELECT  count(*)  FROM sp_tore_spiel_tabelle  where spieler_id_h Is not NULL and spieler_id_h = s.spieler_id and (besonderheit = 'FE' or besonderheit = 'HE') group by spieler_id_h),0) as elfer_h "
            . "  From spieler s left join laender l on land = l.code 
		left join pos_bez p on position = pos_id Where s.spieler_id > -1 "
            // . " left join  verein_spieler_tabelle sv on s.spieler_id = sv.spieler_id 
            // left join vereine v on sv.verein_id = v.verein_id "          
            // . $andVerein
            . $andLand
            . $andNati
            . $andName
            . $andVorName
            . $andPos
            . $likeFreieSuche
            . " Order by land, name, vorname; "
    ;


//    $fp = fopen("spielerDS.txt", "w");
//    fputs($fp, $querySQL);
//    fclose($fp);


    $rs = $dbSyb->Execute($querySQL);



    $data = array();

    if (!$rs) {

        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('errors' => "Es ist ein Fehler aufgetreten." . $dbSyb->ErrorMsg());

        print json_encode($out);
        return;
    } else {

        $i = 0;

        while (!$rs->EOF) {
            $data{$i}{"pos_id"} = trim($rs->fields{'pos_id'});
            $data{$i}{"geb_datum"} = trim($rs->fields{'geb_datum'});
            $data{$i}{"trikot_nr"} = trim($rs->fields{'trikot_nr'});
            $data{$i}{"spieler_id"} = trim($rs->fields{'spieler_id'});
            // $data{$i}{"verein_id"} = trim($rs->fields{'verein_id'});
            $data{$i}{"status"} = trim($rs->fields{'status'});
            $data{$i}{"anzahl"} = $rs->fields{'anzahl'};
            $data{$i}{"nati_spieler"} = trim($rs->fields{'nati_spieler'});
            $data{$i}{"name"} = ($rs->fields{'name'});
            $data{$i}{"vorname"} = ($rs->fields{'vorname'});
            $data{$i}{"spielername"} = trim(($rs->fields{'spielername'}));
            // $data{$i}{"vereinsname"} = ($rs->fields{'vereinsname'});
            $data{$i}{"position"} = (trim($rs->fields{'position'}));
            $data{$i}{"land"} = (trim($rs->fields{'land'}));
            $data{$i}{"code"} = (trim($rs->fields{'code'}));
            if (($rs->fields{'elfer_a'} + $rs->fields{'elfer_h'}) > 0) {
                $data{$i}{"tore"} = ($rs->fields{'tore_a'} + $rs->fields{'tore_h'}) . " (" . ($rs->fields{'elfer_a'} + $rs->fields{'elfer_h'}) . ")";
            } else {
                $data{$i}{"tore"} = ($rs->fields{'tore_a'}+$rs->fields{'tore_h'});
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