<?php

//error_reporting(E_ALL);
session_start();

require_once('adodb5/adodb.inc.php');
require_once('fpdf/fpdf.php');
require_once('db_psw.php');
header("Cache-Control: no-cache, must-revalidate");
$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");






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

    return ($data);
}

$dbSyb->debug = false;
$out = array();
$data = array();


// $Where = " Where land != 'nb' ";

if (isset($_REQUEST["spiel_id"])) {
    $spiel_id = $_REQUEST["spiel_id"];
    if ($spiel_id != "null" && $spiel_id != "") {
        if ((preg_match("/^[0-9]{1,11}?$/", trim($spiel_id))) == 0) {

            $out{'response'}{'status'} = -4;
            $out{'response'}{'errors'} = array('spiel_id' => "Bitte die Spiel-ID prÃ¼fen! " . $spiel_id);

            print json_encode($out);
            return;
        }
    } else {
        $out{'response'}{'status'} = -1;
        $out{'response'}{'errors'} = array('spiel_id' => "Spiel-ID fehlt!");

        print json_encode($out);

        return;
    }
} else {
    $out{'response'}{'status'} = -1;
    $out{'response'}{'errors'} = array('spiel_id' => "Spiel-ID fehlt!");

    print json_encode($out);

    return;
}


$querySQL = "SELECT Distinct "
        . "	sp.spiel_id "
        . ", sp.zusch_anzahl "
        . ", sp.gaestefans "
        . ", sp.bes_vork "
        . ", sp.sp_bericht "
        . ", sp.schiri_id"
        . ", sp.ausverkauft"
        . ", s.name "
        . ", DATE_FORMAT(sp.sp_datum,GET_FORMAT(DATE,'EUR')) as sp_datum "
        . ", case weekday(sp.sp_datum) When 0 Then 'Montag' When 1 Then 'Dienstag' When 2 Then 'Mittwoch' When 3 Then 'Donnerstag' When 4 Then 'Freitag' When 5 Then 'Samstag' When 6 Then 'Sonntag' End as wochentag "
        . ", sp.ort as ort_id "
        . ", o.ort "
        . ", l.de as land "
        . ", sp.land as code "
        . ", sp.liga_id "
        . ", w.liga_bez as wettbewerb "
        . ", w.zusatz "
        . ", sp.zeit "
        . ", ergebnis "
        . ", sp.verein_id_h "
        . ", sp.verein_id_a "
        . ", va.gaengiger_name AS verein_a "
        . ", vh.gaengiger_name AS verein_h "
        . ", sp.stadion_id "
        . ", sl.stadionname "
        . ", sl.kapazitaet "
        . ", sl.anschrift "
        . ", sp.trainer_id_h "
        . ", sp.trainer_id_a "
        . ", s.name as schiri "
        . ", (select vs.gaengiger_name from vereine vs left join schiris ss on vs.verein_id = ss.verein_id where ss.schiri_id = sp.schiri_id) as schiri_verein "
        . ", ta.name as trainer_a "
        . ", th.name as trainer_h "
        . ", sp.stadion_id_alt "
        . ", sp.erg_halb "
        . ", sp.erg_elfer "
        . ", sp.sprit "
        . ", sp.sprit_anteilig "
        . ", sp.bahn "
        . ", sp.souvenir "
        . ", sp.taxi "
        . ", sp.handy "
        . ", sp.flieger "
        . ", sp.schiff "
        . ", sp.uebernachtung "
        . ", sp.verpflegung "
        . ", sp.sonstige "
        . ", sp.eintrittskarte "
        . ", sp.sprit+sp.sprit_anteilig+sp.bahn+sp.souvenir+sp.taxi+sp.handy+sp.flieger+sp.schiff+sp.uebernachtung+sp.verpflegung+sp.sonstige+sp.eintrittskarte as ges_kosten "
        . ", sp.erg_zusatz "
        . ", sn.name_vor_ae as stadionname_alt "
        . ", sp.wettbewerb_zusatz "
        . ", sp.nr as anzahl "
        . "  From sp_besuche sp left join laender l on sp.land = l.code "
        . " left join schiris s on sp.schiri_id = s.schiri_id "
        . " left join ligen w on w.liga_id = sp.liga_id "
        . " left join orte o on sp.ort = o.ort_id "
        . " Left join vereine vh on vh.verein_id = sp.verein_id_h "
        . " Left join vereine va on va.verein_id = sp.verein_id_a"
        . " Left join trainer th on th.trainer_id = sp.trainer_id_h "
        . " Left join trainer ta on ta.trainer_id = sp.trainer_id_a"
        . " Left Join stadionliste sl on sl.stadion_id = sp.stadion_id "
        . " Left join stadionnamen sn on sp.stadion_id_alt = sn.lfd_nr"
        . " LEFT JOIN sp_spieler_spiel_tabelle ss on ss.spiel_id = sp.spiel_id "
        . " LEFT JOIN spieler spi on spi.spieler_id = ss.spieler_id "
        . " LEFT JOIN sp_begleiter_spiel_tabelle bs on bs.spiel_id = sp.spiel_id "
        . " LEFT Join begleiter b on b.begleiter_id = bs.begleiter_id "
        . " WHERE  sp.spiel_id = " . $spiel_id
;


// $fp = fopen("spielePDF_Daten.txt", "w");
// fputs($fp, $querySQL);
// fclose($fp);


$dbSyb->setCharset('windows-1252');
$rs = $dbSyb->Execute($querySQL);

