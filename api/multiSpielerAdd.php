<?php




require_once('adodb5/adodb.inc.php');

$ADODB_CACHE_DIR = 'C:/php/cache';
require_once('db_psw.php');


$ADODB_FETCH_MODE = ADODB_FETCH_ASSOC; // Liefert ein assoziatives Array, das der geholten Zeile entspricht 

$ADODB_COUNTRECS = true;

$dbSyb = ADONewConnection("mysqli");

// DB-Abfragen NICHT cachen
$dbSyb->memCache = false;
$dbSyb->memCacheHost = array('localhost'); /// $db->memCacheHost = $ip1; will work too
$dbSyb->memCacheCompress = false; /// Use 'true' arbeitet unter Windows nicht
//$dsn = "'localhost','root',psw,'vitaldb'";
$dbSyb->Connect('localhost', user, psw, db); //=>>> Verbindungsaufbau mit der DB


$out = array();

if (!$dbSyb->IsConnected()) {

    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('stadionname' => ($dbSyb->ErrorMsg()));

    print json_encode($out);

    return;
}

$dbSyb->debug = false;



if (isset($_REQUEST["spieler"])) {
    $spieler = $_REQUEST["spieler"];
    
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('spieler' => "Spielername fehlt!");

    print json_encode($out);

    return;
}

$string_rep = str_replace("\r", '', $spieler); // Entfernen der Wagenrückläufe 


//Text wird Zeile für Zeile in ein Array zerlegt
$split = explode("\n", $string_rep);
// print_r($split);
$i = 0;

while( $i < count($split)){
	$zeile = str_replace(",", "','", $split[$i]);
	
$sqlQuery = " Insert into spieler (vorname, name, land, geb_datum) values('".iconv("UTF-8", "CP1252//IGNORE", $zeile)."', 'nb', '1900-01-01');";

$rs = $dbSyb->Execute($sqlQuery);

$i++;
}


// file_put_contents("editSpieler.txt", $sqlQuery);





if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('spieler' => ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}



$out{'response'}{'status'} = 0;
$out{'response'}{'errors'} = array();
$out{'response'}{'errors'} = array('spieler' => "Spieler wurden erfolgreich in die Datenbank geschrieben. ");

print json_encode($out);



?>
