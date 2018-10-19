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
    $out{'response'}{'errors'} = array('errors' => ($dbSyb->ErrorMsg()));

    print json_encode($out);

    return;
}

$dbSyb->debug = false;


if (isset($_REQUEST["id"])) {
    $id = $_REQUEST["id"];
    if ($id != "null" && $id != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($id))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('errors' => "Bitte die ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('errors' => "ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => "ID fehlt!");

    print json_encode($out);

    return;
}

if (isset($_REQUEST["historie"])) {
    $historie = $_REQUEST["historie"];
	if ($historie == "null" || $historie == "") {
		$out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => "Historie ist leer");

    print json_encode($out);

    return;
	} 
    
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => "Historie ist leer");

    print json_encode($out);

    return;
}

if (isset($_REQUEST["from"])) {
    $from = $_REQUEST["from"];
	    
} else {
    $from = "";
}

if($from == "stadion") {
	$sqlQuery = " update stadionliste set historie = ". $dbSyb->quote($historie)
			. " Where stadion_id = ". $id;
}
else{
	$sqlQuery = " update vereine set historie = ". $dbSyb->quote($historie)
			. " Where verein_id = ". $id;
}




// file_put_contents("editSpiele.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);

$value = array();

if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}

else {
$out{'response'}{'status'} = 0;
$out{'response'}{'errors'} = array();
$out{'response'}{'data'} = $value;

print json_encode($out);
}
   


?>