if (!$rs) {

    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => "Es ist ein Fehler aufgetreten.");

    print json_encode($out);
    return;
} else {
//    $i = 0;
    // $ii = 1;
    while (!$rs->EOF) {
        $data{"spiel_id"} = trim($rs->fields{'spiel_id'});
        $data{"stadion_id_alt"} = trim($rs->fields{'stadion_id_alt'});
        $data{"stadionname_alt"} = $rs->fields{'stadionname_alt'};
        $data{"stadion_id"} = trim($rs->fields{'stadion_id'});
        $data{"zeit"} = trim($rs->fields{'zeit'});
        $data{"trainer_id_a"} = trim($rs->fields{'trainer_id_a'});
        $data{"trainer_id_h"} = trim($rs->fields{'trainer_id_h'});
        $data{"schiri_verein"} = ($rs->fields{'schiri_verein'});
        $data{"wochentag"} = ($rs->fields{'wochentag'});
        $data{"wettbewerb_zusatz"} = ($rs->fields{'wettbewerb_zusatz'});
        $data{"anschrift"} = ($rs->fields{'anschrift'});
        $data{"trainer_a"} = ($rs->fields{'trainer_a'});
        $data{"trainer_h"} = ($rs->fields{'trainer_h'});
        $data{"zusch_anzahl"} = number_format(trim($rs->fields{'zusch_anzahl'}), 0, ',', '.');
        $data{"gaestefans"} = number_format(trim($rs->fields{'gaestefans'}), 0, ',', '.');
        // $data{"erg_a"} = trim($rs->fields{'erg_a'});
        // $data{"erg_h"} = trim($rs->fields{'erg_h'});
        $data{"verein_id_a"} = iconv('windows-1252', 'windows-1252',trim($rs->fields{'verein_id_a'}));
        $data{"verein_id_h"} = iconv('windows-1252', 'windows-1252',trim($rs->fields{'verein_id_h'}));
        $data{"paarung"} = ($rs->fields{'verein_h'}) . ' - ' . ($rs->fields{'verein_a'});
        $data{"sp_datum"} = trim($rs->fields{'sp_datum'});
        $data{"schiri_id"} = trim($rs->fields{'schiri_id'});
        $data{"schiri"} = ($rs->fields{'schiri'});
        $data{"name"} = ($rs->fields{'name'});
        $data{"liga_id"} = trim($rs->fields{'liga_id'});
        $data{"ort_id"} = trim($rs->fields{'ort_id'});
        $data{"ort"} = ($rs->fields{'ort'});
        $data{"sp_bericht"} = ($rs->fields{'sp_bericht'});
        $data{"bes_vork"} = ($rs->fields{'bes_vork'});
        $data{"land"} = ($rs->fields{'land'});
        $data{"code"} = ($rs->fields{'code'});
        $data{"verein_a"} = ($rs->fields{'verein_a'});
        $data{"verein_h"} = ($rs->fields{'verein_h'});
        $data{"erg"} = trim($rs->fields{'ergebnis'});
        $data{"erg_elfer"} = trim($rs->fields{'erg_elfer'});
        $data{"erg_halb"} = trim($rs->fields{'erg_halb'});
        $data{"erg_zusatz"} = trim($rs->fields{'erg_zusatz'});
        $data{"sprit"} = number_format($rs->fields{'sprit'}, 2, ',', '.');
        $data{"bahn"} = number_format($rs->fields{'bahn'}, 2, ',', '.');
        $data{"flieger"} = number_format($rs->fields{'flieger'}, 2, ',', '.');
        $data{"verpflegung"} = number_format($rs->fields{'verpflegung'}, 2, ',', '.');
        $data{"uebernachtung"} = number_format($rs->fields{'uebernachtung'}, 2, ',', '.');
        $data{"sonstige"} = number_format($rs->fields{'sonstige'}, 2, ',', '.');
        $data{"ges_kosten"} = number_format($rs->fields{'ges_kosten'}, 2, ',', '.');
        $data{"eintrittskarte"} = number_format($rs->fields{'eintrittskarte'}, 2, ',', '.');
        $data{"sprit_anteilig"} = number_format($rs->fields{'sprit_anteilig'}, 2, ',', '.');
        $data{"souvenir"} = number_format($rs->fields{'souvenir'}, 2, ',', '.');
        $data{"taxi"} = number_format($rs->fields{'taxi'}, 2, ',', '.');
        $data{"handy"} = number_format($rs->fields{'handy'}, 2, ',', '.');
        $data{"schiff"} = number_format($rs->fields{'schiff'}, 2, ',', '.');
        $data{"ausverkauft"} = trim($rs->fields{'ausverkauft'});


        if (strlen(trim($rs->fields{'zusatz'})) > 0) {
            $data{"wettbewerb"} = ($rs->fields{'wettbewerb'}) . " (" . ($rs->fields{'zusatz'}) . ")";
        } else {
            $data{"wettbewerb"} = ($rs->fields{'wettbewerb'});
        }


        if (strlen(trim($rs->fields{'kapazitaet'})) == 0 || trim($rs->fields{'kapazitaet'}) == '' || trim($rs->fields{'kapazitaet'}) == 'NULL' || trim($rs->fields{'kapazitaet'}) == null) {

            if (strlen(trim($rs->fields{'stadionname_alt'})) == 0 || trim($rs->fields{'stadionname_alt'}) == '' || trim($rs->fields{'stadionname_alt'}) == 'NULL' || trim($rs->fields{'stadionname_alt'}) == null) {
                $data{"stadionname"} = ($rs->fields{'stadionname'});
            } else {
                $data{"stadionname"} = ($rs->fields{'stadionname'}) . ' (' . ($rs->fields{'stadionname_alt'}) . ")";
            }
        } else {
            if (strlen(trim($rs->fields{'stadionname_alt'})) == 0 || trim($rs->fields{'stadionname_alt'}) == '' || trim($rs->fields{'stadionname_alt'}) == 'NULL' || trim($rs->fields{'stadionname_alt'}) == null) {
                $data{"stadionname"} = ($rs->fields{'stadionname'}) . ' (' . number_format(trim($rs->fields{'kapazitaet'}), 0, ',', '.') . ')';
            } else {
                $data{"stadionname"} = ($rs->fields{'stadionname'}) . ' (' . number_format(trim($rs->fields{'kapazitaet'}), 0, ',', '.') . ') (' . ($rs->fields{'stadionname_alt'}) . ")";
            }
        }

        if (strlen(trim($rs->fields{'erg_zusatz'})) > 0) {
            if (trim($rs->fields{'erg_zusatz'}) == "n. V.") {
                $data{"ergebnis"} = trim($rs->fields{'ergebnis'}) . ' (' . trim($rs->fields{'erg_halb'}) . ") " . trim($rs->fields{'erg_zusatz'});
            }
            if (trim($rs->fields{'erg_zusatz'}) == "i. E.") {
                $data{"ergebnis"} = trim($rs->fields{'ergebnis'}) . ' (' . trim($rs->fields{'erg_halb'}) . ") " . trim($rs->fields{'erg_elfer'}) . " " . trim($rs->fields{'erg_zusatz'});
            }
            if (trim($rs->fields{'erg_zusatz'}) == "nvUiE") {
                $data{"ergebnis"} = trim($rs->fields{'ergebnis'}) . ' (' . trim($rs->fields{'erg_halb'}) . ") n.V. " . trim($rs->fields{'erg_elfer'}) . " i. E.";
            }
        } else {
            $data{"ergebnis"} = trim($rs->fields{'ergebnis'}) . ' (' . trim($rs->fields{'erg_halb'}) . ")";
        }
        $data{"nummer"} = $rs->fields{'anzahl'};


//        $i++;
        // $ii++;

        $rs->MoveNext();
    }

    $rs->Close();
}

