<?php

session_start();

require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');
//header("Cache-Control: no-cache, must-revalidate");
//$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
//$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");






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

$out = array();
if (!$dbSyb->IsConnected()) {

    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => ($dbSyb->ErrorMsg()));

    print json_encode($out);

    return;
}

$dbSyb->debug = false;

$nine = 0;

$link = new mysqli(link, 'root', psw, db);


$result = $link->query("SELECT distinct codeMap as code from stadionliste s join laender l on land = code and (l.codeMap != '' or l.codeMap !=NULL) ");

$num_rows = mysqli_num_rows($result);



$nine = $num_rows;

mysqli_close($link);
/*
 * ************************** CODE *********************************************
 */


$sqlQuery = "
SELECT distinct codeMap as code from stadionliste s join laender l on land = code and (l.codeMap != '' or l.codeMap !=NULL) ";
// file_put_contents("liegenDS.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);


if (!$rs) {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => ($dbSyb->ErrorMsg()));

    print json_encode($out);

    return;
}

$i = 0;
$code = '';

$value = array();

while (!$rs->EOF) {
    if ($code == '') {
        $code .= ($rs->fields{'code'});
    } else {
        $code .= '|' . ($rs->fields{'code'});
    }

    $i++;

    // den n�chsten Datensatz lesen
    $rs->MoveNext();
}

$rs->Close();

$neune = str_repeat('9', $nine);

$value{"nine"} = $neune;
$value{"code"} = $code;


$out{'response'}{'status'} = 0;
$out{'response'}{'errors'} = array();
$out{'response'}{'data'} = $value;

print json_encode($out);

