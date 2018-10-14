<?php

error_reporting(E_ERROR | E_PARSE);
// Script written by Adam Khoury for the following video exercise: // http://www.youtube.com/watch?v=7fTsf80RJ5w 
require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');
include("resizer.php");

function sonderzeichen($string) {
    $search = array("Ä", "Ö", "Ü", "ä", "ö", "ü", "ß", "´", " ", ".");
    $replace = array("Ae", "Oe", "Ue", "ae", "oe", "ue", "ss", "", "-", "");
    return str_replace($search, $replace, $string);
}

if (isset($_REQUEST["name"])) {
    $name = trim($_REQUEST["name"]);
    $name = sonderzeichen($name);
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => "Name fehlt!");
    print json_encode($out);

    return;
}

if (isset($_REQUEST["ref"])) {
    $ref = trim($_REQUEST["ref"]);
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => "Die Bezugsreferenz fehlt!");
    print json_encode($out);

    return;
}

if (isset($_REQUEST["id"])) {
    if ($_REQUEST["id"] != "null" && $_REQUEST["id"] != "") {
        $id = $_REQUEST["id"];
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('errors' => "ID fehlt!");
        print json_encode($out);
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('errors' => "ID fehlt!");
    print json_encode($out);

    return;
}

if (isset($_REQUEST["ort"])) {
    $ort = trim($_REQUEST["ort"]);
    $ort = sonderzeichen($ort);
    $name = $name . "-" . $ort;
} else {
    $ort = "";
}

function get_image($url, $name, $ref, $bild_art, $id) {

    /*
     * ********** Variablen **********************
     */
    $out = array();
    $data = array();
    $webImg = array();
    $musterSpTrSr = "/spieler\/gross/i";
    $musterStadion = "/stadien\/detail/i";
    $musterVerein = "/wappen\/mittel/i";
    $suchMuster = ["sp" => $musterSpTrSr, "tr" => $musterSpTrSr, "sr" => $musterSpTrSr, "st" => $musterStadion, "vn" => $musterVerein];

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
        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('Datenbank-Verbindung konnte nicht hergestellt werden!');
        print json_encode($out);
        return;
    }

    $dbSyb->debug = false;

    if ($bild_art == 'fr') {
        $querySQL = " Select count(*) as anzahl from media Where ref = '$ref' and id =$id and art='fr'";

//        file_put_contents("chekImg.txt", $querySQL);

        $rs = $dbSyb->Execute($querySQL);

        if (!$rs) {
            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('Datenbank-Verbindung konnte nicht hergestellt werden!');
            print json_encode($out);
            return;
        }
        if ($rs->fields{'anzahl'} >= 1) {
            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('Es gibt bereits ein Front-Bild!');
            print json_encode($out);
            return;
        }
    }


    $host = $url;
    $base_url = parse_url($url);
    $base_url = $base_url['scheme'] . '://' . $base_url['host'] . '/';
    if (!(@$filestring = file_get_contents($host))) {
        echo 'ERROR: URL NOT VALID OR OFFLINE';
        return null;
    }
    preg_match_all('/<img[^>]+>/is', $filestring, $imgs);

// $imgs = array_unique($imgs[0]);
// foreach ($imgs as $img) {
    // echo '<br/>', htmlspecialchars($img),'<br/>';
// }


    $path1 = getcwd() . "\images\media\\";
    $path2 = getcwd() . "\images\media\\thumbnails\\";
    $path3 = getcwd() . "\images\media\cover\\";


    if (is_dir($path1) != 1) {
        mkdir($path1, 0777, true);
        chmod($path1, 0777);
    }

    if (is_dir($path2) != 1) {
        mkdir($path2);
    }
    if (is_dir($path3) != 1) {
        mkdir($path3);
    }


// print_r($imgs[0]);
// return;
// echo count($imgs[0]); // 68
    for ($i = 0; $i < count($imgs[0]); $i++) {

        if (preg_match($suchMuster[$ref], $imgs[0][$i])) {
            $webImg[0] = $imgs[0][$i];
        }

        // echo $imgs[0][$i];
    }

    if ($webImg[0] == "") {
        $data{"pictureName"} = "";
        $out{'response'}{'status'} = 0;
        $out{'response'}{'errors'} = array();
        $out{'response'}{'data'} = $data;

        print json_encode($out);

        return;
    }
// print($webImg[0]); // Für die Ansicht im Testscript zuständig. wird [0] weggelassen, werden alle verfügbaren Bilder angezeigt. Ansonsten wird das erste Bild angezeigt
// return;
// $suchmuster = "/((s.weltsport){1}.*(jpg\"){1})/Us"; // Suchmuster musste aktualisiet werden, da sich der Link geändert hat
// $suchmuster = "/((static.){1}.*(jpg\"){1})/Us"; // Muss je nach Seite, von der das Bild runtergeladen wird, angepasst werden.
// preg_match_all('/upload.[^>]+"/is',$imgs[0],$imgUrl);

    $suchmuster = "/((https.){1}.*(\"){1})/Us"; // Muss je nach Seite, von der das Bild runtergeladen wird, angepasst werden. 
    preg_match_all($suchmuster, $webImg[0], $imgUrl); //  Positons für den Download des Bildes zuständig. Bei Wikipedia meistens zwischen [0] oder [1]
// print_r($imgUrl[0][0]);
// return;
    $imgUrl = str_replace('"', '', $imgUrl[0][0]);
    $ext = substr($imgUrl, -3);
    $contents = file_get_contents($imgUrl);
    setlocale(LC_TIME, 'de_DE');

    $rand = mt_rand(0, 1000);
    $savename = ($ref . "_" . $id . "_" . $rand . "_" . $name . ".jpg");
    $savenameGIF = ($ref . "_" . $id . "_" . $rand . "_" . $name . ".gif");
    $target = $path1 . $savename;
//    file_put_contents("image_scan.txt", $path1);
    $savefile = fopen($target, "w");
    fwrite($savefile, $contents);
    fclose($savefile);

    if ($ref == 'vn') {

        function gif2jpg($originalFile, $outputFile, $quality) {
            $image = imagecreatefromgif($originalFile);
            imagejpeg($image, $outputFile, $quality);
            imagedestroy($image);
        }

        $targetGIF = $path1 . $savenameGIF;

//    file_put_contents("image_scan.txt", $path1);
        $savefile = fopen($targetGIF, "w");
        fwrite($savefile, $contents);
        fclose($savefile);


        gif2jpg($targetGIF, $target, 100);
        gif2jpg($targetGIF, $path2 . $savename, 100);
        gif2jpg($targetGIF, $path3 . $savename, 100);
        unlink($targetGIF);
    } else {
        /*
         * ************** Front-Thumbnail Upload ********************************
         */

        list($wo, $ho) = getimagesize($target);
        $new = $path2 . $savename; // Pfad für den Thumbnail
        $type = $ext;

        if ($wo < $ho) {
            $w = ($wo / $ho) * 203;
            $h = 203;
        } else {
            $w = 175;
            $h = ($ho / $wo) * 175;
        }

        resize($target, $new, $w, $h, $type); // Funktion in der reseizer.php wird ausgeführt

        /*
         * ************** Front-Cover Upload ********************************
         */

        if ($bild_art == 'fr') {
            list($wo, $ho) = getimagesize($target);
            $new = $path3 . $savename; // Pfad für den Cover
            $type = $ext;

            if ($wo < $ho) {
                $w = ($wo / $ho) * 390;
                $h = 390;
            } else {
                $w = 310;
                $h = ($ho / $wo) * 310;
            }
            resize($target, $new, $w, $h, $type); // Funktion in der reseizer.php wird ausgeführt		
        }
    }
    if (file_exists($target)) { // prüft ob ein Bild runtergeladen wurde. Wenn ja kann fortgefahren werden.
        if (filesize($target) > 0) {// prüft ob die Datei auch beschrieben wurde. Wenn ja, kann fortgefahren werden.
            $querySQL = " insert into media (ref, dateiname, id, art) Values(" . $dbSyb->Quote($ref)
                    . ", " . $dbSyb->Quote($savename)
                    . ", " . $id
                    . ", " . $dbSyb->Quote($bild_art) . ")";
            // Select ROW_COUNT() as ergebnis;
            // file_put_contents("bild_upload.txt", $querySQL, FILE_APPEND);

            $rs = $dbSyb->Execute($querySQL);

            if (!$rs) {
                $out{'response'}{'status'} = -1;
                $out{'response'}{'errors'} = array('errors' => ($dbSyb->ErrorMsg()));

                print json_encode($out);

                return;
            }
        } else { // Datei wurde nicht beschrieben und muss wieder gelöscht werden.
            unlink($target);
            $data{"pictureName"} = "";
            $out{'response'}{'status'} = 0;
            $out{'response'}{'errors'} = array();
            $out{'response'}{'data'} = $data;

            print json_encode($out);

            return;
        }
    } else {
        $data{"pictureName"} = "";
        $out{'response'}{'status'} = 0;
        $out{'response'}{'errors'} = array();
        $out{'response'}{'data'} = $data;

        print json_encode($out);

        return;
    }

    $data{"pictureName"} = ($savename);


    $out{'response'}{'status'} = 0;
    $out{'response'}{'errors'} = array();
    $out{'response'}{'data'} = $data;

    print json_encode($out);
}

switch ($ref) {
    case "tr":
        get_image("https://www.weltfussball.de/spieler_profil/$name/", $name, $ref, "fr", $id);
        break;
    case "sp":
        get_image("https://www.weltfussball.de/spieler_profil/$name/", $name, $ref, "fr", $id);
        break;
    case "st":
        get_image("https://www.weltfussball.de/spielorte/$name/", $name, $ref, "fr", $id);
        break;
    case "sr":
        get_image("https://www.weltfussball.de/schiedsrichter_profil/$name/", $name, $ref, "fr", $id);
        break;
    case "vn":
        get_image("https://www.weltfussball.de/teams/$name/", $name, $ref, "fr", $id);
        break;
}







//get_image('http://www.weltfussball.de/spieler_profil/fin-bartels', 'spieler', 'fin-bartels', 'sp', 'fr', 35);
?>