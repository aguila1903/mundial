<?php

session_start();
require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');
date_default_timezone_set('europe/berlin');
$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");

function login($text, $ergebnis, $benutzer, $loginTxt, $admin, $status) {
    $data = array("text" => $text, "ergebnis" => $ergebnis, "status" => $status);
    $_SESSION["benutzer"] = $benutzer;
    $_SESSION["login"] = $loginTxt;
    $_SESSION["admin"] = $admin;
    print(json_encode($data));
    die;
}

function createLog($meldung, $ip, $benutzer, $info, $browser, $os) {
    $log = $meldung . "  ; " . "IP: " . $ip . " ; " . date('d-m-Y H:i:s') . " ; " . "User: " . $benutzer . " ; " . $info . " ; Browser: " . $browser . " ; OS: " . $os . "\n\n";
    file_put_contents(date('Ymd') . ".txt", $log, FILE_APPEND);
}

function errorMsg($errorMsg, $ergebnis) {
    $data{"text"} = $errorMsg;
    $data{"ergebnis"} = $ergebnis;
    $data{"status"} = "";
    print(json_encode($data));
    die;
}

$data = array();
$meldung = "";
$info = "";
$ergebnis = 0;
$status = "";
$admin = "";
$ip = getenv("REMOTE_ADDR"); // get the ip number of the user  
$browser = $_SERVER['HTTP_USER_AGENT'];

$os = $_SERVER['HTTP_USER_AGENT'];

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
    errorMsg("Anmeldung: " . $dbSyb->ErrorMsg(), 0);
}

$dbSyb->debug = false;


if (isset($_POST["benutzername"])) {
    if ($_POST["benutzername"] != "") {
        $benutzer = htmlspecialchars($_POST["benutzername"]);
        if (trim($benutzer) != "") {
            if ((preg_match("/^[0-9a-zA-Z-+*_. ]{3,20}$/", trim($benutzer))) == 0) {
                errorMsg('Die Struktur des Benutzernamens stimmt nicht!', 4);
            }
        } else {
            errorMsg('Bitte den Benutzernamen eingeben!', 4);
        }
    } else {
        errorMsg("Benutzername fehlt", 4);
    }
} else {
    errorMsg("Benutzername fehlt", 4);
}

if (isset($_POST["passwort"])) {
    if ($_POST["passwort"] != "") {
//        $passwort = sha1($_POST["passwort"]);
        $passwort = htmlspecialchars($_POST["passwort"]);
    } else {
        errorMsg("Passwort fehlt", 5);
    }
} else {
    errorMsg("Passwort fehlt", 5);
}


$querySQL = "
       call loginProc (" . $dbSyb->Quote($benutzer)        //=>>> SQL-Abfrage wird erstellt
        . "," . $dbSyb->Quote(sha1($passwort)) . ")";


$rs = $dbSyb->Execute($querySQL);


if (!$rs) {
    errorMsg("Query: " . $dbSyb->ErrorMsg(), 0);
}
$ergebnis = $rs->fields{'Ergebnis'};
$status = $rs->fields{'status'};
$admin = $rs->fields{'admin'};

if ($ergebnis == 1 && $status == 'B') { // Passwort OK und User ist freigeschaltet - Başarıyla giriş yaptınız
    login("Login erfolgreich", $ergebnis, $benutzer, 1, $admin, $status);
    createLog("[INFO]", $ip, $benutzer, "Login erfolgreich", $browser, $os);
} elseif ($ergebnis == 1 && $status == 'O') { // Passwort ist OK aber der User ist nicht freigeschaltet - Anmeldung nicht möglich
    login("User " . $benutzer . " wurde noch nicht freigeschaltet!", $ergebnis, $benutzer, "falsch", $admin, $status);
    createLog("[ERROR]", $ip, $benutzer, "User '" . $benutzer . "' wurde noch nicht freigeschaltet!", $browser, $os);
} elseif ($ergebnis == -99) { // User ist wegen 3 Login-Fehlversuchen 30 Minuten gesperrt
    login("Das Konto " . $benutzer . " ist aufgrund zu häufiger Login-Fehlversuche </br>bis zu 30 Minuten gesperrt.", $ergebnis, $benutzer, "falsch", $admin, $status);
    createLog("[ERROR]", $ip, $benutzer, "User '" . $benutzer . "' wurde gesperrt.", $browser, $os);
} elseif ($ergebnis == -98) { // User hat seinen Passwort 3 mal falsch eingegeben und 5 dakika donduruldu  
    createLog("[ERROR]", $ip, $benutzer, "User '" . $benutzer . "' wurde für 5 Minuten gesperrt.", $browser, $os);
    login("Sie haben mehr als 3 Mal ihr Passwort falsch eingegeben. </br> Ihr Konto wird für 30 Minuten gesperrt.", $ergebnis, $benutzer, "falsch", $admin, $status);
} else { // Anmeldung fehlgeschlagen - evtl. Passwort falsch oder Username falsch
    login("Ah Ah Ah...du hast das Zauberwort vergessen....Ah ah ah...", $ergebnis, $benutzer, "falsch", $admin, $status);
    createLog("[ERROR]", $ip, $benutzer, "Login fehlgeschlagen", $browser, $os);
}


//    header("Location: ".protokol."://$host$uri/$extra");
?>