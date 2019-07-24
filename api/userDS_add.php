<?php

session_start();
$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");

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
$dbSyb->Connect(link, user, psw, db); //=>>> Verbindungsaufbau mit der DB

function register($text, $ergebnis) {
    $data{"text"} = $text;
    $data{"ergebnis"} = $ergebnis;
    print(json_encode($data));
    die;
}

function errorMsg($errorMsg, $ergebnis) {
    $data{"text"} = $errorMsg;
    $data{"ergebnis"} = $ergebnis;
    print(json_encode($data));
    die;
}

function sendMail($e_mail, $host, $uri, $userID, $benutzer) {
    $bestLink = "http://" . $host . $uri . "/confirm.php?conLink=" . sha1($userID . "|" . $benutzer);
    $mail_body = "Hallo " . $benutzer . "!\r\n\r\nWillkommen bei KaraKartals Spiele Datenbank.\r\nUm die Registrierung abzuschließen, musst du nur noch den unteren Link anklicken.\r\n\r\n\r\n"
            . $bestLink; //mail body
    $empfaenger = $e_mail; //Mailadresse Empfaenger
    $betreff = "";
    $mailtext = $mail_body;

        $absender = "KaraKartals Spiele Datenbank <aguila1419@googlemail.com>";

        $headers = array();
        $headers[] = "MIME-Version: 1.0";
        $headers[] = "Content-type: text/plain; charset=UTF-8";
        $headers[] = "From: {$absender}";
// falls Bcc benötigt wird
        $headers[] = "Reply-To: {$absender}";
        $headers[] = "Subject: KaraKartals Spiele Datenbank Registrierung";
        $headers[] = "X-Mailer: PHP/" . phpversion();

        mail($empfaenger, $betreff, iconv("Windows-1252", "Windows-1252", $mailtext), implode("\r\n", $headers));
}

$data = array();
$ergebnis = 0;
$status = "";



if (!$dbSyb->IsConnected()) {
    errorMsg("Anmeldung: " . $dbSyb->ErrorMsg(), 0);
}

$dbSyb->debug = false;


if (isset($_POST["benutzername"])) {
    $benutzer = htmlspecialchars($_POST["benutzername"]);
    if (trim($benutzer) != "") {
        if ((preg_match("/^[0-9a-zA-Z-+*_. ]{3,20}$/", trim($benutzer))) == 0) {
            errorMsg('Der Benutzername darf nur aus den Zeichen 0-9 a-z A-Z -+*_. bestehen</br> und muss mind. aus 3 und max. aus 15 Zeichen bestehen.', 4);
        }
    } else {
        errorMsg('Bitte den Benutzernamen eingeben!', 4);
    }
} else {
    errorMsg('Bitte den Benutzernamen eingeben!', 4);
}

if (isset($_POST["passwort"])) {
    if (trim($_POST["passwort"]) != "") {
        $_passwort = htmlspecialchars($_POST["passwort"]);
//        if ((preg_match("/^[0-9a-zA-Z-+*_.]{6,12}$/", trim($_passwort))) == 0) {
//            errorMsg('Das Passwort darf nur aus den Zeichen 0-9 a-z A-Z -+*_. bestehen </br> und muss mind. aus 6 und max. aus 12 Zeichen bestehen.', 5);
//        }
    } else {
        errorMsg('Bitte das Passwort eingeben', 5);
    }
} else {

    errorMsg('Bitte das Passwort eingeben', 5);
}
//------------------------- Passwort 2 ------------------------------------------------------------------------------------------------------------------------------------------
if (isset($_POST["passwort2"])) {
    if (trim($_POST["passwort2"]) != "") {
        $_passwort2 = htmlspecialchars($_POST["passwort2"]);
        if ($_passwort2 != $_passwort) {

            errorMsg('Die Passwörter stimmen nicht überein', 6);
        }
    } else {

        errorMsg('Bitte das Passwort bestätigen', 7);
    }
} else {
    errorMsg('Bitte das Passwort bestätigen', 7);
}


//------------------------- Email ------------------------------------------------------------------------------------------------------------------------------------------
if (isset($_POST["email"])) {
    $e_mail = htmlspecialchars(($_POST["email"]));

if($e_mail != ""){
  if ((preg_match("/^(([a-zA-Z0-9_.\\-+])+@(([a-zA-Z0-9\\-])+\\.)+[a-zA-Z0-9]{2,4})|([ ])$/", trim(($e_mail)))) == 0) {
    errorMsg('Bitte eine gültige Email-Adresse eingeben!', 8);
}
} else {
 
    $e_mail = "";
}
} else {
 
    $e_mail = "";
}

$passwort = sha1($_passwort);
//$passwort = $_passwort;


$querySQL = "call UserAddProc (" . $dbSyb->Quote($benutzer)        //=>>> SQL-Abfrage wird erstellt
        . "," . $dbSyb->Quote($passwort)
        . "," . $dbSyb->Quote($e_mail).")"
        ;


$rs = $dbSyb->Execute($querySQL);

$userID = 0;


if (!$rs) {
    errorMsg("Anmeldung: " . $dbSyb->ErrorMsg(), 0);
}

$i = 0;

while (!$rs->EOF) { // =>>> End OF File
    $ergebnis = $rs->fields{'ergebnis'};
    $userID = $rs->fields{'userID'};

    $i++;

    $rs->MoveNext();
}

$rs->Close();
if ($ergebnis == 1) {
    register('Registrierung war erfolgreich. </br> Sie werden in wenigen Sekunden zur Login-Seite weitergeleitet.', $ergebnis);
//	if($e_mail != ""){
//		sendMail($e_mail);
//	}
} elseif ($ergebnis == -1) {

    register('Dieser Benutzername existiert bereits!', $ergebnis);
} elseif ($ergebnis == -2) {

    register('Es ist ein Fehler beim Anlegen des Benutzers aufgetreten' . $dbSyb->ErrorMsg(), $ergebnis);
} elseif ($ergebnis == 0) {

    register('Registrierung ist fehlgeschlagen', $ergebnis);
}
?>