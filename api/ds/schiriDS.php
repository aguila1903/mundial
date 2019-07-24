<?php
session_start();

require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');
header("Cache-Control: no-cache, must-revalidate");
$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");






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
            
        $andName = " and name = " . $dbSyb->Quote(($andName));
        }
    } else {
        $andName = "";
    }

    if (isset($_REQUEST["land"])) {
	$land = $_REQUEST["land"];
	if ($land == "null" || $land == "" ) {
            $andLand = "";
        }
		else{        
        
		$andLand = " and s.land = ". $dbSyb->Quote(($land));}
    }  	
	else {
       $andLand = "";
    }

  

if (isset($_REQUEST["freieSuche"])) {
    $freieSuche = $_REQUEST["freieSuche"];
    $likeFreieSuche = " and name like '%" . $freieSuche . "%'";
  
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
    // $andVerein = " Where s.schiri_id > -1 ";
// }

    $querySQL = "SELECT Distinct "         
        . "	s.schiri_id "
        . ", s.name "
		. ", v.vereinsname "
		. ", s.verein_id "
		. ", o.ort "
		. ", s.ort_id "
		. ", DATE_FORMAT(geb_datum,GET_FORMAT(DATE,'EUR')) as geb_datum "
		. ", (select count(*) from sp_besuche where schiri_id = s.schiri_id) as anzahl "
		. ", Ifnull(de, s.land) as land, l.code "		
        . "  From schiris s left join laender l on land = l.code " 		
        // . " left join  verein_trainer_tabelle sv on s.schiri_id = sv.schiri_id "
		." left join vereine v on s.verein_id = v.verein_id "  
		." left join orte o on s.ort_id = o.ort_id  Where schiri_id > -1 "         
			 // . $andVerein
			 . $andLand
			 . $andName
			 . $likeFreieSuche
			 . " Order by land, name; "
        ;


// $fp = fopen("schiriDS.txt", "w"); 
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
		$data{$i}{"geb_datum"} = trim($rs->fields{'geb_datum'});
        $data{$i}{"schiri_id"} = trim($rs->fields{'schiri_id'});
		$data{$i}{"verein_id"} = trim($rs->fields{'verein_id'});
		$data{$i}{"vereinsname"} = ($rs->fields{'vereinsname'});
		$data{$i}{"ort_id"} = trim($rs->fields{'ort_id'});
		$data{$i}{"ort"} = ($rs->fields{'ort'});
		$data{$i}{"name"} = ($rs->fields{'name'});		
		$data{$i}{"land"} = (trim($rs->fields{'land'}));
		$data{$i}{"code"} = (trim($rs->fields{'code'}));
		$data{$i}{"anzahl"} = trim($rs->fields{'anzahl'});
        
        $i++;

        $rs->MoveNext();
    }

    $rs->Close();


    $out{'response'}{'status'} = 0;
    $out{'response'}{'errors'} = array();
    $out{'response'}{'data'} = $data;

    print json_encode($out);
}

?>