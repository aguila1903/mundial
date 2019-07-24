<?php

session_start();

require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');
header("Cache-Control: no-cache, must-revalidate");
$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");

if (isset($_SESSION["login"]) && $_SESSION["login"] == login && $_SESSION["admin"] == admin) {





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


    if (isset($_REQUEST["spiel_id"])) {
        $spiel_id = $_REQUEST["spiel_id"];
        if ($spiel_id != "null" && $spiel_id != "") {
            if ((preg_match("/^[0-9]{1,11}?$/", trim($spiel_id))) == 0) {

                $out{'response'}{'status'} = -4;
                $out{'response'}{'errors'} = array('errors' => "Bitte die Spiel-ID prüfen!");

                print json_encode($out);
                return;
            }
        } else {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('errors' => "Spiel-ID fehlt!");

            print json_encode($out);

            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('errors' => "Spiel-ID fehlt!");

        print json_encode($out);

        return;
    }

    if (isset($_REQUEST["status2"])) {
        $status2 = $_REQUEST["status2"];

        if ((preg_match("/^[ah]{1}$/", trim($status2))) == 0) {

            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('errors' => "Status2 fehlt!");

            print json_encode($out);

            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('errors' => "Status2 fehlt!");

        print json_encode($out);

        return;
    }


    $querySQL = "SELECT Distinct "
            . "	 sp.spieler_id "
            . ", concat(ifnull(s.vorname,''),' ',s.name) as name "
            . " From sp_spieler_spiel_tabelle sp Left Join spieler s on sp.spieler_id = s.spieler_id "
            . " Where   sp.spiel_id = " . $spiel_id . " and sp.status = 'sa' and status2 = " . $dbSyb->Quote($status2)
            . " and sp.spieler_id not in (select sp2.spieler_id from sp_spieler_spiel_tabelle sp2 Where sp2.spiel_id = " . $spiel_id .
            " and sp2.status = 'sa' and status2 = " . $dbSyb->Quote($status2) . " and sp2.aw = '1' )"
//        . "     order by sp.status2, sp.lfd_nr, sp.status;";
            . " UNION "
            . " SELECT DISTINCT "
            . " sp.spieler_id "
            . ",CONCAT(IFNULL(s.vorname, ''), ' ', s.name) AS name "
            . " FROM sp_spieler_spiel_tabelle sp LEFT JOIN "
            . " spieler s ON sp.spieler_id = s.spieler_id "
            . " WHERE "
            . " sp.spiel_id = " . $spiel_id ." AND sp.status = 'ew'"
            . " AND sp.status2 = " . $dbSyb->Quote($status2);


// $fp = fopen("auswechslungen.txt", "w"); 
// fputs($fp, $querySQL);             
// fclose($fp); 


    $rs = $dbSyb->Execute($querySQL);



    $data = array();

    if (!$rs) {

        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('errors' => "Es ist ein Fehler aufgetreten.");

        print json_encode($out);
        return;
    } else {

        $i = 0;

        while (!$rs->EOF) {
            $data{$i}{"spieler_id"} = trim($rs->fields{'spieler_id'});
            $data{$i}{"name"} = ($rs->fields{'name'});

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
    header("Location: http://$host/mundial/noadmin.php");
}
?>