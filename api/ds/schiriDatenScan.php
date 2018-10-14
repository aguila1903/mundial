<?php

error_reporting(0);
session_start();

require_once('db_psw.php');
header("Cache-Control: no-cache, must-revalidate");
$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");

if (isset($_SESSION["login"]) && $_SESSION["login"] == login && $_SESSION["admin"] == admin) {




    

    $out = array();
    $data = array();
    
        function sonderzeichen($string) {
        $search = array("Ä", "Ö", "Ü", "ä", "ö", "ü", "ß", "´");
        $replace = array("Ae", "Oe", "Ue", "ae", "oe", "ue", "ss", "");
        return str_replace($search, $replace, $string);
    }

    if (isset($_REQUEST["schiri"])) {
        $schiri = trim($_REQUEST["schiri"]);
        $schiri = sonderzeichen($schiri);
        $schiri = str_replace(" ", "-", strtolower($schiri));
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('errors' => "Spieler fehlt!");
        $out{'response'}{'data'} = "1900.01.01";
        print json_encode($out);

        return;
    }


    $_url = "http://www.weltfussball.de/schiedsrichter_profil/" . trim(str_replace(" ", "", $schiri));



    $_buffer = implode('', file($_url));

    $suchmuster = "|geboren am:(.*)+[0-9.]{10}|Us";
//    $suchmuster3 = "|Nationalit(.*)+[A-Z]{1,3}+|Us";
    $suchmuster3 = "|bilder\/flaggen(.*)+[A-Z]{1,3}+|Us";


    preg_match_all($suchmuster, ($_buffer), $treffer, PREG_OFFSET_CAPTURE);
    preg_match_all($suchmuster3, ($_buffer), $treffer3, PREG_OFFSET_CAPTURE);




    $suchmuster = "|[a-z/\n/\r/\t<>\"\= ]|";
    $datum = trim(str_replace("geboren am:", "", $treffer[0][0][0]));
    $datum = preg_replace($suchmuster, "", $datum);




 $nat = $treffer3[0][0][0];
    $nat = trim(preg_replace("|[a-z0-9;.\/ ]|Us", "", $nat));
//    $nat = trim(str_replace("<td>", "", $nat));
//    $nat = str_replace("\n", "", $nat);
//    $nat = str_replace("</td>", "", $nat);
//    $nat = str_replace("<td>", "", $nat);
 $nat = ($nat);


    $data{"datum"} = $datum;
    $data{"nat"} = htmlentities($nat);



    $out{'response'}{'status'} = 0;
    $out{'response'}{'errors'} = array();
    $out{'response'}{'data'} = $data;

    print json_encode($out);
} else {
    header("Location: http://$host/mundial/noadmin.php");
}
?>