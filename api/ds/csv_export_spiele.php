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


// $Where = " Where land != 'nb' ";


if (isset($_REQUEST["stadionname"])) {
        $stadion_id = $_REQUEST["stadionname"];
        if ($stadion_id == "null" || $stadion_id == "" || $stadion_id == "undefined") {
           $andStadionName = "";
        } else {
            
        $andStadionName = " and sp.stadion_id = " . $stadion_id;
        }
    } else {
        $andStadionName = "";
    }

    if (isset($_REQUEST["land"])) {
	$land = $_REQUEST["land"];
	if ($land == "null" || $land == "" || $land == "undefined") {
            $andLand = "";
        }else{
        
        $andLand = " and sp.land = " . $dbSyb->Quote(($land));}
    }  else {
        $andLand = "";
    }

    if (isset($_REQUEST["ort"])) {
        $ort = $_REQUEST["ort"];
        if ($ort == "null" || $ort == "" || $ort == "undefined") {
            $andOrt = "";
        }else{
		
        $andOrt = " and sp.ort = " . $ort;
		}
    }
 else {
    $andOrt = "";
}

if (isset($_REQUEST["spieler_id"])) {
$spieler_id = $_REQUEST["spieler_id"];
 if ($spieler_id == "null" || $spieler_id == "" || $spieler_id == "undefined") {
            $andSpieler = "";
        }else{
    
    $andSpieler = " and ss.spieler_id = " . $spieler_id;}
   
} else {
    $andSpieler = "";
}

if (isset($_REQUEST["trainer_id"])) {
$trainer_id = $_REQUEST["trainer_id"];
 if ($trainer_id == "null" || $trainer_id == "" || $trainer_id == "undefined") {
            $andTrainer = "";
        }else{
    
    $andTrainer = " and sp.trainer_id_a  = " . $trainer_id ." or sp.trainer_id_h = " . $trainer_id;}
   
} else {
    $andTrainer = "";
}

if (isset($_REQUEST["verein_id"])) {
$verein_id = $_REQUEST["verein_id"];
 if ($verein_id == "null" || $verein_id == "" || $verein_id == "undefined") {
            $andVerein = "";
        }else{
    
    $andVerein = " and sp.verein_id_a  = " . $verein_id ." or sp.verein_id_h = " . $verein_id;}
   
} else {
    $andVerein = "";
}

if (isset($_REQUEST["schiri_id"])) {
$schiri_id = $_REQUEST["schiri_id"];
 if ($schiri_id == "null" || $schiri_id == "" || $schiri_id == "undefined") {
            $andSchiri = "";
        }else{
    
    $andSchiri = " and sp.schiri_id  = " . $schiri_id;}
   
} else {
    $andSchiri = "";
}

if (isset($_REQUEST["ergebnis"])) {
$ergebnis = $_REQUEST["ergebnis"];
 if ($ergebnis == "null" || $ergebnis == "" || $ergebnis == "undefined") {
            $andErgebnis = "";
        }else{
    
    $andErgebnis = " and sp.ergebnis  = " . $dbSyb->Quote($ergebnis);}
   
} else {
    $andErgebnis = "";
}

if (isset($_REQUEST["erg_zusatz"])) {
$erg_zusatz = $_REQUEST["erg_zusatz"];
 if ($erg_zusatz == "null" || $erg_zusatz == "" || $erg_zusatz == "undefined") {
            $andErg_Zusatz = "";
        }else{
    
    $andErg_Zusatz = " and sp.erg_zusatz  = " . $dbSyb->Quote($erg_zusatz);}
   
} else {
    $andErg_Zusatz = "";
}

if (isset($_REQUEST["wettbewerb"])) {
$liga_id = $_REQUEST["wettbewerb"];
 if ($liga_id == "null" || $liga_id == "" || $liga_id == "undefined") {
            $andWettbewerb = "";
        }else{
    
    $andWettbewerb = " and sp.liga_id  = " . $liga_id;}
   
} else {
    $andWettbewerb = "";
}

if (isset($_REQUEST["begleiter_id"])) {
$begleiter_id = $_REQUEST["begleiter_id"];
 if ($begleiter_id == "null" || $begleiter_id == "" || $begleiter_id == "undefined") {
            $andBegleiter = "";
        }else{
    
    $andBegleiter = " and bs.begleiter_id  = " . $begleiter_id;}
   
} else {
    $andBegleiter = "";
}

if (isset($_REQUEST["sp_datum"])) {
$sp_datum = $_REQUEST["sp_datum"];
 if ($sp_datum == "null" || $sp_datum == "" || $sp_datum == "undefined") {
            $andDatum = "";
        }else{
    
    $andDatum = " and DATE_FORMAT(sp.sp_datum,GET_FORMAT(DATE,'EUR'))  = " . $dbSyb->Quote($sp_datum);}
   
} else {
    $andDatum = "";
}


