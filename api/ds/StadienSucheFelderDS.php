<?php

session_start();

require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');
header("Cache-Control: no-cache, must-revalidate");
$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");

if (isset($_SESSION["login"]) && $_SESSION["login"] == login) {





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


    if (isset($_REQUEST["lookFor"])) {
        $lookFor = $_REQUEST["lookFor"];
    } else {
        $lookFor = "";
    }


    if (isset($_REQUEST["stadion_id"])) {
        $andStadionName = $_REQUEST["stadion_id"];
        if ($andStadionName == "null" || $andStadionName == "") {
            $andStadionName = "";
        } else {

            $andStadionName = " and s.stadion_id = " . $dbSyb->Quote(($andStadionName));
        }
    } else {
        $andStadionName = "";
    }

    if (isset($_REQUEST["bundesland"])) {
        $andBundesLand = $_REQUEST["bundesland"];
        if ($andBundesLand == "null" || $andBundesLand == "") {
            $andBundesLand = "";
        } else {

            $andBundesLand = " and s.bundesland_id = " . $dbSyb->Quote(($andBundesLand));
        }
    } else {
        $andBundesLand = "";
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

    if (isset($_REQUEST["ort"])) {
        $ort = $_REQUEST["ort"];
        if ($ort == "null" || $ort == "") {
            $andOrt = "";
        } else {

            $andOrt = " and s.ort = " . $dbSyb->Quote(($ort));
        }
    } else {
        $andOrt = "";
    }

    if (isset($_REQUEST["stadtteil"])) {
        $stadtteil = $_REQUEST["stadtteil"];
        if ($stadtteil == "null" || $stadtteil == "") {
            $andStadtTeil = "";
        } else {

            $andStadtTeil = " and stadtteil = " . $dbSyb->Quote(($stadtteil));
        }
    } else {
        $andStadtTeil = "";
    }




    $querySQL = "select distinct ";

    if ($lookFor == "stadion_id") {
        $querySQL .= " stadionname, s.stadion_id ";
        $UnionStadion = " 
	Union 
	select name_vor_ae as stadionname, sn.stadion_id
from stadionnamen sn
left join stadionliste s on s.stadion_id = sn.stadion_id
left join laender l on s.land = l.code 
left join orte o on s.ort = ort_id 
left join stadtteile st on s.stadtteil = st.stadtteil_id 
left join bundeslaender bl on s.bundesland_id = bl.bundesland_id 
Where s.stadion_id > -1 and l.code != 'nb' "
                . $andStadionName
                . $andLand
                . $andOrt
                . $andStadtTeil
                . $andBundesLand;
    } else {
        $UnionStadion = "";
    }
    if ($lookFor == "land") {
        $querySQL .= "  Ifnull(de,s.land) as land, l.code , l.erstbesuch, l.laenderpunkt_nr ";
    }
    if ($lookFor == "ort") {
        $querySQL .= " o.ort, o.ort_id ";
    }
    if ($lookFor == "stadtteil") {
        $querySQL .= " ifnull(stadtteil, '-') as stadtteil, st.name ";
    }

    if ($lookFor == "bundesland") {
        $querySQL .= " ifnull(s.bundesland_id, '-') as bundesland_id, bl.name as bundesland ";
    }

    $querySQL .= " from stadionliste s left join laender l on s.land = l.code 
left join orte o on s.ort = ort_id 
left join stadtteile st on s.stadtteil = st.stadtteil_id 
left join stadionnamen sn on sn.stadion_id = s.stadion_id
left join bundeslaender bl on s.bundesland_id = bl.bundesland_id 
Where s.stadion_id > -1 and l.code != 'nb' "
            . $andStadionName
            . $andLand
            . $andOrt
            . $andStadtTeil
            . $andBundesLand
            . $UnionStadion
            . " Order by ";
    if ($lookFor == "stadtteil") {
        $querySQL .= " name;";
    } else {
        $querySQL .= $lookFor . ";";
    }

// file_put_contents('StadienSucheFelderDS.txt', $querySQL);

    $rs = $dbSyb->Execute($querySQL); //=>>> Abfrage wird an den Server übermittelt / ausgeführt?

    $data = array();

    if (!$rs) {
        // keine Query hat nicht funtioniert
        //print("Query 1: " . $dbSyb->ErrorMsg());
        //
    //>> [1] Fehlermeldung: INSERT-Fehler
        $out = array();

        $out{'response'}{'data'} = $data;
        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('land' => ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
    }

    $i = 0;

    while (!$rs->EOF) {

        if (isset($rs->fields{'land'})) {
            If ($rs->fields{'erstbesuch'} != '01.01.1900') {
                $data{$i}{"land"} = ($rs->fields{'land'}) /*. " - " . $rs->fields{'erstbesuch'} . " Nr: " . $rs->fields{'laenderpunkt_nr'}*/;
            } else {
                $data{$i}{"land"} = ($rs->fields{'land'});
            }
        }

        if (isset($rs->fields{'code'})) {
            $data{$i}{"code"} = ($rs->fields{'code'});
        }

        if (isset($rs->fields{'stadionname'})) {
            $data{$i}{"stadionname"} = ($rs->fields{'stadionname'});
        }

        if (isset($rs->fields{'stadion_id'})) {
            $data{$i}{"stadion_id"} = $rs->fields{'stadion_id'};
        }

        if (isset($rs->fields{'ort'})) {
            $data{$i}{"ort"} = ($rs->fields{'ort'});
        }

        if (isset($rs->fields{'ort_id'})) {
            $data{$i}{"ort_id"} = ($rs->fields{'ort_id'});
        }

        if (isset($rs->fields{'stadtteil'})) {
            $data{$i}{"stadtteil"} = ($rs->fields{'stadtteil'});
        }

        if (isset($rs->fields{'bundesland'})) {
            $data{$i}{"bundesland"} = ($rs->fields{'bundesland'});
        }

        if (isset($rs->fields{'bundesland_id'})) {
            $data{$i}{"bundesland_id"} = ($rs->fields{'bundesland_id'});
        }

        if (isset($rs->fields{'name'})) {
            $data{$i}{"name"} = ($rs->fields{'name'});
        }

        if (isset($rs->fields{'anzahl'})) {
            $data{$i}{"anzahl"} = $rs->fields{'anzahl'};
        }

        $i++;
        $rs->MoveNext();
    }

    $rs->Close();

    $out{'response'}{'data'} = $data;
    $out{'response'}{'status'} = 0;
    $out{'response'}{'errors'} = array();

    print json_encode($out);
} else {
    header("Location: http://$host$uri/noadmin.php");
}
?>