/* * **********************************************************************************************************************************************************
 * ********************************************************** ENDE SPIELDATEN *********************************************************************************
 * ********************************************************************************************************************************************************** */



/* * **********************************************************************************************************************************************************
 * ********************************************************** ANFANG WAPPEN HEIM ******************************************************************************
 * ********************************************************************************************************************************************************** */


$querySQL_wappen = "select ifnull(dateiname,'no_image.jpg') as dateiname from media where id = " . $data{"verein_id_h"} . " and ref = 'vn' and art = 'fr'";

// $fp = fopen("spielePDF_Wappen.txt", "w"); 
// fputs($fp, $querySQL_wappen);             
// fclose($fp);

$rs_wp = $dbSyb->Execute($querySQL_wappen);
$data_wp = array();
$data_wp_h{"dateiname"} = 'no_image.jpg';

if (!$rs_wp) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('verein_id' => ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
} else {
    

    while (!$rs_wp->EOF) {
        $data_wp_h{"dateiname"} = ($rs_wp->fields{'dateiname'});

        

        // den nï¿½chsten Datensatz lesen
        $rs_wp->MoveNext();
    }

    $rs_wp->Close();
}
/* * **********************************************************************************************************************************************************
 * ********************************************************** ANFANG WAPPEN GAST ******************************************************************************
 * ********************************************************************************************************************************************************** */


$querySQL_wappen = "select ifnull(dateiname,'no_image.jpg') as dateiname from media where id = " . $data{"verein_id_a"} . " and ref = 'vn' and art = 'fr';";

// $fp = fopen("spielePDF_Wappen.txt", "w"); 
// fputs($fp, $querySQL_wappen);             
// fclose($fp);

$rs_wp = $dbSyb->Execute($querySQL_wappen);
$data_wp_a = array();
$data_wp_a{"dateiname"} = 'no_image.jpg';

if (!$rs_wp) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('verein_id' => ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
} else {
   

    while (!$rs_wp->EOF) {
        $data_wp_a{"dateiname"} = ($rs_wp->fields{'dateiname'});

       

        // den nï¿½chsten Datensatz lesen
        $rs_wp->MoveNext();
    }

    $rs_wp->Close();
}

/*
 * ****************************PDF**********************************************
 * =============================================================================
 */

$pdf = new FPDF();
$pdf->AliasNbPages();
$pdf->AddPage();

/*
 * **************************** WAPPEN **********************************************
 */
$imagesDir = __DIR__."\\..\\..\\images\\famfam\\";
$mediaDir = __DIR__. "\\..\\images\\media\\";
if ($data_wp_h{"dateiname"} != "no_image.jpg") {
    $pdf->Image($mediaDir . "thumbnails\\" . $data_wp_h{"dateiname"}, 5, 5); // Wappen Heim-Mannschaft
}
if ($data_wp_a{"dateiname"} != "no_image.jpg") {
    $pdf->Image($mediaDir . "thumbnails\\" . $data_wp_a{"dateiname"}, 175, 5); // Wappen AuswÃ¼rts-Mannschaft
}
$ih = 25;
$iw = 35;
/*
 * **************************** ERGEBNIS ********************************************
 */
$ergebnis = ($data{"verein_h"}) . "  " . $data{"ergebnis"} . "  " . ($data{"verein_a"});
//Anpassung der Schriftgr��en
if (strlen($ergebnis) >= 40) {
    $pdf->SetFont('Arial', 'B', 15);
}
if (strlen($ergebnis) >= 55) {
    $pdf->SetFont('Arial', 'B', 13);
}
if (strlen($ergebnis) >= 64) {
    $pdf->SetFont('Arial', 'B', 11);
}
if (strlen($ergebnis) <= 39) {
    $pdf->SetFont('Arial', 'B', 20);
}
$w = $pdf->GetStringWidth($ergebnis);
$pdf->SetXY((210 - $w) / 2, $ih);
$pdf->SetTextColor(0, 0, 0);
$pdf->Cell($w, 0, $ergebnis, 0, 0, 'C', false);

/*
 * **************************** SPIELDATEN **********************************************
 */
