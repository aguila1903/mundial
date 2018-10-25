<?php

session_start();

require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');
header("Cache-Control: no-cache, must-revalidate");
$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");


$ADODB_CACHE_DIR = 'C:/php/cache';
$ADODB_FETCH_MODE = ADODB_FETCH_ASSOC;
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


$querySQL = "SELECT Distinct "
        . "  sp.spiel_id "
        . ", concat(sp.sp_datum,' ',sp.zeit) as start "
        . ", adddate(concat(sp.sp_datum,' ',sp.zeit),INTERVAL 90 minute) as end "
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
        . " LEFT Join begleiter b on b.begleiter_id = bs.begleiter_id ";

//file_put_contents("calendarDS.txt", $querySQL);
$rs = $dbSyb->Execute($querySQL);


if (!$rs) {
    print $dbSyb->ErrorMsg() . "\n";
    return;
}
$i = 0;

$data = array();

while (!$rs->EOF) {
    $data{$i}{"spiel_id"} = trim($rs->fields{'spiel_id'});
    $data{$i}{"stadion_id_alt"} = trim($rs->fields{'stadion_id_alt'});
    $data{$i}{"stadionname_alt"} = ($rs->fields{'stadionname_alt'});
    $data{$i}{"stadion_id"} = trim($rs->fields{'stadion_id'});
    $data{$i}{"zeit"} = trim($rs->fields{'zeit'});
    $data{$i}{"trainer_id_a"} = trim($rs->fields{'trainer_id_a'});
    $data{$i}{"trainer_id_h"} = trim($rs->fields{'trainer_id_h'});
    $data{$i}{"schiri_verein"} = ($rs->fields{'schiri_verein'});
    $data{$i}{"wochentag"} = ($rs->fields{'wochentag'});
    $data{$i}{"wettbewerb_zusatz"} = ($rs->fields{'wettbewerb_zusatz'});
    $data{$i}{"anschrift"} = ($rs->fields{'anschrift'});
    $data{$i}{"trainer_a"} = ($rs->fields{'trainer_a'});
    $data{$i}{"trainer_h"} = ($rs->fields{'trainer_h'});
    $data{$i}{"zusch_anzahl"} = number_format(trim($rs->fields{'zusch_anzahl'}), 0, ',', '.');
    $data{$i}{"kapazitaet"} = number_format(trim($rs->fields{'kapazitaet'}), 0, ',', '.');
    $data{$i}{"gaestefans"} = number_format(trim($rs->fields{'gaestefans'}), 0, ',', '.');
    // $data{$i}{"erg_a"} = trim($rs->fields{'erg_a'});
    // $data{$i}{"erg_h"} = trim($rs->fields{'erg_h'});
    $data{$i}{"verein_id_a"} = trim($rs->fields{'verein_id_a'});
    $data{$i}{"verein_id_h"} = trim($rs->fields{'verein_id_h'});
    $data{$i}{"paarung"} = ($rs->fields{'verein_h'}) . ' - ' . ($rs->fields{'verein_a'});
    $data{$i}{"sp_datum"} = trim($rs->fields{'sp_datum'});
    $data{$i}{"schiri_id"} = trim($rs->fields{'schiri_id'});
    $data{$i}{"schiri"} = ($rs->fields{'schiri'});
    $data{$i}{"name"} = ($rs->fields{'name'});
    $data{$i}{"liga_id"} = trim($rs->fields{'liga_id'});
    $data{$i}{"ort_id"} = trim($rs->fields{'ort_id'});
    $data{$i}{"ort"} = ($rs->fields{'ort'});
    $data{$i}{"sp_bericht"} = ($rs->fields{'sp_bericht'});
    $data{$i}{"bes_vork"} = ($rs->fields{'bes_vork'});
    $data{$i}{"land"} = ($rs->fields{'land'});
    $data{$i}{"code"} = ($rs->fields{'code'});
    $data{$i}{"verein_a"} = ($rs->fields{'verein_a'});
    $data{$i}{"verein_h"} = ($rs->fields{'verein_h'});
    $data{$i}{"erg"} = trim($rs->fields{'ergebnis'});
    $data{$i}{"erg_elfer"} = trim($rs->fields{'erg_elfer'});
    $data{$i}{"erg_halb"} = trim($rs->fields{'erg_halb'});
    $data{$i}{"erg_zusatz"} = trim($rs->fields{'erg_zusatz'});
    $data{$i}{"sprit"} = number_format($rs->fields{'sprit'}, 2, ',', '.');
    $data{$i}{"bahn"} = number_format($rs->fields{'bahn'}, 2, ',', '.');
    $data{$i}{"flieger"} = number_format($rs->fields{'flieger'}, 2, ',', '.');
    $data{$i}{"verpflegung"} = number_format($rs->fields{'verpflegung'}, 2, ',', '.');
    $data{$i}{"uebernachtung"} = number_format($rs->fields{'uebernachtung'}, 2, ',', '.');
    $data{$i}{"sonstige"} = number_format($rs->fields{'sonstige'}, 2, ',', '.');
    $data{$i}{"ges_kosten"} = number_format($rs->fields{'ges_kosten'}, 2, ',', '.');
    $data{$i}{"eintrittskarte"} = number_format($rs->fields{'eintrittskarte'}, 2, ',', '.');
    $data{$i}{"sprit_anteilig"} = number_format($rs->fields{'sprit_anteilig'}, 2, ',', '.');
    $data{$i}{"schiff"} = number_format($rs->fields{'schiff'}, 2, ',', '.');
    $data{$i}{"souvenir"} = number_format($rs->fields{'souvenir'}, 2, ',', '.');
    $data{$i}{"taxi"} = number_format($rs->fields{'taxi'}, 2, ',', '.');
    $data{$i}{"handy"} = number_format($rs->fields{'handy'}, 2, ',', '.');
    $data{$i}{"ausverkauft"} = trim($rs->fields{'ausverkauft'});
    if (strlen(trim($rs->fields{'zusatz'})) > 0) {
        $data{$i}{"wettbewerb"} = ($rs->fields{'wettbewerb'}) . " (" . ($rs->fields{'zusatz'}) . ")";
    } else {
        $data{$i}{"wettbewerb"} = ($rs->fields{'wettbewerb'});
    }
    if (strlen(trim($rs->fields{'stadionname_alt'})) == 0 || trim($rs->fields{'stadionname_alt'}) == '' || trim($rs->fields{'stadionname_alt'}) == 'NULL' || trim($rs->fields{'stadionname_alt'}) == null) {
        $data{$i}{"stadionname"} = ($rs->fields{'stadionname'});
    } else {
        $data{$i}{"stadionname"} = ($rs->fields{'stadionname'}) . ' </br>(' . ($rs->fields{'stadionname_alt'}) . ")";
    }
    if (strlen(trim($rs->fields{'erg_zusatz'})) > 0) {
        if (trim($rs->fields{'erg_zusatz'}) == "n. V.") {
            $data{$i}{"ergebnis"} = trim($rs->fields{'ergebnis'}) . ' (' . trim($rs->fields{'erg_halb'}) . ") " . trim($rs->fields{'erg_zusatz'});
        }
        if (trim($rs->fields{'erg_zusatz'}) == "i. E.") {
            $data{$i}{"ergebnis"} = trim($rs->fields{'ergebnis'}) . ' (' . trim($rs->fields{'erg_halb'}) . ") </br>" . trim($rs->fields{'erg_elfer'}) . " " . trim($rs->fields{'erg_zusatz'});
        }
        if (trim($rs->fields{'erg_zusatz'}) == "nvUiE") {
            $data{$i}{"ergebnis"} = trim($rs->fields{'ergebnis'}) . ' (' . trim($rs->fields{'erg_halb'}) . ") n.V. </br>" . trim($rs->fields{'erg_elfer'}) . " i. E.";
        }
    } else {
        $data{$i}{"ergebnis"} = trim($rs->fields{'ergebnis'}) . ' (' . trim($rs->fields{'erg_halb'}) . ")";
    }
    $data{$i}{"nummer"} = $rs->fields{'anzahl'};
    $data{$i}{"id"} = trim($rs->fields{'spiel_id'});
    $ergebnis = $rs->fields{'verein_h'} . "  " . $rs->fields{'ergebnis'} . "  " . $rs->fields{'verein_a'};
    $wettbewerb = $rs->fields{"wettbewerb"} . " (" . $rs->fields{"wettbewerb_zusatz"} . ")";
    $ort = $rs->fields{'ort'} . " / " . $rs->fields{'land'};
    $data{$i}{"title"} = $ergebnis;
    $data{$i}{"start"} = ($rs->fields{'start'});
    $data{$i}{"end"} = ($rs->fields{'end'});
    $data{$i}{"description"} = "<b>$ergebnis</b></br>$wettbewerb</br>$ort";
    if (date('Y-m-d') == substr($rs->fields{'start'}, 0, 10)) {
        $data{$i}{"color"} = 'green';
        $data{$i}{"textColor"} = 'white';
    } else {
        if (str_replace("-", "", substr($rs->fields{'start'}, 0, 10)) > date('Ymd')) {
            $data{$i}{"color"} = 'orange';
            $data{$i}{"textColor"} = 'black';
        } else {
            $data{$i}{"color"} = 'grey';
            $data{$i}{"textColor"} = 'white';
        }
    }
//    file_put_contents("datum.txt", str_replace("-", "", substr($rs->fields{'start'}, 0, 10))."\n", FILE_APPEND);
//       $data{$i}{"canEdit"} = "false";
    // $data{$i}{"eventWindowStyle"} = "testStyle";

    $i++;

    // den nächsten Datensatz lesen
    $rs->MoveNext();
}

$rs->Close();

$out = array();



// zentrale Anwortfunktion f�r REST-Datenquellen
// im Kern nicht anderes als print json_encode($data)
$out{'response'}{'status'} = 0;
$out{'response'}{'errors'} = array();
$out{'response'}{'data'} = $data;

print json_encode($data);
