<?php

// Script written by Adam Khoury for the following video exercise: // http://www.youtube.com/watch?v=7fTsf80RJ5w 
require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');
include("resizer.php");



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
    $result = json_encode('Datenbank-Verbindung konnte nicht hergestellt werden!');
    print $result;
    return;
}

$dbSyb->debug = false;



if (isset($_POST["ref"])) {
    if ($_POST["ref"] != "null" && $_POST["ref"] != "") {
        $ref = $_POST["ref"];
        if (preg_match("/^[stspsrtrbgvn]{2}$/", $ref) !== 1) {
            $result = json_encode("Die Media-Referenz ist fehlerhaft: $ref");
            print $result;
            return;
        }
    } else {
        $result = json_encode('Die Media-Referenz fehlt!');
        print $result;
        return;
    }
} else {
    $result = json_encode('Die Media-Referenz fehlt!');
    print $result;
    return;
}


if (isset($_POST["bild_art"])) {
    if ($_POST["bild_art"] != "null" && $_POST["bild_art"] != "") {
        $bild_art = $_POST["bild_art"];
        if (preg_match("/^[frga]{2}$/", $bild_art) !== 1) {
            $result = json_encode("Die Art des Bildes ist fehlerhaft: $bild_art");
            print $result;
            return;
        }
    } else {
        $result = json_encode('Die Art des Bildes fehlt!');
        print $result;
        return;
    }
} else {
    $result = json_encode('Die Art des Bildes fehlt!');
    print $result;

    return;
}

if (isset($_POST["id"])) {
    if ($_POST["id"] != "null" && $_POST["id"] != "") {
        $id = $_POST["id"];
        if (!ctype_digit($id)) {
            $result = json_encode('Die übergebene ID enthält nicht nur Ziffern :' . $id);
            print $result;
            return;
        }
    } else {
        $result = json_encode('Die ID fehlt!');
        print $result;
        return;
    }
} else {
    $result = json_encode('Die ID fehlt!');
    print $result;
    return;
}



if (isset($_FILES['datei'])) {

    $name_array = $_FILES['datei']['name'];
    $tmp_name_array = $_FILES['datei']['tmp_name'];
    $type_array = $_FILES['datei']['type'];
    $size_array = $_FILES['datei']['size'];
    $error_array = $_FILES['datei']['error'];

    if ($error_array > 0) {
        $fehlerText = "unbekannt";
        if ($fehler == 1) {
            $fehlerText = "Fehler 1 (" . $size_array . ")";
        }
        if ($fehler == 2) {
            $fehlerText = "Fehler 2(" . $size_array . ")";
        }
        if ($fehler == 3) {
            $fehlerText = "die Datei wurde nur teilweise übertragen";
        }
        if ($fehler == 4) {
            $fehlerText = "es wurde keine Datei übertragen";
        }
        print json_encode($fehlerText);
        return;
    }
} else {
    $result = json_encode('Es wurde keine Datei hochgeladen');
    print $result;
    return;
}



if ($type_array != "image/jpeg" && $type_array != "image/jpg" && $type_array != "image/gif" && $type_array != "image/png") {
    $result = json_encode('Bitte nur Grafiken mit dem Format jpg/jpeg, png oder gif hochladen.');
    print $result;
    return;
}


$path = [
    "path1" => __DIR__ . "/images/media/",
    "path2" => __DIR__ . "/images/media/thumbnails/",
    "path3" => __DIR__ . "/images/media/cover/",
    "path4" => __DIR__ . "/images/media/pdf/"
];

if (is_dir($path["path1"]) != 1) {
    mkdir($path["path1"], 0774, true);
}

if (is_dir($path["path2"]) != 1) {
    mkdir($path["path2"]);
}
if (is_dir($path["path3"]) != 1) {
    mkdir($path["path3"]);
}
if (is_dir($path["path4"]) != 1) {
    mkdir($path["path4"]);
}

/*
 * ************ Bild-Art-Prüfung *****************************
 */
//if ($bild_art == 'fr') {
//    if (count($tmp_name_array) > 1) {
//        $result = json_encode('Bei Front-Bildern kann nur eine Datei hochgeladen werden!');
//        print $result;
//        return;
//    }
//}

$rand = mt_rand(0, 1000);
$imgInfo = pathinfo($name_array);
$imgFileName = $imgInfo["filename"];
$imageName = ($ref . "_" . $id . "_" . $rand . "_" . $imgFileName . ".jpg");
$target = $path["path1"] . $imageName;
$type = $type_array;
list($wo, $ho) = getimagesize($tmp_name_array);
switch ($type) {
    case "image/jpeg": $type = "jpg";
        break;
    case "image/jpg": $type = "jpg";
        break;
    case "image/gif": $type = "gif";
        break;
    case "image/png": $type = "png";
        break;
    case "image/bmp": $type = "bmp";
        break;
}

