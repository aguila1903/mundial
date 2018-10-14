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
$dbSyb->Connect('localhost', user, psw, db); //=>>> Verbindungsaufbau mit der DB


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
    // $andVerein = " Where s.trainer_id > -1 ";
// }

    $querySQL = "SELECT Distinct "         
        . "	trainer_id "
        . ", name "
		// . ", vereinsname "
		// . ", sv.verein_id "
		. ", DATE_FORMAT(geb_datum,GET_FORMAT(DATE,'EUR')) as geb_datum "
		. ", Ifnull(de, s.land) as land, l.code "		
		. ", (select count(*) from sp_besuche where trainer_id_h = s.trainer_id ) + (select count(*) from sp_besuche where trainer_id_a = s.trainer_id ) as anzahl "
        . "  From trainer s left join laender l on land = l.code Where trainer_id > -1 " 		
        // . " left join  verein_trainer_tabelle sv on s.trainer_id = sv.trainer_id "
		// ." left join vereine v on sv.verein_id = v.verein_id "          
			 // . $andVerein
			 . $andLand
			 . $andName
			 . $likeFreieSuche
			 . " Order by land, name; "
        ;


// $fp = fopen("trainerDS.txt", "w"); 
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
        $data{$i}{"trainer_id"} = trim($rs->fields{'trainer_id'});
		// $data{$i}{"verein_id"} = trim($rs->fields{'verein_id'});
		// $data{$i}{"vereinsname"} = ($rs->fields{'vereinsname'});
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