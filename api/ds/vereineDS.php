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

if (isset($_REQUEST["vereinsname"])) {
        $andVereinsName = $_REQUEST["vereinsname"];
        if ($andVereinsName == "null" || $andVereinsName == "") {
           $andVereinsName = "";
        } else {
            
        // $andVereinsName = " and vereinsname = " . $dbSyb->Quote(($andVereinsName));
		$andVereinsName = " and vereinsname like '%" . ($andVereinsName)."%'";
        }
    } else {
        $andVereinsName = "";
    }

	if (isset($_REQUEST["verein_id"])) {
        $andVereinID = $_REQUEST["verein_id"];
        if ($andVereinID == "null" || trim($andVereinID) == "") {
           $andVereinID = "";
        } else {
            
		$andVereinID = " and v.verein_id = " . $andVereinID;
        }
    } else {
        $andVereinID = "";
    }
	
    if (isset($_REQUEST["land"])) {
	$land = $_REQUEST["land"];
	if ($land == "null" || $land == "" ) {
            $andLand = "";
        }
		else{        
        
		$andLand = " and l.code = ". $dbSyb->Quote(($land));}
    }  	
	else {
       $andLand = "";
    }

    if (isset($_REQUEST["ort"])) {
        $ort = $_REQUEST["ort"];
        if ($ort == "null" && $ort == "") {
            $andOrt = "";
        }else{		
        $andOrt = " and v.ort = " . $dbSyb->Quote(($ort));
		}
    }
 else {
    $andOrt = "";
}

if (isset($_REQUEST["stadtteil"])) {
$stadtteil = $_REQUEST["stadtteil"];
 if ($stadtteil == "null" || $stadtteil == "") {
            $andStadtTeil = "";
        }else{
    
    $andStadtTeil = " and stadtteil = " . $dbSyb->Quote(($stadtteil));}
   
} else {
    $andStadtTeil = "";
}


if (isset($_REQUEST["freieSuche"])) {
    $freieSuche = $_REQUEST["freieSuche"];
    $likeFreieSuche = " and vereinsname like '%" . $freieSuche . "%' or spitzname like '%" . $freieSuche . "%'". " or gaengiger_name like '%" . $freieSuche . "%' or name_vor_ae like '%". $freieSuche . "%'";
  
} else {
    $likeFreieSuche = "";
}



if (isset($_REQUEST["stadion_id"])) {
    $stadion_id = $_REQUEST["stadion_id"];
    $Where =" Where v.verein_id not in ((Select verein_id from stad_verein_tabelle where stadion_id = ". $stadion_id." )) ".$andLand;
}else {
    $Where = " Where v.verein_id > -1 ";
}

    $querySQL = "SELECT Distinct "         
        . "	v.verein_id "
		. ", (select count(*) from sp_besuche where verein_id_a = v.verein_id or verein_id_h = v.verein_id ) as anzahl "
        . ", gaengiger_name as vereinsname "
		. ", vereinsname as offizieller_name "
		. ", spitzname "
		// . ", land "
		. ", o.ort "
		. ", o.ort_id "
		// . ", v.liga_id "
		// . ", li.liga_bez "
		. ", st.name as stadtteil_bez"
		. ", stadtteil "
		. ", DATE_FORMAT(gr_datum,GET_FORMAT(DATE,'EUR')) as gr_datum "
		. ", historie "
		// . ", (select ifnull(dateiname,'nopic.jpg') from media where art = 'fr' and ref = 'vn' and id = verein_id) as dateiname "
		. ", Ifnull(de, v.land) as land, l.code "		
        . "  From vereine v left join laender l on land = l.code 
		left join orte o on v.ort = ort_id 
		left join ligen li on v.liga_id = li.liga_id 
		left join stadtteile st on stadtteil = st.stadtteil_id 
		left join vereinsnamen vn on vn.verein_id = v.verein_id "           
			 . $Where
			 . $andLand
			 . $andOrt
			 . $andVereinsName
			 . $andStadtTeil
			 . $andVereinID
			 . $likeFreieSuche
        . "     order by v.vereinsname, land, o.ort ";


// $fp = fopen("vereineDS.txt", "w"); 
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
        $data{$i}{"verein_id"} = trim($rs->fields{'verein_id'});
		// $data{$i}{"liga_id"} = trim($rs->fields{'liga_id'});
		$data{$i}{"stadtteil"} = trim($rs->fields{'stadtteil'});
		$data{$i}{"anzahl"} = $rs->fields{'anzahl'};
        $data{$i}{"gr_datum"} = trim($rs->fields{'gr_datum'});
		$data{$i}{"vereinsname"} = ($rs->fields{'vereinsname'});
		$data{$i}{"offizieller_name"} = ($rs->fields{'offizieller_name'});
		$data{$i}{"stadtteil_bez"} = ($rs->fields{'stadtteil_bez'});
		$data{$i}{"spitzname"} = ($rs->fields{'spitzname'});
		// $data{$i}{"liga_bez"} = (trim($rs->fields{'liga_bez'}));
		// $data{$i}{"dateiname"} = (trim($rs->fields{'dateiname'}));
		$data{$i}{"land"} = (trim($rs->fields{'land'}));
		$data{$i}{"code"} = (trim($rs->fields{'code'}));
		$data{$i}{"ort"} = (trim($rs->fields{'ort'}));
		$data{$i}{"ort_id"} = $rs->fields{'ort_id'};
		$data{$i}{"historie"} = htmlspecialchars_decode(($rs->fields{'historie'}));
        
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