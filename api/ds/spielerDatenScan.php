<?php

error_reporting(0);
session_start();
require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');
include("../resizer.php");
header("Cache-Control: no-cache, must-revalidate");
$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");

if (isset($_SESSION["login"]) && $_SESSION["login"] == login && $_SESSION["admin"] == admin) {



    $out = array();
    $data = array();

    function sonderzeichen($string) {
        $search = array("Ä", "Ö", "Ü", "ä", "ö", "ü", "ß", "´", " ");
        $replace = array("Ae", "Oe", "Ue", "ae", "oe", "ue", "ss", "", "-");
        return str_replace($search, $replace, $string);
    }

    if (isset($_REQUEST["spieler"])) {
        $spieler = trim($_REQUEST["spieler"]);
        $spieler = sonderzeichen($spieler);

        $spieler = str_replace("-", "", strtolower($spieler));
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('errors' => "Spieler fehlt!");
        $out{'response'}{'data'} = "1900.01.01";
        print json_encode($out);

        return;
    }

    if (isset($_REQUEST["spieler2"])) {
        $spieler2 = trim($_REQUEST["spieler2"]);
        $spieler2 = sonderzeichen($spieler2);

        // $spieler2 = str_replace("-", "", strtolower($spieler2));
    } else {
        if (isset($_REQUEST["spieler"])) {
            $spieler = trim($_REQUEST["spieler"]);
            $spieler = sonderzeichen($spieler);

            $spieler = str_replace("-", "", strtolower($spieler));
        } else {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('errors' => "Spieler fehlt!");
            $out{'response'}{'data'} = "1900.01.01";
            print json_encode($out);

            return;
        }
    }



//    file_put_contents("spielerDatenScan.txt", str_replace("ü", "ue",($_REQUEST["spieler"])));
    // $_url = "http://www.fussballdaten.de/spieler/" . trim(str_replace(" ", "", $spieler));
    $_url = "https://www.fussballdaten.de/person/" . trim(str_replace(" ", "", $spieler2));

// print $_url;
// return;

    $cleanBufferPatt = array("\n", "\r");

    $_buffer = implode('', file($_url));

    $_buffer = str_replace($cleanBufferPatt, "", $_buffer);

//    $suchmuster = "|Geboren(.*)+[0-9.]{10}|Us";
//    $suchmuster = '|kalender anzeigen">(.*)+[0-9.]{10}|Us';
    $suchmuster = '/Geburtsdatum:<\/dt><dd>(.*)[0-9.]{10}/Us';
    $suchmuster2 = "/(Position:<\/dt><dd>Angriff|Position:<\/dt><dd>Mittelfeld|Position:<\/dt><dd>Abwehr|Position:<\/dt><dd>Torwart)/";
//    $suchmuster3 = "|Nationalit(.*)+[A-Z]{1,3}+|Us";
//    $suchmuster3 = '/class="flag-icon flag-icon-(.*)[a-z-]{1,3}+|Us/';
    $suchmuster3 = '/Land:<\/dt><dd><span class="flag-icon flag-icon-[a-z]{1,3}|Us/';

   
    preg_match_all($suchmuster, $_buffer, $treffer, PREG_PATTERN_ORDER);
    preg_match_all($suchmuster2, $_buffer, $treffer2, PREG_OFFSET_CAPTURE);
    preg_match_all($suchmuster3, $_buffer, $treffer3, PREG_OFFSET_CAPTURE);


//    print_r($treffer);
//    print_r($treffer2);
//    file_put_contents("nat.txt", print_r($treffer3,true));
//    exit;
//    $datum = trim(str_replace("Geboren:", "", $treffer[0][0][0]));
    $datum = trim(str_replace('Geburtsdatum:</dt><dd>', '', $treffer[0][0]));
//    $datum = str_replace("\n", "", $datum);
//    $datum = str_replace("</td>", "", $datum);
    
    $position = str_replace("Position:</dt><dd>", "", trim($treffer2[0][0][0]));
    

//    var_dump($position);
//    return;

    if ($position == "Angriff") {
        $position = "an";
    } elseif ($position == "Abwehr") {
        $position = "aw";
    } elseif ($position == "Mittelfeld") {
        $position = "mi";
    } elseif ($position == "Torwart") {
        $position = "tw";
    } else {
        $position = "";
    }


    foreach ($treffer3[0] as $key=>$value){
        if(strtolower($value[0]) != "us"){
            $nat = $value[0];
        }else{
            $nat = "nb";
        }
    }
    
    $nat = trim(str_replace('Land:</dt><dd><span class="flag-icon flag-icon-', "", $nat));
//    $nat = str_replace("\n", "", $nat);
//    $nat = str_replace("</td>", "", $nat);
    $nat = str_replace("-", "", $nat);
    $nat = strtoupper(($nat));

    // print_r ($nat);
    // print_r ($treffer3[0][0][0]);
    // return;

    $data{"datum"} = $datum;
    $data{"position"} = $position;
    $data{"nat"} = htmlentities($nat);



    $out{'response'}{'status'} = 0;
    $out{'response'}{'errors'} = array();
    $out{'response'}{'data'} = $data;

    print json_encode($out);
} else {
    header("Location: http://$host/mundial/noadmin.php");
}
?>