$datum = $data{"sp_datum"};
$uhrzeit = $data{"zeit"} . " Uhr";
$wochentag = $data{"wochentag"};
$wettbewerb = ($data{"wettbewerb"} . " (" . $data{"wettbewerb_zusatz"} . ")");
$zuschauer = $data{"zusch_anzahl"} . " (" . $data{"gaestefans"} . ")";
$stadion = "Spielst�tte: " . $data{"stadionname"};
$schiri = "Schiedsrichter: " . $data{"schiri"};

$spielZeit = $wochentag . ", " . $datum . " " . $uhrzeit;

$pdf->SetFont('Arial', '', 11);
$pdf->SetTextColor(0, 50, 50);
$w = $pdf->GetStringWidth($spielZeit);
$pdf->SetXY((210 - $w) / 2, $ih - 10);
$pdf->Cell($w, 0, $spielZeit, 0, 0, 'C', false);


// Wettbewerb
$w = $pdf->GetStringWidth($wettbewerb);
$pdf->SetXY((210 - $w) / 2, $ih - 16);
$pdf->Cell($w, 0, $wettbewerb, 0, 0, 'C', false);
// Zuschauer
$pdf->SetFont('Arial', '', 13);
$w1 = 21;
$pdf->Text($w1, $ih + 20, "Zuschauer: " . $data{"zusch_anzahl"});
//G�ste
$pdf->Text($w1, $ih + 25, ("G�ste: " . $data{"gaestefans"}));
//Stadion
$pdf->Text($w1, $ih + 33, ($stadion));
//Schiri
$pdf->Text($w1, $ih + 43, ($schiri));

//Logos
$pdf->Image($imagesDir."supporter.png", 5, $ih + 16);
$pdf->Image($imagesDir."stadium.png", 7, $ih + 29);
$pdf->Image($imagesDir."whistle.png", 7, $ih + 40);


/*
 * **************************** AUFSTELLUNG-HEIM-TEAM **********************************************
 */

$querySQL = "SELECT Distinct "
        . " concat(ifnull(s.vorname,''),' ',s.name) as name "
        . ", v.aw "
        . ", v.aw_minute "
        . "  From sp_spieler_spiel_tabelle v join spieler s on v.spieler_id = s.spieler_id	"
        . " and spiel_id = " . $data{"spiel_id"} . " and v.status = 'sa' and v.status2 = 'h' "
        . "     order by v.lfd_nr";


// $fp = fopen("spielerSpielAddDS.txt", "w"); 
// fputs($fp, $querySQL);             
// fclose($fp); 


$rs = $dbSyb->Execute($querySQL);

if (!$rs) {

    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => "Es ist ein Fehler aufgetreten.");

    print json_encode($out);
    return;
}
$fontSize = 11;
$pdf->SetFont('Arial', 'B', $fontSize);
$i = 0;
$ii = 60;
$pdf->Text($w1, $ih + 55, ($data{"verein_h"}));
$pdf->SetFont('Arial', '', $fontSize - 2);
while (!$rs->EOF) {

    if (trim($rs->fields{'aw_minute'}) > 0) {
        $data{$i}{"name"} = $rs->fields{'name'} . " (" . trim($rs->fields{'aw_minute'}) . ".)";
        $pdf->Text($w1, $ih + $ii, ($data{$i}{"name"}));
        $pdf->Image($imagesDir."ic_wechsel_rot.png", $w1 - 5, $ih + $ii - 2.5);
    } else {
		
        $data{$i}{"name"} = iconv('UTF-8', 'windows-1252', $rs->fields{'name'});
        $pdf->Text($w1, $ih + $ii, ($data{$i}{"name"}));
    }

    $i++;
    $ii+=5;

    $rs->MoveNext();
}

$rs->Close();

/*
 * **************************** AUSWECHSELBANK-HEIM-TEAM **********************************************
 */

$querySQL = "SELECT Distinct "
        . " concat(ifnull(s.vorname,''),' ',s.name) as name "
        . ", v.aw "
        . ", v.aw_minute "
        . "  From sp_spieler_spiel_tabelle v join spieler s on v.spieler_id = s.spieler_id	"
        . " and spiel_id = " . $data{"spiel_id"} . " and v.status = 'ew' and v.status2 = 'h' "
        . "     order by v.lfd_nr";


// $fp = fopen("spielerSpielAddDS.txt", "w"); 
// fputs($fp, $querySQL);             
// fclose($fp); 


$rs = $dbSyb->Execute($querySQL);

if (!$rs) {

    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => "Es ist ein Fehler aufgetreten.");

    print json_encode($out);
    return;
}
$pdf->SetFont('Arial', 'B', $fontSize);
$i = 0;
$ii = 125;
$pdf->Text($w1, $ih + 120, 'Bank');
$pdf->SetFont('Arial', '', $fontSize - 2);
while (!$rs->EOF) {

    if (trim($rs->fields{'aw_minute'}) > 0) {
        $data{$i}{"name"} = mb_convert_encoding($rs->fields{'name'}, 'UTF-8', 'CP1252') . " (" . trim($rs->fields{'aw_minute'}) . ".)";
        $pdf->Text($w1, $ih + $ii, ($data{$i}{"name"}));
        $pdf->Image($imagesDir."ic_wechsel_gruen.png", $w1 - 5, $ih + $ii - 2.5);
    } else {
        $data{$i}{"name"} = mb_convert_encoding($rs->fields{'name'}, 'UTF-8', 'CP1252');
        $pdf->Text($w1, $ih + $ii, ($data{$i}{"name"}));
    }

    $i++;
    $ii+=5;

    $rs->MoveNext();
}

$rs->Close();

/*
 * **************************** Trainer-HEIM-TEAM **********************************************
 */

