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


if (isset($_REQUEST["name"])) {
        $StadionName = $_REQUEST["name"];
        if ($StadionName == "null" || $StadionName == "") {
           $andName = "";
        } else {
            
        $andName = " and s.name = " . $dbSyb->Quote(($StadionName));
        }
    } else {
        $andName = "";
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
    $querySQL .= " s.name ";
}
if ($lookFor == "land") {
    $querySQL .= "  Ifnull(de,s.land) as land, s.land as code ";
}

// if ($lookFor == "verein_id") {
    // $querySQL .=  " sv.verein_id, v.vereinsname ";
// }

$querySQL .= " From schiris s left join laender l on land = l.code Where schiri_id > -1 "
        // ." left join  verein_trainer_tabelle sv on s.schiri_id = sv.schiri_id "
		// ." join vereine v on sv.verein_id = v.verein_id  "          
			 // . $andVerein
			 . $andLand
			 . $andName
			 ." Order by ".$lookFor.";" ;

// file_put_contents('TrainerSucheFelderDS.txt', $querySQL);

$rs = $dbSyb->Execute($querySQL); //=>>> Abfrage wird an den Server übermittelt / ausgeführt?

$data = array();

if (!$rs) {
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
	  
    if(isset($rs->fields{'name'})){
    $data{$i}{"name"} = ($rs->fields{'name'});}
    
	
		
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