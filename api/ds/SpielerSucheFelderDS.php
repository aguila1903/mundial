<?php
session_start();

require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');
header("Cache-Control: no-cache, must-revalidate");
$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");

if (isset($_SESSION["login"]) && $_SESSION["login"] == login) {

    /*     * *****************************************************************************
      System: infotool - SVK-Versaende
      Funktion: Versandfehler anzeigen
      Autor: jra
      pos_id: 04.12.2012

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


if (isset($_REQUEST["lookFor"])) {
    $lookFor = $_REQUEST["lookFor"];
} else {
    $lookFor = "";
}


if (isset($_REQUEST["name"])) {
        $name = $_REQUEST["name"];
        if ($name == "null" || $name == "") {
           $andName = "";
        } else {
            
        // $andName = " and concat(ifnull(s.vorname,''),' ',s.name) = " . $dbSyb->Quote(($name));
		$andName = " and s.name = " . $dbSyb->Quote(($name));
        }
    } else {
        $andName = "";
    }
	
	if (isset($_REQUEST["vorname"])) {
        $vorname = $_REQUEST["vorname"];
        if ($vorname == "null" || $vorname == "") {
           $andVorName = "";
        } else {
            
        $andVorName = " and s.vorname = " . $dbSyb->Quote(($vorname));
        }
    } else {
        $andVorName = "";
    }

    if (isset($_REQUEST["land"])) {
	$land = $_REQUEST["land"];
	if ($land == "null" || $land == "") {
            $andLand = "";
        }else{
        
        $andLand = " and s.land = " . $dbSyb->Quote(($land));}
    }  else {
        $andLand = "";
    }

    if (isset($_REQUEST["nati_spieler"])) {
        $nati_spieler = $_REQUEST["nati_spieler"];
        if ($nati_spieler == "null" || $nati_spieler == "") {
            $andNati = "";
        }else{
		
        $andNati = " and s.nati_spieler = " . $nati_spieler;
		}
    }
 else {
    $andNati = "";
}

if (isset($_REQUEST["pos_id"])) {
$pos_id = $_REQUEST["pos_id"];
 if ($pos_id == "null" || $pos_id == "") {
            $andPos = "";
        }else{
    
    $andPos = " and s.position = " . $dbSyb->Quote(($pos_id));}
   
} else {
    $andPos = "";
}

// if (isset($_REQUEST["verein_id"])) {
// $verein_id = $_REQUEST["verein_id"];
 // if ($verein_id == "null" || $verein_id == "") {
            // $andVerein = "";
        // }else{
    
    // $andVerein = " and sv.verein_id = " . $dbSyb->Quote(($verein_id));}
   
// } else {
    // $andVerein = "";
// }




$querySQL = "select distinct ";

if ($lookFor == "name") {
    // $querySQL .= " concat(ifnull(s.vorname,''),' ',s.name) as spielername ";
	$querySQL .= " ifnull(s.name,'') as spielername ";
}
if ($lookFor == "vorname") {
    $querySQL .= " ifnull(s.vorname,'') as vorname ";
}
if ($lookFor == "land") {
    $querySQL .= "  Ifnull(de,s.land) as land, s.land as code ";
}
if ($lookFor == "pos_id") {
    $querySQL .= " ifnull(s.position, '') as position, ifnull(p.pos_bez, '') as pos_bez ";
}

if ($lookFor == "nati_spieler") {
    $querySQL .= " s.nati_spieler ";
}

// if ($lookFor == "verein_id") {
    // $querySQL .=  " sv.verein_id, v.vereinsname ";
// }

$querySQL .= " From spieler s left join laender l on land = l.code 
		left join pos_bez p on position = pos_id Where spieler_id > -1 "
      // . " left join  verein_spieler_tabelle sv on s.spieler_id = sv.spieler_id
		 // join vereine v on sv.verein_id = v.verein_id  "          
			 // . $andVerein
			 . $andLand
			 . $andNati
			 . $andPos
			 . $andName  
			 . $andVorName
			 ." Order by ";
		if($lookFor == "pos_id"){
		$querySQL .= " pos_bez;";}
		else{
				$querySQL .= $lookFor.";" ;
		}

// file_put_contents('SpielerSucheFelderDS.txt', $querySQL);

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
   
    if(isset($rs->fields{'land'})){        
    $data{$i}{"land"} = ($rs->fields{'land'});}
    
    if(isset($rs->fields{'code'})){        
    $data{$i}{"code"} = ($rs->fields{'code'});}  
	  
    if(isset($rs->fields{'spielername'})){
    $data{$i}{"spielername"} = trim(($rs->fields{'spielername'}));}
	
	if(isset($rs->fields{'vorname'})){
    $data{$i}{"vorname"} = trim(($rs->fields{'vorname'}));}
    
    if(isset($rs->fields{'position'})){
    $data{$i}{"pos_id"} = ($rs->fields{'position'});}
	
	if(isset($rs->fields{'pos_bez'})){
    $data{$i}{"pos_bez"} = ($rs->fields{'pos_bez'});}
    
    // if(isset($rs->fields{'verein_id'})){
    // $data{$i}{"verein_id"} = ($rs->fields{'verein_id'});}
	
	// if(isset($rs->fields{'vereinsname'})){
    // $data{$i}{"vereinsname"} = ($rs->fields{'vereinsname'});}
	
	if(isset($rs->fields{'nati_spieler'})){
    $data{$i}{"nati_spieler"} = $rs->fields{'nati_spieler'};}
     
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