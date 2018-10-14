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
$dbSyb->Connect('localhost', user, psw, db); //=>>> Verbindungsaufbau mit der DB


if (!$dbSyb->IsConnected()) {


    print ("Anmeldung: " . $dbSyb->ErrorMsg());

    $data = array();

    return ($data);
}

$dbSyb->debug = false;
// Toplevel

$sqlQuery = "SELECT UserID, benutzer, passwort, admin, status, email, onlineTime, logoutTime, loginCount, loginTime, timeOut from users "
;

$rs = $dbSyb->Execute($sqlQuery);


if (!$rs) {
    print $dbSyb->ErrorMsg() . "\n";
    return;
}
$i = 0;

$value = array();

while (!$rs->EOF) {

    $value{$i}{"UserID"} = $rs->fields{'UserID'};
    $value{$i}{"benutzer"} = ($rs->fields{'benutzer'});
    $value{$i}{"passwort"} = ($rs->fields{'passwort'});
    $value{$i}{"admin"} = $rs->fields{'admin'};
    $value{$i}{"status"} = $rs->fields{'status'};
    $value{$i}{"loginCount"} = $rs->fields{'loginCount'};
    $value{$i}{"loginTime"} = $rs->fields{'loginTime'};
    $value{$i}{"timeOut"} = $rs->fields{'timeOut'};
    $value{$i}{"email"} = ($rs->fields{'email'});
    $value{$i}{"onlineTime"} = ($rs->fields{'onlineTime'});
    $value{$i}{"logoutTime"} = ($rs->fields{'logoutTime'});
     
        if ($value{$i}{"status"} == "O") {
        $id = 0; 
        $value{$i}{"_hilite"} = $id;
    }
    
    $i++;

    // den n�chsten Datensatz lesen
    $rs->MoveNext();
}

$rs->Close();



$output = json_encode($value);

print($output);
} else {
    header("Location: http://$host/mundial/noadmin.php");
}
