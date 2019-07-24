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


if (isset($_REQUEST["verein_id"])) {
        $andVereinsName = $_REQUEST["verein_id"];
        if ($andVereinsName == "null" || $andVereinsName == "") {
           $andVereinsName = "";
        } else {
            
        $andVereinsName = " and v.verein_id = " . $dbSyb->Quote(($andVereinsName));
        }
    } else {
        $andVereinsName = "";
    }


    if (isset($_REQUEST["land"])) {
	$land = $_REQUEST["land"];
	if ($land == "null" || $land == "") {
            $andLand = "";
        }else{
        
        $andLand = " and land = " . $dbSyb->Quote(($land));}
    }  else {
        $andLand = "";
    }

    if (isset($_REQUEST["ort"])) {
        $ort = $_REQUEST["ort"];
        if ($ort == "null" || $ort == "") {
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


$querySQL = "select distinct ";

if ($lookFor == "verein_id") {
    $querySQL .= " gaengiger_name as vereinsname, v.verein_id ";
	
$UnionVerein = " 
	Union 
	select name_vor_ae as vereinsname, vn.verein_id
from vereinsnamen vn
left join vereine v on v.verein_id = vn.verein_id
left join laender l on land = l.code 
left join orte o on v.ort = ort_id 
left join stadtteile st on stadtteil = st.stadtteil_id 
Where v.verein_id > -1 "
        . $andVereinsName
        . $andLand
        . $andOrt;
}else{
	$UnionVerein = "";
}
if ($lookFor == "land") {
    $querySQL .= "  Ifnull(de,land) as land, l.code ";
}
if ($lookFor == "ort") {
    $querySQL .= " o.ort, o.ort_id ";
}
if ($lookFor == "stadtteil") {
    $querySQL .=  " ifnull(stadtteil, '-') as stadtteil, st.name ";
}

$querySQL .= " From vereine v left join laender l on land = l.code 
		left join orte o on v.ort = ort_id 
		left join stadtteile st on stadtteil = st.stadtteil_id 
		Where v.verein_id > -1 "
        . $andVereinsName
        . $andLand
        . $andOrt
		. $UnionVerein
        ." Order by ";
		if($lookFor == "stadtteil"){
		$querySQL .= " name;";}
		else{
				$querySQL .= $lookFor.";" ;
		}

// file_put_contents('VereinSucheFelderDS.txt', $querySQL);

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
	  
    if(isset($rs->fields{'vereinsname'})){
    $data{$i}{"vereinsname"} = ($rs->fields{'vereinsname'});}
	
	if(isset($rs->fields{'verein_id'})){
    $data{$i}{"verein_id"} = $rs->fields{'verein_id'};}
    
    if(isset($rs->fields{'ort'})){
    $data{$i}{"ort"} = ($rs->fields{'ort'});}
	
	if(isset($rs->fields{'ort_id'})){
    $data{$i}{"ort_id"} = ($rs->fields{'ort_id'});}
    
    if(isset($rs->fields{'stadtteil'})){
    $data{$i}{"stadtteil"} = ($rs->fields{'stadtteil'});}
	
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