$pdf->SetFont('Arial', 'B', $fontSize);
$i = 0;
$ii += 10;
$pdf->Text($w1, $ih + $ii - 5, ('Trainer'));
$pdf->SetFont('Arial', '', $fontSize - 2);
$pdf->Text($w1, $ih + $ii, ($data{"trainer_h"}));

/*
 * **************************** Reisekosten **********************************************
 */
if ($data{"ges_kosten"} !== '0,00') {
    $pdf->SetFont('Arial', 'B', $fontSize);
    $i = 0;
    $ii += 10;
    $pdf->Text($w1, $ih + $ii, ('Reisekosten'));
    $pdf->SetFont('Arial', '', $fontSize - 2);
    $plus = 35;

    if ($data{"sprit"} !== '0,00') {
        $ii += 5;
        $pdf->Text($w1, $ih + $ii, ('Sprit (Eigenanteil):'));
//        $pdf->Text($w1 + $plus, $ih + $ii, ($data{"sprit"}));
        $pdf->SetXY($w1 + $plus, $ih + $ii - 1);
        $pdf->Cell(13, 0, ($data{"sprit"}), 0, 0, 'R', false);
    }
    if ($data{"sprit_anteilig"} !== '0,00') {
        $ii += 5;
        $pdf->Text($w1, $ih + $ii, ('Sprit (anteilig):'));
//        $pdf->Text($w1 + $plus, $ih + $ii, ($data{"sprit_anteilig"}));
        $pdf->SetXY($w1 + $plus, $ih + $ii - 1);
        $pdf->Cell(13, 0, ($data{"sprit_anteilig"}), 0, 0, 'R', false);
    }
    if ($data{"bahn"} !== '0,00') {
        $ii += 5;
        $pdf->Text($w1, $ih + $ii, ('Bahnticket:'));
//        $pdf->Text($w1 + $plus, $ih + $ii, ($data{"bahn"}));
        $pdf->SetXY($w1 + $plus, $ih + $ii - 1);
        $pdf->Cell(13, 0, ($data{"bahn"}), 0, 0, 'R', false);
    }
    if ($data{"flieger"} !== '0,00') {
        $ii += 5;
        $pdf->Text($w1, $ih + $ii, ('Flugticket:'));
//        $pdf->Text($w1 + $plus, $ih + $ii, ($data{"flieger"}));
        $pdf->SetXY($w1 + $plus, $ih + $ii - 1);
        $pdf->Cell(13, 0, ($data{"flieger"}), 0, 0, 'R', false);
    }
    if ($data{"schiff"} !== '0,00') {
        $ii += 5;
        $pdf->Text($w1, $ih + $ii, ('Schiffsfahrkarte:'));
//        $pdf->Text($w1 + $plus, $ih + $ii, ($data{"schiff"}));
        $pdf->SetXY($w1 + $plus, $ih + $ii - 1);
        $pdf->Cell(13, 0, ($data{"schiff"}), 0, 0, 'R', false);
    }
    if ($data{"uebernachtung"} !== '0,00') {
        $ii += 5;
        $pdf->Text($w1, $ih + $ii, ('Ãœbernachtung:'));
//        $pdf->Text($w1 + $plus, $ih + $ii, ($data{"uebernachtung"}));
        $pdf->SetXY($w1 + $plus, $ih + $ii - 1);
        $pdf->Cell(13, 0, ($data{"uebernachtung"}), 0, 0, 'R', false);
    }
    if ($data{"verpflegung"} !== '0,00') {
        $ii += 5;
        $pdf->Text($w1, $ih + $ii, ('Speis und Trank:'));
//        $pdf->Text($w1 + $plus, $ih + $ii, ($data{"verpflegung"}));
        $pdf->SetXY($w1 + $plus, $ih + $ii - 1);
        $pdf->Cell(13, 0, ($data{"verpflegung"}), 0, 0, 'R', false);
    }
    if ($data{"eintrittskarte"} !== '0,00') {
        $ii += 5;
        $pdf->Text($w1, $ih + $ii, ('Eintrittskarte:'));
//        $pdf->Text($w1 + $plus, $ih + $ii, ($data{"eintrittskarte"}));
        $pdf->SetXY($w1 + $plus, $ih + $ii - 1);
        $pdf->Cell(13, 0, ($data{"eintrittskarte"}), 0, 0, 'R', false);
    }
    if ($data{"taxi"} !== '0,00') {
        $ii += 5;
        $pdf->Text($w1, $ih + $ii, ('Taxi:'));
//        $pdf->Text($w1 + $plus, $ih + $ii, ($data{"taxi"}));
        $pdf->SetXY($w1 + $plus, $ih + $ii - 1);
        $pdf->Cell(13, 0, ($data{"taxi"}), 0, 0, 'R', false);
    }
    if ($data{"handy"} !== '0,00') {
        $ii += 5;
        $pdf->Text($w1, $ih + $ii, ('Handy:'));
//        $pdf->Text($w1 + $plus, $ih + $ii, ($data{"handy"}));
        $pdf->SetXY($w1 + $plus, $ih + $ii - 1);
        $pdf->Cell(13, 0, ($data{"handy"}), 0, 0, 'R', false);
    }
    if ($data{"souvenir"} !== '0,00') {
        $ii += 5;
        $pdf->Text($w1, $ih + $ii, ('Souvenir/Devotionalien:'));
//        $pdf->Text($w1 + $plus, $ih + $ii, ($data{"souvenir"}));
        $pdf->SetXY($w1 + $plus, $ih + $ii - 1);
        $pdf->Cell(13, 0, ($data{"souvenir"}), 0, 0, 'R', false);
    }
    if ($data{"sonstige"} !== '0,00') {
        $ii += 5;
        $pdf->Text($w1, $ih + $ii, ('Sonstige:'));
//        $pdf->Text($w1 + $plus, $ih + $ii, ($data{"sonstige"}));
        $pdf->SetXY($w1 + $plus, $ih + $ii - 1);
        $pdf->Cell(13, 0, ($data{"sonstige"}), 0, 0, 'R', false);
    }
    $ii += 5;
    $pdf->SetFont('Arial', 'B', $fontSize - 1);
    $pdf->Text($w1, $ih + $ii, ('Gesamtkosten:'));
//    $pdf->Text($w1 + $plus, $ih + $ii , ($data{"ges_kosten"}));

    $pdf->SetXY($w1 + $plus, $ih + $ii - 1);
    $pdf->Cell(13, 0, ($data{"ges_kosten"}), 0, 0, 'R', false);
}


