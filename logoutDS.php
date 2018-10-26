<?php

session_start();

header("Cache-Control: no-cache, must-revalidate"); // HTTP/1.1
//header("Expires: Sat, 26 Jul 1997 05:00:00 GMT"); // Datum in der Vergangenheit
$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");

$session = session_id();
// Löschen der erzeugten datei
//unlink ($session.".php");

require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');

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

$out = array();

if (!$dbSyb->IsConnected()) {

    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => ($dbSyb->ErrorMsg()));

    print json_encode($out);

    return;
}

$dbSyb->debug = false;

if(isset($_SESSION['benutzer'])){
	
$sqlQuery = "Call logoutProc(" . $dbSyb->quote(($_SESSION['benutzer'])) . ")";


// file_put_contents("logout.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);

$value = array();

if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}


If (isset($rs->fields{'ergebnis'})) {
    if ($rs->fields{'ergebnis'} != 1) {
        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('errors' => "Es gab ein Problem beim Logout. Möglicherweise wurden Sie nicht korrekt ausgeloggt! </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
    } else {
        $_SESSION = array();

// Falls die Session gel�scht werden soll, l�schen Sie auch das
// Session-Cookie.
// Achtung: Damit wird die Session gel�scht, nicht nur die Session-Daten!
        if (ini_get("session.use_cookies")) {
            $params = session_get_cookie_params();
            setcookie(session_name(), '', time() - 42000, $params["path"], $params["domain"], $params["secure"], $params["httponly"]
            );

            header("Location: http://$host$uri/login.php");
        }

// Zum Schlu�, l�schen der Session.
        session_destroy();

        $i = 0;

        while (!$rs->EOF) {

            $value{"ergebnis"} = $rs->fields{'ergebnis'};

            $i++;

            $rs->MoveNext();
        }

        $rs->Close();

        $out{'response'}{'status'} = 0;
        $out{'response'}{'errors'} = array();
        $out{'response'}{'data'} = $value;

        print json_encode($out);
    }
} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => "Es konnnte keine Logout-Rückmeldung ermittelt werden. Möglicherweise wurden Sie nicht korrekt ausgeloggt! </br>" . ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}
}else{
	header("Location: http://$host$uri/noadmin.php");
}


?>