if ($bild_art == 'fr') {
    $querySQL = " Select count(*) as anzahl from media Where ref = '$ref' and id =$id and art='fr'";

//        file_put_contents("chekImg.txt", $querySQL);

    $rs = $dbSyb->Execute($querySQL);

    if (!$rs) {
        $result = json_encode('Datenbank-Fehler beim Überprüfen auf doppeltes Frontbild ' . $imageName . ' aufgetregen</br> SQL-Fehlermeldung: ' . $dbSyb->ErrorMsg());
//        $status = json_encode("ok");
        $bild = json_encode($imageName);
        print $result;
        exit;
    }
    if ($rs->fields{'anzahl'} >= 1) {
        $result = json_encode('Es gibt bereits ein Front-Bild!');
        $bild = json_encode($imageName);
        print $result;
        exit;
    }
}

if (move_uploaded_file(($tmp_name_array), $path["path1"] . $imageName)) {

    /*
     * ************** Front-Thumbnail Upload ********************************
     */


    $new = $path["path2"] . $imageName; // Pfad für den Thumbnail  

    if ($ref == "vn") { // Upload bei Vereinswappen
        if ($wo < $ho) {
            $w = ($wo / $ho) * 100;
            $h = 100;
        } else if ($wo == $ho) {
            $w = 100;
            $h = 100;
        } else if ($wo > $ho) {
            $w = 100;
            $h = ($ho / $wo) * 100;
        }
        resize($target, $new, $w, $h, $type); // Funktion in der reseizer.php wird ausgeführt
    } elseif ($ref == "st" || $ref == "tr" || $ref == "sp" || $ref == "sr" || $ref == "bg") { // Upload bei Stadion, Spieler, Trainer und Schiri-Bildern
        if ($wo < $ho) {
            $w = ($wo / $ho) * 203;
            $h = 203;
        } else {
            $w = 175;
            $h = ($ho / $wo) * 175;
        }
        resize($target, $new, $w, $h, $type); // Funktion in der reseizer.php wird ausgeführt
    }



    /*
     * ************** Front-Cover Upload ********************************
     */

    if ($bild_art == 'fr') {

        $new = $path["path3"] . $imageName; // Pfad für den Cover

        if ($ref == "vn") {// Upload bei Vereinswappen
            if ($wo < $ho) {
                $w = ($wo / $ho) * 100;
                $h = 100;
            } else if ($wo == $ho) {
                $w = 100;
                $h = 100;
            } else if ($wo > $ho) {
                $w = 100;
                $h = ($ho / $wo) * 100;
            }
        } elseif ($ref == "st" || $ref == "tr" || $ref == "sp" || $ref == "sr" || $ref == "bg") { // Upload bei Stadion, Spieler, Trainer und Schiri-Bildern
            if ($wo < $ho) {
                $w = ($wo / $ho) * 390;
                $h = 390;
            } else {
                $w = 310;
                $h = ($ho / $wo) * 310;
            }
        } elseif ($ref == "sb") { //Spiel-Besuch Eintrittskarte
            $new = $path["path2"] . $imageName;
            if ($wo < $ho) {
                $w = ($wo / $ho) * 400;
                $h = 400;
            } else if ($wo == $ho) {
                $w = 400;
                $h = 400;
            } else if ($wo > $ho) {
                $w = 700;
                $h = ($ho / $wo) * 700;
            }
        }
        resize($target, $new, $w, $h, $type); // Funktion in der reseizer.php wird ausgeführt		
    }
    if ($bild_art == 'ga') {
        if ($ref == "sb") {
            $new = $path["path2"] . $imageName; // //Spiel-Besuch Thumbnail

            if ($wo < $ho) {
                $w = ($wo / $ho) * 400;
                $h = 400;
            } else if ($wo == $ho) {
                $w = 400;
                $h = 400;
            } else if ($wo > $ho) {
                $w = 400;
                $h = ($ho / $wo) * 400;
            }
            resize($target, $new, $w, $h, $type);

            $new = $path["path4"] . $imageName; //Spiel-Besuch PDF
            if ($wo < $ho) {
                $w = ($wo / $ho) * 500;
                $h = 500;
            } else if ($wo == $ho) {
                $w = 500;
                $h = 500;
            } else if ($wo > $ho) {
                $w = 700;
                $h = ($ho / $wo) * 700;
            }
            resize($target, $new, $w, $h, $type);
        }
    }

    $querySQL = " insert into media (ref, dateiname, id, art) Values(" . $dbSyb->Quote($ref)
            . ", " . $dbSyb->Quote($imageName)
            . ", " . $id
            . ", " . $dbSyb->Quote($bild_art) . ")";
// Select ROW_COUNT() as ergebnis;
// file_put_contents("bild_upload.txt", $querySQL, FILE_APPEND);

    $rs = $dbSyb->Execute($querySQL);

    if (!$rs) {
        $result = json_encode('Datenbank-Fehler beim Upload der Datei ' . $imageName . ' aufgetregen</br> SQL-Fehlermeldung: ' . $dbSyb->ErrorMsg());
        print $result;
        exit;
    } else {
//        if ($i + 1 == 1) {
//            $result = json_encode($i + 1 . ' Bild erfolgreich hochgeladen!</br>');
//        } else {
        $result = json_encode('ok');
//        }

        print $result;
        exit;
    }
} else { //echo 'Datei Upload hat versagt.'; 
    $result = json_encode("Fehler beim verschieben der Datei " . $imageName);
    print $result;
    exit;
}