/*
 * **************************** ANREISEDATEN **********************************************
 */

$querySQL = "SELECT "
        . " verkehrsmittel_zus "
        . ", verkehrsmittel "
        . ", entfernung_km "
        . ", (select sum(entfernung_km) from mobil where spiel_id = " . $spiel_id . ") as gesamt "
        . ", (select count(*) from mobil where spiel_id = " . $spiel_id . ") anzahl "
        . "  From mobil "
        . "  Where spiel_id = " . $spiel_id
        . " order by lfd_nr";

$rs = $dbSyb->Execute($querySQL);

if (!$rs) {

    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => "Es ist ein Fehler aufgetreten.\n" . $dbSyb->ErrorMsg());

    print json_encode($out);
    return;
}

if ($rs->fields{'anzahl'} > 0) {

    $pdf->SetFont('Arial', 'B', $fontSize);
   
    $ii += 15;
    $iii = 1;
    $pdf->Text($w1, $ih + $ii - 5, ('Anreise'));
    $pdf->SetFont('Arial', '', $fontSize - 2);

    while (!$rs->EOF) {
        $data{"verkehrsmittel_zus"} = mb_convert_encoding($rs->fields{'verkehrsmittel_zus'}, 'UTF-8', 'CP1252');
        $data{"verkehrsmittel"} = mb_convert_encoding($rs->fields{'verkehrsmittel'}, 'UTF-8', 'CP1252');
        $data{"entfernung_km"} = $rs->fields{'entfernung_km'};
        $data{"nr"} = $iii;
        $data{"gesamt"} = number_format($rs->fields{'gesamt'}, 2, ",", ".");

        $pdf->Text($w1, $ih + $ii, ($data{"nr"} . ". " . $data{"verkehrsmittel"} . " " . $data{"verkehrsmittel_zus"} . "  " . number_format($data{"entfernung_km"}, 2, ",", ".") . " km"));

        $ii+=5;
        $iii++;

        $rs->MoveNext();
    }
    $pdf->SetFont('Arial', 'B', $fontSize - 1);
    $pdf->Text($w1, $ih + $ii, "Gesamt " . $data{"gesamt"} . " km");

    $rs->Close();
}


/*
 * **************************** AUFSTELLUNG-GAST-TEAM **********************************************
 */

$querySQL = "SELECT Distinct "
        . " concat(ifnull(s.vorname,''),' ',s.name) as name "
        . ", v.aw "
        . ", v.aw_minute "
        . "  From sp_spieler_spiel_tabelle v join spieler s on v.spieler_id = s.spieler_id	"
        . " and spiel_id = " . $data{"spiel_id"} . " and v.status = 'sa' and v.status2 = 'a' "
        . "     order by v.lfd_nr";


// $fp = fopen("spielerSpielAddDS.txt", "w"); 
// fputs($fp, $querySQL);             
// fclose($fp); 


$rs = $dbSyb->Execute($querySQL);

if (!$rs) {

    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => "Es ist ein Fehler aufgetreten.");

    print json_encode($out);
    return;
}
$pdf->SetFont('Arial', 'B', $fontSize);
$i = 0;
$ii = 60;
$w = 140;
$pdf->Text($w, $ih + 55, ($data{"verein_a"}));
$pdf->SetFont('Arial', '', $fontSize - 2);
while (!$rs->EOF) {

    if (trim($rs->fields{'aw_minute'}) > 0) {
        $data{$i}{"name"} = $rs->fields{'name'} . " (" . trim($rs->fields{'aw_minute'}) . ".)";
        $pdf->Text($w, $ih + $ii, ($data{$i}{"name"}));
        $pdf->Image($imagesDir."ic_wechsel_rot.png", $w - 5, $ih + $ii - 2.5);
    } else {
        $data{$i}{"name"} = mb_convert_encoding($rs->fields{'name'}, 'UTF-8', 'CP1252');
        $pdf->Text($w, $ih + $ii, ($data{$i}{"name"}));
    }

    $i++;
    $ii+=5;

    $rs->MoveNext();
}

$rs->Close();

/*
 * **************************** AUSWECHSELBANK-GAST-TEAM **********************************************
 */

$querySQL = "SELECT Distinct "
        . " concat(ifnull(s.vorname,''),' ',s.name) as name "
        . ", v.aw "
        . ", v.aw_minute "
        . "  From sp_spieler_spiel_tabelle v join spieler s on v.spieler_id = s.spieler_id	"
        . " and spiel_id = " . $data{"spiel_id"} . " and v.status = 'ew' and v.status2 = 'a' "
        . "     order by v.lfd_nr";


// $fp = fopen("spielerSpielAddDS.txt", "w"); 
// fputs($fp, $querySQL);             
// fclose($fp); 


$rs = $dbSyb->Execute($querySQL);

