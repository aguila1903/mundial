<?php



session_start();

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
    $out{'response'}{'errors'} = array('name' => ($dbSyb->ErrorMsg()));

    print json_encode($out);

    return;
}

$dbSyb->debug = false;


if (isset($_REQUEST["stadion_id"])) {
    $stadion_id = $_REQUEST["stadion_id"];
    if ($stadion_id != "null" && $stadion_id != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($stadion_id))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('stadion_id' => "Bitte die Stadion-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $stadion_id = null;
    }
} else {
    $stadion_id = null;
}

if (isset($_REQUEST["stadion_id_alt"])) {
    $stadion_id_alt = $_REQUEST["stadion_id_alt"];
    if ($stadion_id_alt != "null" && $stadion_id_alt != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($stadion_id_alt))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('stadion_id_alt' => "Bitte die Stadion-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $stadion_id_alt = null;
    }
} else {
    $stadion_id_alt = null;
}

if (isset($_REQUEST["bes_vork"])) {
    $bes_vork = $_REQUEST["bes_vork"];
    if ($bes_vork == "null" || $bes_vork == "") {
        $bes_vork = null;
    }
} else {
    $bes_vork = null;
}

if (isset($_REQUEST["sp_bericht"])) {
    $sp_bericht = $_REQUEST["sp_bericht"];
    if ($sp_bericht == "null" || $sp_bericht == "") {
        $sp_bericht = null;
    }
} else {
    $sp_bericht = null;
}


if (isset($_REQUEST["ort"])) {
    $ort = $_REQUEST["ort"];
    if ($ort != "null" && $ort != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($ort))) == 0) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('ort_id' => "Sie haben einen ungültigen Ort eingeben. Bitte prüfen.");

            print json_encode($out);

            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('ort_id' => "Ort fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('ort_id' => "Ort fehlt!");

    print json_encode($out);

    return;
}

if (isset($_REQUEST["schiri"])) {
    $schiri = $_REQUEST["schiri"];
    if ($schiri != "null" && $schiri != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($ort))) == 0) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('schiri_id' => "Bitte den Schiedsrichter prüfen");

            print json_encode($out);

            return;
        }
    } else {
        $schiri = null;
    }
} else {
    $schiri = null;
}