if (isset($_REQUEST["jahr"])) {
$jahr = $_REQUEST["jahr"];
 if ($jahr == "null" || $jahr == "" || $jahr == "undefined") {
            $andJahr = "";
        }else{
    
    $andJahr = " and Year(sp.sp_datum) = " . $dbSyb->Quote($jahr);}
   
} else {
    $andJahr = "";
}

if (isset($_REQUEST["ausverkauft"])) {
$ausverkauft = $_REQUEST["ausverkauft"];
 if ($ausverkauft == "null" || $ausverkauft == "" || $ausverkauft == "undefined") {
            $andAusverkauft = "";
        }else{
    
    $andAusverkauft = " and sp.ausverkauft = " . $ausverkauft;}
   
} else {
    $andAusverkauft = "";
}
  

if (isset($_REQUEST["freieSuche"])) {
    $freieSuche = $_REQUEST["freieSuche"];
    $likeFreieSuche = " and vh.gaengiger_name like '%" . $freieSuche . "%' or va.gaengiger_name  like '%".$freieSuche ."%'" ;
  
} else {
    $likeFreieSuche = "";
}

if (isset($_REQUEST["freieSucheStad"])) {
    $freieSucheStad = $_REQUEST["freieSucheStad"];
    $freieSucheStad = " and sl.stadionname like '%" . $freieSucheStad . "%' or name_vor_ae like '%". $freieSucheStad . "%'";
  
} else {
    $freieSucheStad = "";
}



    $querySQL = "SELECT Distinct "         
        . "	sp.spiel_id "
        . ", sp.zusch_anzahl "
		. ", sp.gaestefans "
		. ", sp.bes_vork "
		. ", sp.sp_bericht "
		. ", sp.schiri_id"
		. ", sp.ausverkauft"
		. ", s.name "
		. ", DATE_FORMAT(sp.sp_datum,GET_FORMAT(DATE,'EUR')) as sp_datum "
		. ", case weekday(sp.sp_datum) When 0 Then 'Montag' When 1 Then 'Dienstag' When 2 Then 'Mittwoch' When 3 Then 'Donnerstag' When 4 Then 'Freitag' When 5 Then 'Samstag' When 6 Then 'Sonntag' End as wochentag "
		. ", sp.ort as ort_id "
		. ", o.ort "
		. ", l.de as land "
		. ", sp.land as code "		
        . ", sp.liga_id "	
		. ", w.liga_bez as wettbewerb "
		. ", w.zusatz "
		. ", sp.zeit "
		. ", ergebnis "
		. ", sp.verein_id_h "
		. ", sp.verein_id_a "
		. ", va.gaengiger_name AS verein_a "
		. ", vh.gaengiger_name AS verein_h "
		. ", sp.stadion_id "
		. ", sl.stadionname "
		. ", sl.kapazitaet "
		. ", sl.anschrift "
		. ", sp.trainer_id_h "
		. ", sp.trainer_id_a "
		. ", s.name as schiri "
		. ", (select vs.gaengiger_name from vereine vs left join schiris ss on vs.verein_id = ss.verein_id where ss.schiri_id = sp.schiri_id) as schiri_verein "
		. ", ta.name as trainer_a "
		. ", th.name as trainer_h "
		. ", sp.stadion_id_alt "
		. ", sp.erg_halb "
		. ", sp.erg_elfer "
		. ", sp.sprit "
		. ", sp.bahn "
		. ", sp.flieger "
		. ", sp.uebernachtung "
		. ", sp.verpflegung "
		. ", sp.sonstige "
		. ", sp.eintrittskarte "
		. ", sp.sonstige+sp.bahn+sp.eintrittskarte+sp.flieger+sp.uebernachtung+sp.verpflegung+sp.sprit as ges_kosten "
		. ", sp.erg_zusatz "
		. ", sn.name_vor_ae as stadionname_alt "
		. ", sp.wettbewerb_zusatz "
		. ", sp.nr as anzahl "
		. "  From sp_besuche sp left join laender l on sp.land = l.code " 		
        ." left join schiris s on sp.schiri_id = s.schiri_id "
		." left join ligen w on w.liga_id = sp.liga_id " 
		." left join orte o on sp.ort = o.ort_id "  
        ." Left join vereine vh on vh.verein_id = sp.verein_id_h " 
        ." Left join vereine va on va.verein_id = sp.verein_id_a" 
		." Left join trainer th on th.trainer_id = sp.trainer_id_h " 
        ." Left join trainer ta on ta.trainer_id = sp.trainer_id_a"	
		." Left Join stadionliste sl on sl.stadion_id = sp.stadion_id " 
		." Left join stadionnamen sn on sp.stadion_id_alt = sn.lfd_nr"
		." LEFT JOIN sp_spieler_spiel_tabelle ss on ss.spiel_id = sp.spiel_id "
        ." LEFT JOIN spieler spi on spi.spieler_id = ss.spieler_id "
		." LEFT JOIN sp_begleiter_spiel_tabelle bs on bs.spiel_id = sp.spiel_id "
		." LEFT Join begleiter b on b.begleiter_id = bs.begleiter_id "
        ." WHERE  sp.spiel_id > -1 "		
			 . $andVerein
			 . $andLand
			 . $andStadionName
			 . $andOrt
			 . $andJahr
			 . $andDatum 
			 . $andBegleiter
			 . $andWettbewerb
			 . $andErg_Zusatz 
			 . $andErgebnis
			 . $andSchiri
			 . $andTrainer
			 . $andSpieler			
			 . $andAusverkauft
			 . $likeFreieSuche
			 . $freieSucheStad			 
			 . " Order by sp.sp_datum desc, zeit desc; "
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
$export = "Nr.; Datum; Begegnung; Ergebnis; Wettbewerb; Runde / Spieltag; Spielstätte; Zuschauer; Ort; Land\r\n";
    $i = 0;
	// $ii = 1;
    while (!$rs->EOF) { 
		$data{$i}{"spiel_id"} = trim($rs->fields{'spiel_id'});
		$data{$i}{"stadion_id_alt"} = trim($rs->fields{'stadion_id_alt'});
		$data{$i}{"stadionname_alt"} = ($rs->fields{'stadionname_alt'});
		$data{$i}{"stadion_id"} = trim($rs->fields{'stadion_id'});
		$data{$i}{"zeit"} = trim($rs->fields{'zeit'});
		$data{$i}{"trainer_id_a"} = trim($rs->fields{'trainer_id_a'});
		$data{$i}{"trainer_id_h"} = trim($rs->fields{'trainer_id_h'});		
		$data{$i}{"schiri_verein"} = ($rs->fields{'schiri_verein'});
		$data{$i}{"wochentag"} = ($rs->fields{'wochentag'});
		$data{$i}{"wettbewerb_zusatz"} = ($rs->fields{'wettbewerb_zusatz'});
		$data{$i}{"anschrift"} = ($rs->fields{'anschrift'});
		$data{$i}{"trainer_a"} = ($rs->fields{'trainer_a'});
		$data{$i}{"trainer_h"} = ($rs->fields{'trainer_h'});
		$data{$i}{"zusch_anzahl"} = number_format(trim($rs->fields{'zusch_anzahl'}), 0, ',', '.');
		$data{$i}{"gaestefans"} = number_format(trim($rs->fields{'gaestefans'}), 0, ',', '.');
		// $data{$i}{"erg_a"} = trim($rs->fields{'erg_a'});
		// $data{$i}{"erg_h"} = trim($rs->fields{'erg_h'});
		$data{$i}{"verein_id_a"} = trim($rs->fields{'verein_id_a'});
		$data{$i}{"verein_id_h"} = trim($rs->fields{'verein_id_h'});		
		$data{$i}{"paarung"} = ($rs->fields{'verein_h'}).' - '. ($rs->fields{'verein_a'});
		$data{$i}{"sp_datum"} = trim($rs->fields{'sp_datum'});
        $data{$i}{"schiri_id"} = trim($rs->fields{'schiri_id'});
		$data{$i}{"schiri"} = ($rs->fields{'schiri'});
		$data{$i}{"name"} = ($rs->fields{'name'});
		$data{$i}{"liga_id"} = trim($rs->fields{'liga_id'});		
		$data{$i}{"ort_id"} = trim($rs->fields{'ort_id'});
		$data{$i}{"ort"} = ($rs->fields{'ort'});
		$data{$i}{"sp_bericht"} = ($rs->fields{'sp_bericht'});
		$data{$i}{"bes_vork"} = ($rs->fields{'bes_vork'});		
		$data{$i}{"land"} = ($rs->fields{'land'});
		$data{$i}{"code"} = ($rs->fields{'code'});
		$data{$i}{"verein_a"} = ($rs->fields{'verein_a'});
		$data{$i}{"verein_h"} = ($rs->fields{'verein_h'});
		$data{$i}{"erg"} = trim($rs->fields{'ergebnis'});
		$data{$i}{"erg_elfer"} = trim($rs->fields{'erg_elfer'});
		$data{$i}{"erg_halb"} = trim($rs->fields{'erg_halb'});
		$data{$i}{"erg_zusatz"} = trim($rs->fields{'erg_zusatz'});
		$data{$i}{"sprit"} =  number_format($rs->fields{'sprit'}, 2, ',', '.');
		$data{$i}{"bahn"} =  number_format($rs->fields{'bahn'}, 2, ',', '.');
		$data{$i}{"flieger"} =  number_format($rs->fields{'flieger'}, 2, ',', '.');
		$data{$i}{"verpflegung"} =  number_format($rs->fields{'verpflegung'}, 2, ',', '.');
		$data{$i}{"uebernachtung"} =  number_format($rs->fields{'uebernachtung'}, 2, ',', '.');
		$data{$i}{"sonstige"} = number_format($rs->fields{'sonstige'}, 2, ',', '.');
		$data{$i}{"ges_kosten"} = number_format($rs->fields{'ges_kosten'}, 2, ',', '.');
		$data{$i}{"eintrittskarte"} = number_format($rs->fields{'eintrittskarte'}, 2, ',', '.');
		$data{$i}{"ausverkauft"} = trim($rs->fields{'ausverkauft'});
		
		
		if(strlen(trim($rs->fields{'zusatz'})) > 0 ){			
			$data{$i}{"wettbewerb"} = ($rs->fields{'wettbewerb'}). " (".($rs->fields{'zusatz'}).")";
		}else{			
			$data{$i}{"wettbewerb"} = ($rs->fields{'wettbewerb'});
        }
		
		
		if(strlen(trim($rs->fields{'kapazitaet'})) == 0 || trim($rs->fields{'kapazitaet'}) == '' || trim($rs->fields{'kapazitaet'}) == 'NULL' || trim($rs->fields{'kapazitaet'}) == null ){		
			
			if(strlen(trim($rs->fields{'stadionname_alt'})) == 0 || trim($rs->fields{'stadionname_alt'}) == '' || trim($rs->fields{'stadionname_alt'}) == 'NULL' || trim($rs->fields{'stadionname_alt'}) == null ){
				$data{$i}{"stadionname"} = ($rs->fields{'stadionname'});
			}else{
				$data{$i}{"stadionname"} = ($rs->fields{'stadionname'}). ' ('.($rs->fields{'stadionname_alt'}).")";
			}
		}
		
		else{	
			if(strlen(trim($rs->fields{'stadionname_alt'})) == 0 || trim($rs->fields{'stadionname_alt'}) == '' || trim($rs->fields{'stadionname_alt'}) == 'NULL' || trim($rs->fields{'stadionname_alt'}) == null ){
				$data{$i}{"stadionname"} = ($rs->fields{'stadionname'}). ' ('.number_format(trim($rs->fields{'kapazitaet'}), 0, ',', '.').')';
			}else{
				$data{$i}{"stadionname"} = ($rs->fields{'stadionname'}). ' ('.number_format(trim($rs->fields{'kapazitaet'}), 0, ',', '.').') ('.($rs->fields{'stadionname_alt'}).")";
			}	
			
        }
		
		if(strlen(trim($rs->fields{'erg_zusatz'})) > 0 ){
			if(trim($rs->fields{'erg_zusatz'}) == "n. V."){
			$data{$i}{"ergebnis"} = trim($rs->fields{'ergebnis'}).' ('.trim($rs->fields{'erg_halb'}).") ".trim($rs->fields{'erg_zusatz'});
			}
			if(trim($rs->fields{'erg_zusatz'}) == "i. E."){
			$data{$i}{"ergebnis"} = trim($rs->fields{'ergebnis'}).' ('.trim($rs->fields{'erg_halb'}).") ".trim($rs->fields{'erg_elfer'})." ".trim($rs->fields{'erg_zusatz'});
			}
			if(trim($rs->fields{'erg_zusatz'}) == "nvUiE"){
			$data{$i}{"ergebnis"} = trim($rs->fields{'ergebnis'}).' ('.trim($rs->fields{'erg_halb'}).") n.V. ".trim($rs->fields{'erg_elfer'})." i. E.";
			}
		}else{			
			$data{$i}{"ergebnis"} = trim($rs->fields{'ergebnis'}).' ('.trim($rs->fields{'erg_halb'}).")";
        }
		$data{$i}{"nummer"} = $rs->fields{'anzahl'};
		
		$export .= $data{$i}{"nummer"} .";". $data{$i}{"sp_datum"} . ";" . $data{$i}{"paarung"} . ";" . $data{$i}{"ergebnis"} . ";" 
            . $data{$i}{"wettbewerb"} . ";" .$data{$i}{"wettbewerb_zusatz"} . ";" . $data{$i}{"stadionname"} . ";" . $data{$i}{"zusch_anzahl"} . ";" 
            . $data{$i}{"ort"} . ";" . $data{$i}{"land"}. "\r\n";
		
        $i++;
		// $ii++;

        $rs->MoveNext();
    }

    $rs->Close();


   file_put_contents("SpieleListe.csv", ($export));
   
   header("Location: SpieleListe.csv");
}
} else {
    header("Location: http://$host/kartal/noadmin.php");
}
?>