if (!$rs) {

    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => "Es ist ein Fehler aufgetreten.");

    print json_encode($out);
    return;
}
$pdf->SetFont('Arial', 'B', $fontSize);
$i = 0;
$ii = 125;
$w = 140;
$pdf->Text($w, $ih + 120, 'Bank');
$pdf->SetFont('Arial', '', $fontSize - 2);
while (!$rs->EOF) {

    if (trim($rs->fields{'aw_minute'}) > 0) {
        $data{$i}{"name"} = mb_convert_encoding($rs->fields{'name'}, 'UTF-8', 'CP1252') . " (" . trim($rs->fields{'aw_minute'}) . ".)";
        $pdf->Text($w, $ih + $ii, ($data{$i}{"name"}));
        $pdf->Image($imagesDir."ic_wechsel_gruen.png", $w - 5, $ih + $ii - 2.5);
    } else {
        $data{$i}{"name"} = mb_convert_encoding($rs->fields{'name'}, 'UTF-8', 'CP1252');
        $pdf->Text($w, $ih + $ii, ($data{$i}{"name"}));
    }

    $i++;
    $ii+=5;

    $rs->MoveNext();
}

$rs->Close();



/*
 * **************************** Trainer-Gast-TEAM **********************************************
 */

$pdf->SetFont('Arial', 'B', $fontSize);
$i = 0;
$ii += 10;
$pdf->Text($w, $ih + $ii - 5, ('Trainer'));
$pdf->SetFont('Arial', '', $fontSize - 2);
$pdf->Text($w, $ih + $ii, ($data{"trainer_a"}));


/*
 * **************************** BEGLEITER **********************************************
 */

$querySQL = "SELECT Distinct "
        . " s.name "
        . ", s.spitzname "
        . "  From sp_begleiter_spiel_tabelle v Left join begleiter s on v.begleiter_id = s.begleiter_id	"
        . " Where v.spiel_id = " . $spiel_id
        . "     order by s.name";

$rs = $dbSyb->Execute($querySQL);

if (!$rs) {

    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => $dbSyb->ErrorMsg() . "</br>Es ist ein Fehler aufgetreten.");

    print json_encode($out);
    return;
}
$pdf->SetFont('Arial', 'B', $fontSize);
$i = 0;
$ii += 15;
$pdf->Text($w, $ih + $ii - 5, ('Begleiter'));
$pdf->SetFont('Arial', '', $fontSize - 2);

while (!$rs->EOF) {
    if (strlen(trim($rs->fields{'spitzname'})) > 0) {
        $data{$i}{"name"} = mb_convert_encoding($rs->fields{'name'}, 'UTF-8', 'CP1252') . " (" . mb_convert_encoding($rs->fields{'spitzname'}, 'UTF-8', 'CP1252') . ")";
        $pdf->Text($w, $ih + $ii, ($data{$i}{"name"}));
    } else {
        $data{$i}{"name"} = mb_convert_encoding($rs->fields{'name'}, 'UTF-8', 'CP1252');
        $pdf->Text($w, $ih + $ii, ($data{$i}{"name"}));
    }

    $i++;
    $ii+=5;

    $rs->MoveNext();
}

$rs->Close();




/*
 * **************************** TORSCHÃœTZEN **********************************************
 */

$querySQL = "SELECT Distinct "
        . "	 sp.lfd_nr "
        . ", sp.spiel_id "
        . ", sp.spieler_id_h "
        . ", sp.spieler_id_a "
        . ", sp.elfer "
        . ", concat(ifnull(s.vorname,''),' ',s.name) as spieler_h "
        . ", concat(ifnull(ss.vorname,''),' ',ss.name) as spieler_a "
        . ", sp.sp_minute "
        . ", sp.besonderheit "
        . ", sp.team "
        . ", sp.spielstand "
        . "  From sp_tore_spiel_tabelle sp Left join spieler s on sp.spieler_id_h = s.spieler_id	"
        . "  Left join spieler ss on sp.spieler_id_a = ss.spieler_id	"
        . " Where sp.spiel_id = " . $spiel_id . " and elfer = 0"
        . "     order by sp.sp_minute ";

$rs = $dbSyb->Execute($querySQL);

if (!$rs) {

    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => "Es ist ein Fehler aufgetreten.");

    print json_encode($out);
    return;
}
$pdf->SetFont('Arial', 'B', $fontSize);
$i = 0;
$ii = 60;
$w = 76;
$pdf->Text($w + 10, $ih + 55, 'Tore');
$pdf->SetFont('Arial', '', $fontSize - 2);

while (!$rs->EOF) {

    if (trim($rs->fields{'team'}) == 'h') {
        if (strlen(trim($rs->fields{'besonderheit'})) > 0) {
            $data{$i}{"spielstand"} = trim($rs->fields{'spielstand'}) . "  " . mb_convert_encoding($rs->fields{'spieler_h'}, 'UTF-8', 'CP1252') . "  " . trim($rs->fields{'sp_minute'}) . ".  " . trim($rs->fields{'besonderheit'});
            $pdf->Text($w, $ih + $ii, ($data{$i}{"spielstand"}));
        } else {
            $data{$i}{"spielstand"} = trim($rs->fields{'spielstand'}) . "  " . mb_convert_encoding($rs->fields{'spieler_h'}, 'UTF-8', 'CP1252') . "  " . trim($rs->fields{'sp_minute'}) . ".";
            $pdf->Text($w, $ih + $ii, ($data{$i}{"spielstand"}));
        }
    }
    if (trim($rs->fields{'team'}) == 'a') {

        if (strlen(trim($rs->fields{'besonderheit'})) > 0) {
            $data{$i}{"spielstand_a"} = trim($rs->fields{'spielstand'}) . "  " . mb_convert_encoding($rs->fields{'spieler_a'}, 'UTF-8', 'CP1252') . "  " . trim($rs->fields{'sp_minute'}) . ".  " . trim($rs->fields{'besonderheit'});
            $pdf->Text($w, $ih + $ii, ($data{$i}{"spielstand_a"}));
        } else {
            $data{$i}{"spielstand_a"} = trim($rs->fields{'spielstand'}) . "  " . mb_convert_encoding($rs->fields{'spieler_a'}, 'UTF-8', 'CP1252') . "  " . trim($rs->fields{'sp_minute'}) . ".";
            $pdf->Text($w, $ih + $ii, ($data{$i}{"spielstand_a"}));
        }
    }

    $i++;
    $ii+=5;

    $rs->MoveNext();
}

