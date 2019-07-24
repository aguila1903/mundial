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


    $querySQL = "SELECT 
    IFNULL(spieler_id_a, spieler_id_h) AS spieler_id,
    CONCAT(RTRIM(s.vorname), ' ', RTRIM(s.name)) AS spielername,
    COUNT(*) AS tore,
    DATE_FORMAT(s.geb_datum, GET_FORMAT(DATE, 'EUR')) AS geb_datum,
    IFNULL(de, s.land) AS land,
    l.code,
    IFNULL((SELECT 
                    COUNT(*)
                FROM
                    sp_tore_spiel_tabelle
                WHERE
                    (spieler_id_a IS NOT NULL)
                        AND (besonderheit = 'FE'
                        OR besonderheit = 'HE')
                        AND ifnull(besonderheit,'') not in ('ET')
                        AND (spieler_id_a = s.spieler_id)
                GROUP BY spieler_id_a),
            0) AS elfer_a,
    IFNULL((SELECT 
                    COUNT(*)
                FROM
                    sp_tore_spiel_tabelle
                WHERE
                    (spieler_id_h IS NOT NULL)
                        AND (besonderheit = 'FE'
                        OR besonderheit = 'HE')
					    AND ifnull(besonderheit,'') not in ('ET')
                        AND (spieler_id_h = s.spieler_id)
                GROUP BY spieler_id_a),
            0) AS elfer_h,
    IFNULL((SELECT 
                    COUNT(*)
                FROM
                    sp_tore_spiel_tabelle
                WHERE
                    (spieler_id_a IS NOT NULL
                        OR spieler_id_h IS NOT NULL)
                        AND team = 'h'
                        AND (spieler_id_a = s.spieler_id
                        OR spieler_id_h = s.spieler_id)
                        AND ifnull(besonderheit,'') not in ('ET')
                GROUP BY spieler_id_a),
            0) AS heim,
    IFNULL((SELECT 
                    COUNT(*)
                FROM
                    sp_tore_spiel_tabelle
                WHERE
                    (spieler_id_a IS NOT NULL
                        OR spieler_id_h IS NOT NULL)
                        AND team = 'a'
                        AND (spieler_id_a = s.spieler_id
                        OR spieler_id_h = s.spieler_id)
                        AND ifnull(besonderheit,'') not in ('ET')
                GROUP BY spieler_id_a),
            0) AS gast
FROM
    sp_tore_spiel_tabelle
        JOIN
    spieler s ON s.spieler_id = IFNULL(spieler_id_a, spieler_id_h)
        LEFT JOIN
    laender l ON s.land = l.code
WHERE
    s.spieler_id > - 1
        AND (spieler_id_a IS NOT NULL
        OR spieler_id_h IS NOT NULL)
        AND ifnull(besonderheit,'') not in ('ET')
GROUP BY spielername
ORDER BY tore DESC"
    ;


// $fp = fopen("torschuetzenDS.txt", "w"); 
// fputs($fp, $querySQL);             
// fclose($fp); 


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
            $data{$i}{"geb_datum"} = trim($rs->fields{'geb_datum'});
            $data{$i}{"heim"} = trim($rs->fields{'heim'});
            $data{$i}{"spieler_id"} = trim($rs->fields{'spieler_id'});
            // $data{$i}{"verein_id"} = trim($rs->fields{'verein_id'});
            $data{$i}{"gast"} = trim($rs->fields{'gast'});
            $data{$i}{"elfer"} = trim($rs->fields{'elfer_a'})+trim($rs->fields{'elfer_h'});
            $data{$i}{"spielername"} = trim(($rs->fields{'spielername'}));
            // $data{$i}{"vereinsname"} = ($rs->fields{'vereinsname'});
//            $data{$i}{"position"} = (trim($rs->fields{'position'}));
            $data{$i}{"land"} = (trim($rs->fields{'land'}));
            $data{$i}{"code"} = (trim($rs->fields{'code'}));
            $data{$i}{"tore"} = $rs->fields{'tore'};

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