if (isset($_REQUEST["land"])) {
    $land = $_REQUEST["land"];
    if ($land != "null" && $land != "") {
        if (strlen($land) > 2 || strlen($land) < 2) {
            $out{'response'}{'status'} = -1;
            $out{'response'}{'errors'} = array('land' => "Sie haben ein ungültiges Land eingegeben. Bitte prüfen!");

            print json_encode($out);

            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('land' => "Land fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('land' => "Land fehlt!");

    print json_encode($out);

    return;
}


if (isset($_REQUEST["zusch_anzahl"])) {
    $zusch_anzahl = str_replace('.', '', $_REQUEST["zusch_anzahl"]);
    if ($zusch_anzahl != "null" && $zusch_anzahl != "") {
        if ((preg_match("/^[0-9]{0,6}?$/", trim($zusch_anzahl))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('zusch_anzahl' => "Bitte die Zuschauer-Anzahl prüfen");

            print json_encode($out);
            return;
        }
    } else {
        $zusch_anzahl = 0;
    }
} else {
    $zusch_anzahl = 0;
}

if (isset($_REQUEST["gaestefans"])) {
    $gaestefans = str_replace('.', '', $_REQUEST["gaestefans"]);
    if ($gaestefans != "null" && $gaestefans != "") {
        if ((preg_match("/^[0-9]{0,6}?$/", trim($gaestefans))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('gaestefans' => "Bitte die Gästefans prüfen");

            print json_encode($out);
            return;
        }
    } else {
        $gaestefans = 0;
    }
} else {
    $gaestefans = 0;
}

if (isset($_REQUEST["zeit"])) {
    $zeit = $_REQUEST["zeit"];
    if ($zeit != "null" && $zeit != "") {
        if ((preg_match("/^[0-2]+[0-9]+[:]+[0-5]+[0-9]?$/", trim($zeit))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('zeit' => "Bitte die Uhrzeit prüfen");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('zeit' => " Uhrzeit fehlt!");

        print json_encode($out);
        return;
    }
} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('zeit' => " Uhrzeit fehlt!");

    print json_encode($out);
    return;
}

if (isset($_REQUEST["erg"])) {
    $erg = $_REQUEST["erg"];
    if ($erg != "null" && $erg != "") {
        if ((preg_match("/^[0-9]{1,2}+[:]+[0-9]{1,2}?$/", trim($erg))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('erg' => "Bitte das Ergebnis prüfen");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('erg' => "Ergebnis fehlt!");

        print json_encode($out);
        return;
    }
} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('erg' => "Ergebnis fehlt!");

    print json_encode($out);
    return;
}

if (isset($_REQUEST["erg_elfer"])) {
    $erg_elfer = $_REQUEST["erg_elfer"];
    if ($erg_elfer != "null" && $erg_elfer != "") {
        if ((preg_match("/^[0-9]{1,2}+[:]+[0-9]{1,2}?$/", trim($erg_elfer))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('erg_elfer' => "Bitte das Halbzeit-Ergebnis prüfen");

            print json_encode($out);
            return;
        }
    } else {
        $erg_elfer = null;
    }
} else {
    $erg_elfer = null;
}

if (isset($_REQUEST["erg_halb"])) {
    $erg_halb = $_REQUEST["erg_halb"];
    if ($erg_halb != "null" && $erg_halb != "") {
        if ((preg_match("/^[0-9]{1,2}+[:]+[0-9]{1,2}?$/", trim($erg_halb))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('erg_halb' => "Bitte das Halbzeit-Ergebnis prüfen");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('erg_halb' => "Halbzeit-Ergebnis fehlt!");

        print json_encode($out);
        return;
    }
} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('erg_halb' => "Halbzeit-Ergebnis fehlt!");

    print json_encode($out);
    return;
}

if (isset($_REQUEST["erg_zusatz"])) {
    $erg_zusatz = $_REQUEST["erg_zusatz"];
    if ($erg_zusatz != "null" && $erg_zusatz != "") {
        if ((preg_match("/^[ni VE.nvUiE]{5}?$/", trim($erg_zusatz))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('erg_zusatz' => "Bitte den Halbzeit-Zusatz prüfen");

            print json_encode($out);
            return;
        }
    } else {
        $erg_zusatz = null;
    }
} else {
    $erg_zusatz = null;
}

if (isset($_REQUEST["sp_datum"])) {
    $sp_datum = $_REQUEST["sp_datum"];
    if ($sp_datum != "null" && $sp_datum != "") {
        if ((preg_match("/^[0-9-]{10}?$/", trim($sp_datum))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('sp_datum' => "Bitte das Spiel-Datum prüfen");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('verein_h' => "Spiel-Datum fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('verein_h' => "Spiel-Datum fehlt!");

    print json_encode($out);

    return;
}

if (isset($_REQUEST["verein_h"])) {
    $verein_h = $_REQUEST["verein_h"];
    if ($verein_h != "null" && $verein_h != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($verein_h))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('verein_h' => "Bitte die Verein-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('verein_h' => "Verein-ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('verein_h' => "Verein-ID fehlt!");

    print json_encode($out);

    return;
}


if (isset($_REQUEST["verein_a"])) {
    $verein_a = $_REQUEST["verein_a"];
    if ($verein_a != "null" && $verein_a != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($verein_a))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('verein_a' => "Bitte die Verein-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('verein_a' => "Verein-ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('verein_a' => "Verein-ID fehlt!");

    print json_encode($out);

    return;
}

if (isset($_REQUEST["trainer_h"])) {
    $trainer_h = $_REQUEST["trainer_h"];
    if ($trainer_h != "null" && $trainer_h != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($trainer_h))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('trainer_h' => "Bitte die Trainer-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $trainer_h = null;
    }
} else {
    $trainer_h = null;
}

if (isset($_REQUEST["trainer_a"])) {
    $trainer_a = $_REQUEST["trainer_a"];
    if ($trainer_a != "null" && $trainer_a != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($trainer_a))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('trainer_a' => "Bitte die Trainer-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $trainer_a = null;
    }
} else {
    $trainer_a = null;
}

if (isset($_REQUEST["trainer_h"])) {
    $trainer_h = $_REQUEST["trainer_h"];
    if ($trainer_h != "null" && $trainer_h != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($trainer_h))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('trainer_h' => "Bitte die Trainer-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $trainer_h = null;
    }
} else {
    $trainer_h = null;
}

if (isset($_REQUEST["trainer_a"])) {
    $trainer_a = $_REQUEST["trainer_a"];
    if ($trainer_a != "null" && $trainer_a != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($trainer_a))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('trainer_a' => "Bitte die Trainer-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $trainer_a = null;
    }
} else {
    $trainer_a = null;
}

if (isset($_REQUEST["wettbewerb"])) {
    $wettbewerb = $_REQUEST["wettbewerb"];
    if ($wettbewerb != "null" && $wettbewerb != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($wettbewerb))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('wettbewerb' => "Bitte die Wettbewerb-ID prüfen!");

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('wettbewerb' => "Wettbewerb-ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('wettbewerb' => "Wettbewerb-ID fehlt!");

    print json_encode($out);

    return;
}


if (isset($_REQUEST["sprit"])) {
    $sprit = str_replace(".", "", $_REQUEST["sprit"]);
    if ($sprit != "null" && $sprit != "") {
        if ((preg_match("/^[0-9,]{1,10}?$/", trim($sprit))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('sprit' => "Bitte die Sprit-Kosten (Eigenanteil) prüfen.");

            print json_encode($out);
            return;
        }
    } else {
        $sprit = 0;
    }
} else {
    $sprit = 0;
}

if (isset($_REQUEST["sprit_anteilig"])) {
    $sprit_anteilig = str_replace(".", "", $_REQUEST["sprit_anteilig"]);
    if ($sprit_anteilig != "null" && $sprit_anteilig != "") {
        if ((preg_match("/^[0-9,]{1,10}?$/", trim($sprit_anteilig))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('sprit_anteilig' => "Bitte die anteiligen Spritkosten prüfen.");

            print json_encode($out);
            return;
        }
    } else {
        $sprit_anteilig = 0;
    }
} else {
    $sprit_anteilig = 0;
}

if (isset($_REQUEST["schiff"])) {
    $schiff = str_replace(".", "", $_REQUEST["schiff"]);
    if ($schiff != "null" && $schiff != "") {
        if ((preg_match("/^[0-9,]{1,10}?$/", trim($schiff))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('schiff' => "Bitte die Schiffsfahrkarte prüfen.");

            print json_encode($out);
            return;
        }
    } else {
        $schiff = 0;
    }
} else {
    $schiff = 0;
}

if (isset($_REQUEST["souvenir"])) {
    $souvenir = str_replace(".", "", $_REQUEST["souvenir"]);
    if ($souvenir != "null" && $souvenir != "") {
        if ((preg_match("/^[0-9,]{1,10}?$/", trim($souvenir))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('souvenir' => "Bitte die Souvenir-Kosten prüfen.");

            print json_encode($out);
            return;
        }
    } else {
        $souvenir = 0;
    }
} else {
    $souvenir = 0;
}

if (isset($_REQUEST["bahn"])) {
    $bahn = str_replace(".", "", $_REQUEST["bahn"]);
    if ($bahn != "null" && $bahn != "") {
        if ((preg_match("/^[0-9,]{1,10}?$/", trim($bahn))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('bahn' => "Bitte die Bahn-Kosten prüfen.");

            print json_encode($out);
            return;
        }
    } else {
        $bahn = 0;
    }
} else {
    $bahn = 0;
}

if (isset($_REQUEST["flieger"])) {
    $flieger = str_replace(".", "", $_REQUEST["flieger"]);
    if ($flieger != "null" && $flieger != "") {
        if ((preg_match("/^[0-9,]{1,10}?$/", trim($flieger))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('flieger' => "Bitte die Flieger-Kosten prüfen.");

            print json_encode($out);
            return;
        }
    } else {
        $flieger = 0;
    }
} else {
    $flieger = 0;
}

if (isset($_REQUEST["uebernachtung"])) {
    $uebernachtung = str_replace(".", "", $_REQUEST["uebernachtung"]);
    if ($uebernachtung != "null" && $uebernachtung != "") {
        if ((preg_match("/^[0-9,]{1,10}?$/", trim($uebernachtung))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('uebernachtung' => "Bitte die Übernachtungskosten prüfen.");

            print json_encode($out);
            return;
        }
    } else {
        $uebernachtung = 0;
    }
} else {
    $uebernachtung = 0;
}
if (isset($_REQUEST["verpflegung"])) {
    $verpflegung = str_replace(".", "", $_REQUEST["verpflegung"]);
    if ($verpflegung != "null" && $verpflegung != "") {
        if ((preg_match("/^[0-9,]{1,10}?$/", trim($verpflegung))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('verpflegung' => "Bitte die Verpflegungskosten prüfen.");

            print json_encode($out);
            return;
        }
    } else {
        $verpflegung = 0;
    }
} else {
    $verpflegung = 0;
}

if (isset($_REQUEST["sonstige"])) {
    $sonstige = str_replace(".", "", $_REQUEST["sonstige"]);
    if ($sonstige != "null" && $sonstige != "") {
        if ((preg_match("/^[0-9,]{1,10}?$/", trim($sonstige))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('sonstige' => "Bitte die sonstigen Kosten prüfen.");

            print json_encode($out);
            return;
        }
    } else {
        $sonstige = 0;
    }
} else {
    $sonstige = 0;
}

if (isset($_REQUEST["eintrittskarte"])) {
    $eintrittskarte = str_replace(".", "", $_REQUEST["eintrittskarte"]);
    if ($eintrittskarte != "null" && $eintrittskarte != "") {
        if ((preg_match("/^[0-9,]{1,10}?$/", trim($eintrittskarte))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('eintrittskarte' => "Bitte die Eintrittskarten-Kosten prüfen.");

            print json_encode($out);
            return;
        }
    } else {
        $eintrittskarte = 0;
    }
} else {
    $eintrittskarte = 0;
}

if (isset($_REQUEST["handy"])) {
    $handy = str_replace(".", "", $_REQUEST["handy"]);
    if ($handy != "null" && $handy != "") {
        if ((preg_match("/^[0-9,]{1,10}?$/", trim($handy))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('handy' => "Bitte die Handy-Kosten prüfen.");

            print json_encode($out);
            return;
        }
    } else {
        $handy = 0;
    }
} else {
    $handy = 0;
}

if (isset($_REQUEST["taxi"])) {
    $taxi = str_replace(".", "", $_REQUEST["taxi"]);
    if ($taxi != "null" && $taxi != "") {
        if ((preg_match("/^[0-9,]{1,10}?$/", trim($taxi))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('taxi' => "Bitte die Taxi-Kosten prüfen.");

            print json_encode($out);
            return;
        }
    } else {
        $taxi = 0;
    }
} else {
    $taxi = 0;
}

if (isset($_REQUEST["wettbewerb_zusatz"])) {
    $wettbewerb_zusatz = $_REQUEST["wettbewerb_zusatz"];
    if (strlen($wettbewerb_zusatz) > 200) {
        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('wettbewerb_zusatz' => "Der Wettbewerb-Zusatz darf 200 Zeichen nicht überschreiten!");

        print json_encode($out);
        return;
    }
    if ($wettbewerb_zusatz == "null" || $wettbewerb_zusatz == "") {
        $wettbewerb_zusatz = null;
    }
} else {
    $wettbewerb_zusatz = null;
}

if (isset($_REQUEST["ausverkauft"])) {
    $ausverkauft = $_REQUEST["ausverkauft"];
    if ($ausverkauft != "null" && $ausverkauft != "") {
        if ((preg_match("/^[0-1,]{0,1}?$/", trim($ausverkauft))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('ausverkauft' => "Bitte das Feld Ausverkauft prüfen.");

            print json_encode($out);
            return;
        }
    } else {
        $ausverkauft = 0;
    }
} else {
    $ausverkauft = 0;
}

$sqlQuery = "call addSpiele("
        . $dbSyb->Quote($sp_datum) .
        ", " . $dbSyb->Quote($zeit) .
        ", " . $dbSyb->Quote($erg) .
        ", " . $dbSyb->Quote($erg_halb) .
        ", " . $ort .
        ", " . $dbSyb->Quote(($land)) .
        ", " . $verein_a .
        ", " . $verein_h;
if ($trainer_a == null) {
    $sqlQuery .= " ,NULL ";
} else {
    $sqlQuery .= ", " . $trainer_a;
}
if ($trainer_h == null) {
    $sqlQuery .= " ,NULL ";
} else {
    $sqlQuery .= ", " . $trainer_h;
}
if ($schiri == null) {
    $sqlQuery .= " ,NULL ";
} else {
    $sqlQuery .= ", " . $schiri;
}
if ($stadion_id == null) {
    $sqlQuery .= " ,NULL ";
} else {
    $sqlQuery .= ", " . $stadion_id;
}
if ($stadion_id_alt == null) {
    $sqlQuery .= " ,NULL ";
} else {
    $sqlQuery .= ", " . $stadion_id_alt;
}
if ($erg_zusatz == null) {
    $sqlQuery .= " ,NULL ";
} else {
    $sqlQuery .= ", " . $dbSyb->Quote(($erg_zusatz));
}
$sqlQuery .= ", " . $zusch_anzahl .
        ", " . $gaestefans;

if ($sp_bericht == null) {
    $sqlQuery .= " ,NULL ";
} else {
    $sqlQuery .= ", " . $dbSyb->Quote($sp_bericht);
}
if ($bes_vork == null) {
    $sqlQuery .= " ,NULL ";
} else {
    $sqlQuery .= ", " . $dbSyb->Quote($bes_vork);
}
$sqlQuery .= ", " . $wettbewerb
        . ", " . str_replace(",", ".", $sprit)
        . ", " . str_replace(",", ".", $bahn)
        . ", " . str_replace(",", ".", $flieger)
        . ", " . str_replace(",", ".", $uebernachtung)
        . ", " . str_replace(",", ".", $verpflegung)
        . ", " . str_replace(",", ".", $eintrittskarte)
        . ", " . str_replace(",", ".", $sonstige)
        . ", " . str_replace(",", ".", $sprit_anteilig)
        . ", " . str_replace(",", ".", $schiff)
        . ", " . str_replace(",", ".", $taxi)
        . ", " . str_replace(",", ".", $handy)
        . ", " . str_replace(",", ".", $souvenir);

if ($wettbewerb_zusatz == null) {
    $sqlQuery .= " ,NULL";
} else {
    $sqlQuery .= ", " . $dbSyb->Quote($wettbewerb_zusatz);
}
if ($erg_elfer == null) {
    $sqlQuery .= " ,NULL ";
} else {
    $sqlQuery .= ", " . $dbSyb->Quote($erg_elfer);
}
$sqlQuery .= ", " . $ausverkauft . ");";


// file_put_contents("editSpiele.txt", $sqlQuery);

$rs = $dbSyb->Execute($sqlQuery);

$value = array();

if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('spiel_id' => ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}

If (isset($rs->fields{'ergebnis'})) {
    if ($rs->fields{'ergebnis'} == 1) {
        $i = 0;

        while (!$rs->EOF) {

            $value{$i}{"spiel_id"} = $rs->fields{'spiel_id'};
            $value{$i}{"ergebnis"} = $rs->fields{'ergebnis'};

            $i++;

            // den n�chsten Datensatz lesen
            $rs->MoveNext();
        }

        $rs->Close();

        $out{'response'}{'status'} = 0;
        $out{'response'}{'errors'} = array();
        $out{'response'}{'data'} = $value;

        print json_encode($out);
    } else if ($rs->fields{'ergebnis'} == 0) {
        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('spiel_id' => "Es wurden keine Änderungen vorgenommen. Entweder gab es keine Änderungen oder es ist ein Fehler aufgetreten. </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
    } else if ($rs->fields{'ergebnis'} == 99) {
        $out{'response'}{'errors'} = array('spiel_id' => "Das von Ihnen eingegebene Land ist ungültig. Bitte prüfen Sie es erneut </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
    } else if ($rs->fields{'ergebnis'} == 98) {
        $out{'response'}{'errors'} = array('spiel_id' => "Das von Ihnen eingegebene Wettbewerb ist ungültig. Bitte prüfen Sie es erneut </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
    } else if ($rs->fields{'ergebnis'} == 97) {
        $out{'response'}{'errors'} = array('spiel_id' => "Der von Ihnen eingegebene Schiedsrichter ist ungültig. Bitte prüfen Sie es erneut </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
    } else if ($rs->fields{'ergebnis'} == 96) {
        $out{'response'}{'errors'} = array('spiel_id' => "Der von Ihnen eingegebene Verein ist ungültig. Bitte prüfen Sie es erneut </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
    } else if ($rs->fields{'ergebnis'} == 95) {
        $out{'response'}{'errors'} = array('spiel_id' => "Der von Ihnen eingegebene Trainer ist ungültig. Bitte prüfen Sie es erneut </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
    } else if ($rs->fields{'ergebnis'} == 94) {
        $out{'response'}{'errors'} = array('zusch_anzahl' => "Die von Ihnen eingegebene Zuschauer-Anzahl ist höher als die Stadion-Kapazität. Bitte überprüfen Sie Ihre angabe noch einmal. </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
    } else {
        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('spiel_id' => "Update konnte nicht durchgeführt werden. </br>" . ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
    }
} else {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('name' => "Keine Ergebnis-Rückmeldung erhalten </br>" . ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}