$rs->Close();


/*
 * **************************** ELFMETERSCHIESSEN **********************************************
 */

$querySQL = "SELECT Distinct "
        . "	 sp.lfd_nr "
        . ", sp.spiel_id "
        . ", sp.spieler_id_h "
        . ", sp.spieler_id_a "
        . ", sp.elfer "
        // . ", s.name as spieler_h"
        . ", concat(ifnull(s.vorname,''),' ',s.name) as spieler_h "
        . ", concat(ifnull(ss.vorname,''),' ',ss.name) as spieler_a "
        // . ", ss.name as spieler_a "
        . ", sp.sp_minute "
        . ", sp.besonderheit "
        . ", sp.team "
        . ", sp.spielstand "
        . "  From sp_tore_spiel_tabelle sp Left join spieler s on sp.spieler_id_h = s.spieler_id	"
        . "  Left join spieler ss on sp.spieler_id_a = ss.spieler_id	"
        . " Where sp.spiel_id = " . $spiel_id . " and elfer in (1,2)"
        . "     order by sp.lfd_nr ";



$rs = $dbSyb->Execute($querySQL);


if (!$rs) {

    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => "Es ist ein Fehler aufgetreten.");

    print json_encode($out);
    return;
}

if (trim($data{"erg_zusatz"}) == "i. E." || trim($data{"erg_zusatz"}) == "nvUiE") {
    $pdf->SetFont('Arial', 'B', $fontSize);
    $i = 0;
    $ii += 10;
    $pdf->Text($w, $ih + $ii - 5, ('ElfmeterschieÃŸen'));
    $pdf->SetFont('Arial', '', $fontSize - 2);

    while (!$rs->EOF) {

        if (trim($rs->fields{'team'}) == 'h') {

            $data{$i}{"spielstand"} = trim($rs->fields{'spielstand'}) . "  " . mb_convert_encoding($rs->fields{'spieler_h'}, 'UTF-8', 'CP1252');
            $pdf->Text($w, $ih + $ii, ($data{$i}{"spielstand"}));
            if (trim($rs->fields{'elfer'} == 2)) {
                $pdf->Image($imagesDir."missed.png", $w - 5, $ih + $ii - 2.5);
            } else {
                $pdf->Image($imagesDir."scored.png", $w - 5, $ih + $ii - 2.5);
            }
        }

        if (trim($rs->fields{'team'}) == 'a') {

            $data{$i}{"spielstand_a"} = trim($rs->fields{'spielstand'}) . "  " . mb_convert_encoding($rs->fields{'spieler_a'}, 'UTF-8', 'CP1252');
            $pdf->Text($w, $ih + $ii, ($data{$i}{"spielstand_a"}));
            if (trim($rs->fields{'elfer'} == 2)) {
                $pdf->Image($imagesDir."missed.png", $w - 5, $ih + $ii - 2.5);
            } else {
                $pdf->Image($imagesDir."scored.png", $w - 5, $ih + $ii - 2.5);
            }
        }

        $i++;
        $ii+=5;

        $rs->MoveNext();
    }

    $rs->Close();
}


/*
 * **************************** SPIELEBILDER **********************************************
 */


$querySQL = "select dateiname, art, "
        . " (select count(*) from media where id = " . $spiel_id . " and ref = 'sb') as anzahl  "
        . "from media where id = " . $spiel_id . " and ref = 'sb' order by art -- and art = 'fr'"
        . ";";

$rs = $dbSyb->Execute($querySQL);

if (!$rs) {
    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('lfd_nr' => ($dbSyb->ErrorMsg()));

    print json_encode($out);
    return;
}



if ($rs->fields{'anzahl'} > 0) {



    $pdf->AddPage();
    $h = 5;
    $seitenHoehe = $pdf->GetPageHeight();
    $seitenBreite = $pdf->GetPageWidth();

    while (!$rs->EOF) {
        if ($rs->fields{'art'} == "ga") {
            $images = $mediaDir."pdf\\";
        } else {
            $images = $mediaDir."thumbnails\\";
        }

        if (isset($rs->fields{'dateiname'})) {
            $data{$i}{"dateiname"} = ($rs->fields{'dateiname'});
        } else {
            $data{$i}{"dateiname"} = "no_image.jpg";
        }
        list($width, $height, $type, $attr) = getimagesize($images . $data{$i}{"dateiname"});
        $picHeight = $height / 3.779528; // Umrechnung von pixel in mm
        $picWidth = $width / 3.779528; // Umrechnung von pixel in mm
        $w = ($seitenBreite - $picWidth) / 2;

        if ($seitenHoehe > $picHeight) {
            $pdf->Image($images . $data{$i}{"dateiname"}, $w, $h, 'jpg');
            $h+=$picHeight + 3;
        } else {
            $pdf->AddPage();
            $h = 5;
            $seitenHoehe = $pdf->GetPageHeight();
            $pdf->Image($images . $data{$i}{"dateiname"}, $w, $h, 'jpg');
            $h+=$picHeight + 3;
        }
        $seitenHoehe -= $picHeight;
        $i++;
        $rs->MoveNext();
    }
}

$rs->Close();


//Seitenzahl
//$pdf->SetFont('Arial', '', 10);
////        $this->Cell(0, 10, 'Seite ' . $this->PageNo() . '/{nb}', 0, 0, 'C');
//$pdf->Text(100, 292, 'Seite ' . $pdf->PageNo() . '/{nb}');
//$pdf->AddPage();
// PDF-Ausgabe
$pdf->Output("test.pdf", "I");
?>