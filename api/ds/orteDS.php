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

// if(isset($_REQUEST["ort"])){
    // $ort = $_REQUEST["ort"];
    // $Where = " where ort like ". $dbSyb->Quote(("%".$ort."%")).";";
// }else {
    // $Where =  "";
// }



if(isset($_REQUEST["land"])){
    $land = $_REQUEST["land"];
    $Where = " and o.code = ". $dbSyb->Quote(($land));
}else {
    $Where =  "";
}

if(isset($_REQUEST["ort"])){
    $ort = $_REQUEST["ort"];
    $Where .= " and ort like ". $dbSyb->Quote(("%".$ort."%"));
}else {
    $Where .=  "";
}

if(isset($_REQUEST["verein"])){
    $verein = $_REQUEST["verein"];
}else {
    $verein =  "nein";
}

if(isset($_REQUEST["vorgang"])){
    $vorgang = $_REQUEST["vorgang"];
}else {
    $vorgang =  "nein";
}

if (isset($_REQUEST["bundesland"])) {
    $bundesland = $_REQUEST["bundesland"];
	$Where .= " and o.bundesland_id = ". $dbSyb->Quote(($bundesland)). " or bl.name =" .$dbSyb->Quote(($bundesland));
    // if ($bundesland != "null" && $bundesland != "") {
        // if (strlen($bundesland) > 2 || strlen($bundesland) < 1) {
            // $out{'response'}{'status'} = -1;
            // $out{'response'}{'errors'} = array('bundesland' => "Sie haben ein ungültiges Bundesland eingegeben. Bitte prüfen!");

            // print json_encode($out);

            // return;
        // }
    // } 
} 

if ($verein == "ja") {

$sqlQuery = "select ort_id, ort, o.code, de from orte o left join laender l on o.code = l.code where o.code = 'WD'
union
SELECT distinct ort_id, ort, o.code, de from orte o left join laender l on o.code = l.code where ort_id > -1 ". $Where . " order by ort "
;
}

if ($verein == "nein" && $vorgang == "nein") {

$sqlQuery = "SELECT distinct ort_id, ort, bl.bundesland_id, bl.name, o.code, de from orte o left join laender l on o.code = l.code 
left join bundeslaender bl on o.bundesland_id = bl.bundesland_id 
where ort_id > -1 and o.code != 'WD'". $Where . " order by ort "
;
}

if ($vorgang == "stadion") {

$sqlQuery = "SELECT distinct ort_id, ort, bl.bundesland_id, bl.name, o.code, de from orte o left join laender l on o.code = l.code 
left join bundeslaender bl on o.bundesland_id = bl.bundesland_id 
where ort_id > -1 and o.code != 'WD'". $Where . " order by ort "
;
}





// file_put_contents("orteS.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);


if (!$rs) {
    print $dbSyb->ErrorMsg() . "\n";
    return;
}
$i = 0;

$value = array();

while (!$rs->EOF) {

   
    $value{$i}{"ort"} = ($rs->fields{'ort'});
	$value{$i}{"code"} = ($rs->fields{'code'});
	$value{$i}{"land"} = ($rs->fields{'de'});
	if(isset($rs->fields{'name'})){$value{$i}{"bundesland"} = ($rs->fields{'name'});}
	if(isset($rs->fields{'bundesland_id'})){$value{$i}{"bundesland_id"} = ($rs->fields{'bundesland_id'});}
	$value{$i}{"ort_id"} = $rs->fields{'ort_id'};
   
    $i++;

    // den n�chsten Datensatz lesen
    $rs->MoveNext();
}

$rs->Close();



$output = json_encode($value);

print($output);
} else {
    header("Location: http://$host$uri/noadmin.php");
}
