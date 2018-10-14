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
$dbSyb->Connect('localhost', user, psw, db); //=>>> Verbindungsaufbau mit der DB


if (!$dbSyb->IsConnected()) {


    print ("Anmeldung: " . $dbSyb->ErrorMsg());

    $data = array();

    return ($data);
}

$dbSyb->debug = false;
$out = array();



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

if (isset($_REQUEST["jahr"])) {
    $jahr = $_REQUEST["jahr"];
	$Where = " and YEAR(sp_datum) = " . $jahr. " and spiel_id != ".$spiel_id ;
    if ($jahr != "null" && $jahr != "") {
        if ((preg_match("/^[0-9]{4}?$/", trim($jahr))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('jahr' => "Bitte das Jahr prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $Where = "";
    }
} else {
    $Where = "";
}




    $querySQL = "SELECT Distinct "         
        . "	sp.spiel_id "
		. ", DATE_FORMAT(sp.sp_datum,GET_FORMAT(DATE,'EUR')) as sp_datum "
		. ", sp.erg_halb "
		. ", sp.erg_zusatz "
		. ", sp.erg_elfer "
		. ", w.liga_bez as wettbewerb "
		. ", ergebnis "
		. ", sl.stadionname "
		. ", va.gaengiger_name AS verein_a "
		. ", vh.gaengiger_name AS verein_h "
		. ", sn.name_vor_ae as stadionname_alt "
		. ", sp.wettbewerb_zusatz "
		. "  From sp_besuche sp " 		
        ." left join schiris s on sp.schiri_id = s.schiri_id "
		." left join ligen w on w.liga_id = sp.liga_id " 
        ." Left join vereine vh on vh.verein_id = sp.verein_id_h " 
        ." Left join vereine va on va.verein_id = sp.verein_id_a" 	
		." Left Join stadionliste sl on sl.stadion_id = sp.stadion_id " 
		." Left join stadionnamen sn on sp.stadion_id_alt = sn.lfd_nr"
        ." WHERE  spiel_id > -1 "
			 . $Where
			 . " Order by Year(sp_datum); "
        ;


// $fp = fopen("spieleDS.txt", "w"); 
// fputs($fp, $querySQL);             
// fclose($fp); 


$rs = $dbSyb->Execute($querySQL);



$data = array();

if (!$rs) {
  
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => "Es ist ein Fehler aufgetreten.");

    print json_encode($out);
    return;
}

else {

    $i = 0;

    while (!$rs->EOF) { 
		$data{$i}{"spiel_id"} = trim($rs->fields{'spiel_id'});
		$data{$i}{"stadionname_alt"} = ($rs->fields{'stadionname_alt'});	
		$data{$i}{"wettbewerb_zusatz"} = ($rs->fields{'wettbewerb_zusatz'});			
		$data{$i}{"stadionname"} = ($rs->fields{'stadionname'});	
		
		if(strlen(trim($rs->fields{'erg_zusatz'})) > 0 ){
			
			if(trim($rs->fields{'erg_zusatz'}) == "n. V."){
			$data{$i}{"spiel"} = trim($rs->fields{'sp_datum'})." - ".($rs->fields{'wettbewerb'})." - ". ($rs->fields{'verein_h'}).' - '. ($rs->fields{'verein_a'})." ". trim($rs->fields{'ergebnis'})." ".trim($rs->fields{'erg_zusatz'});
			}
			if(trim($rs->fields{'erg_zusatz'}) == "i. E."){
			$data{$i}{"spiel"} = trim($rs->fields{'sp_datum'})." - ".($rs->fields{'wettbewerb'})." - ". ($rs->fields{'verein_h'}).' - '. ($rs->fields{'verein_a'})." ". trim($rs->fields{'ergebnis'}).' '.trim($rs->fields{'erg_elfer'})." ".trim($rs->fields{'erg_zusatz'});
			}
			if(trim($rs->fields{'erg_zusatz'}) == "nvUiE"){
			$data{$i}{"spiel"} = trim($rs->fields{'sp_datum'})." - ".($rs->fields{'wettbewerb'})." - ". ($rs->fields{'verein_h'}).' - '. ($rs->fields{'verein_a'})." ". trim($rs->fields{'ergebnis'})." n.V. ".trim($rs->fields{'erg_elfer'})." i. E.";
			}
			
			// $data{$i}{"spiel"} = trim($rs->fields{'sp_datum'})." - ".($rs->fields{'wettbewerb'})." - ". ($rs->fields{'verein_h'}).' - '. ($rs->fields{'verein_a'})." ". trim($rs->fields{'ergebnis'})." ".trim($rs->fields{'erg_zusatz'});
		}else{			
			$data{$i}{"spiel"} = trim($rs->fields{'sp_datum'})." - ".($rs->fields{'wettbewerb'})." - ". ($rs->fields{'verein_h'}).' - '. ($rs->fields{'verein_a'})." ".trim($rs->fields{'ergebnis'});
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
    header("Location: http://$host/mundial/noadmin.php");
}
?>