<?php

session_start();

require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');
header("Cache-Control: no-cache, must-revalidate");
$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");

if (isset($_SESSION["login"]) && $_SESSION["login"] == login) {





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


        print ("Anmeldung: " . $dbSyb->ErrorMsg());

        $data = array();

        return ($data);
    }

    $dbSyb->debug = false;
    $out = array();


    if (isset($_REQUEST["lookFor"])) {
        $lookFor = $_REQUEST["lookFor"];
    } else {
        $lookFor = "";
    }


    if (isset($_REQUEST["stadionname"])) {
        $andStadionName = $_REQUEST["stadionname"];
        if ($andStadionName == "null" || $andStadionName == "") {
            $andStadionName = "";
        } else {

            $andStadionName = " and sp.stadion_id = " . $andStadionName;
        }
    } else {
        $andStadionName = "";
    }

    if (isset($_REQUEST["land"])) {
        $land = $_REQUEST["land"];
        if ($land == "null" || $land == "") {
            $andLand = "";
        } else {

            $andLand = " and sp.land = " . $dbSyb->Quote(($land));
        }
    } else {
        $andLand = "";
    }

    if (isset($_REQUEST["ort"])) {
        $ort = $_REQUEST["ort"];
        if ($ort == "null" || $ort == "") {
            $andOrt = "";
        } else {

            $andOrt = " and sp.ort = " . $ort;
        }
    } else {
        $andOrt = "";
    }

    if (isset($_REQUEST["spieler_id"])) {
        $spieler_id = $_REQUEST["spieler_id"];
        if ($spieler_id == "null" || $spieler_id == "") {
            $andSpieler = "";
        } else {

            $andSpieler = " and ss.spieler_id = " . $spieler_id;
        }
    } else {
        $andSpieler = "";
    }

    if (isset($_REQUEST["trainer_id"])) {
        $trainer_id = $_REQUEST["trainer_id"];
        if ($trainer_id == "null" || $trainer_id == "") {
            $andTrainer = "";
        } else {

            $andTrainer = " and sp.trainer_id_a  = " . $trainer_id . " or sp.trainer_id_h = " . $trainer_id;
        }
    } else {
        $andTrainer = "";
    }

    if (isset($_REQUEST["verein_id"])) {
        $verein_id = $_REQUEST["verein_id"];
        if ($verein_id == "null" || $verein_id == "") {
            $andVerein = "";
        } else {

            $andVerein = " and sp.verein_id_a  = " . $verein_id . " or sp.verein_id_h = " . $verein_id;
        }
    } else {
        $andVerein = "";
    }

    if (isset($_REQUEST["schiri_id"])) {
        $schiri_id = $_REQUEST["schiri_id"];
        if ($schiri_id == "null" || $schiri_id == "") {
            $andSchiri = "";
        } else {

            $andSchiri = " and sp.schiri_id  = " . $schiri_id;
        }
    } else {
        $andSchiri = "";
    }

    if (isset($_REQUEST["ergebnis"])) {
        $ergebnis = $_REQUEST["ergebnis"];
        if ($ergebnis == "null" || $ergebnis == "") {
            $andErgebnis = "";
        } else {

            $andErgebnis = " and sp.ergebnis  = " . $dbSyb->Quote(($ergebnis));
        }
    } else {
        $andErgebnis = "";
    }

    if (isset($_REQUEST["erg_zusatz"])) {
        $erg_zusatz = $_REQUEST["erg_zusatz"];
        if ($erg_zusatz == "null" || $erg_zusatz == "") {
            $andErg_Zusatz = "";
        } else {

            $andErg_Zusatz = " and sp.erg_zusatz  = " . $dbSyb->Quote(($erg_zusatz));
        }
    } else {
        $andErg_Zusatz = "";
    }

    if (isset($_REQUEST["wettbewerb"])) {
        $liga_id = $_REQUEST["wettbewerb"];
        if ($liga_id == "null" || $liga_id == "") {
            $andWettbewerb = "";
        } else {

            $andWettbewerb = " and sp.liga_id  = " . $liga_id;
        }
    } else {
        $andWettbewerb = "";
    }

    if (isset($_REQUEST["begleiter_id"])) {
        $begleiter_id = $_REQUEST["begleiter_id"];
        if ($begleiter_id == "null" || $begleiter_id == "") {
            $andBegleiter = "";
        } else {

            $andBegleiter = " and bs.begleiter_id  = " . $begleiter_id;
        }
    } else {
        $andBegleiter = "";
    }

    if (isset($_REQUEST["sp_datum"])) {
        $sp_datum = $_REQUEST["sp_datum"];
        if ($sp_datum == "null" || $sp_datum == "") {
            $andDatum = "";
        } else {

            $andDatum = " and DATE_FORMAT(sp.sp_datum,GET_FORMAT(DATE,'EUR'))  = " . $dbSyb->Quote(($sp_datum));
        }
    } else {
        $andDatum = "";
    }
    if (isset($_REQUEST["dayname"])) {
        $dayname = $_REQUEST["dayname"];
        if ($dayname == "null" || $dayname == "") {
            $andDatum = "";
        } else {

            $andDayName = " and DAYNAME(sp.sp_datum)  = " . $dbSyb->Quote(($dayname));
        }
    } else {
        $andDayName = "";
    }


    if (isset($_REQUEST["jahr"])) {
        $jahr = $_REQUEST["jahr"];
        if ($jahr == "null" || $jahr == "") {
            $andJahr = "";
        } else {

            $andJahr = " and Year(sp.sp_datum) = " . $dbSyb->Quote(($jahr));
        }
    } else {
        $andJahr = "";
    }

    if (isset($_REQUEST["ausverkauft"])) {
        $ausverkauft = $_REQUEST["ausverkauft"];
        if ($ausverkauft == "null" || $ausverkauft == "") {
            $andAusverkauft = "";
        } else {
            $andAusverkauft = " and sp.ausverkauft = " . $ausverkauft;
        }
    } else {
        $andAusverkauft = "";
    }


    $querySQL = "select distinct ";

    if ($lookFor == "stadionname") {
        $querySQL .= " ifnull(sp.stadion_id,'') as stadion_id, ifnull(sl.stadionname,'') as stadionname,"
                . "(select count(stadion_id) from sp_besuche where (stadion_id = sp.stadion_id) ) as anzahl, "
                . "(select stadionname from stadionliste where stadion_id = ifnull(sp.stadion_id,'')) as sortStad ";
         $UnionStadion = " Union Select distinct
          ifnull(sn.stadion_id,'') as stadion_id, concat(ifnull(sn.name_vor_ae,''),' (',ifnull(sl.stadionname,''),')') as stadionname,
          (select count(stadion_id) from sp_besuche where (stadion_id = sp.stadion_id)) as anzahl, 
          (select ifnull(stadionname,'') from stadionliste where stadion_id = ifnull(sn.stadion_id,'')) as sortStad
          From sp_besuche sp left join laender l on sp.land = l.code "
          . " left join schiris s on sp.schiri_id = s.schiri_id "
          . " left join ligen w on w.liga_id = sp.liga_id "
          . " left join orte o on sp.ort = o.ort_id "
          . " Left join vereine vh on vh.verein_id = sp.verein_id_h "
          . " Left join vereine va on va.verein_id = sp.verein_id_a"
          . " Left join trainer th on th.trainer_id = sp.trainer_id_h "
          . " Left join trainer ta on ta.trainer_id = sp.trainer_id_a"
          . " Left Join stadionliste sl on sl.stadion_id = sp.stadion_id "
          . " RIGHT join stadionnamen sn on sp.stadion_id_alt = sn.lfd_nr"
          . " LEFT JOIN sp_spieler_spiel_tabelle ss on ss.spiel_id = sp.spiel_id "
          . " LEFT JOIN spieler spi on spi.spieler_id = ss.spieler_id "
          . " LEFT JOIN sp_begleiter_spiel_tabelle bs on bs.spiel_id = sp.spiel_id "
          . " Left Join begleiter b on b.begleiter_id = bs.begleiter_id "
          . " WHERE  sp.spiel_id > -1 "
          . $andStadionName
          . $andLand
          . $andOrt
          . $andSpieler
          . $andTrainer
          . $andVerein
          . $andSchiri
          . $andErgebnis
          . $andErg_Zusatz
          . $andWettbewerb
          . $andBegleiter
          . $andDatum
          . $andAusverkauft
          . $andDayName
          . $andJahr; 
    }
    else {
    $UnionStadion = "";
    }

    if ($lookFor == "land") {
        $querySQL .= " l.de as land , sp.land as code, (select count(land) from sp_besuche where land = sp.land) as anzahl, l.de as sort_land ";
    }
    if ($lookFor == "ort") {
        $querySQL .= "  ifnull(o.ort,'') as ort, ifnull(sp.ort,'') as ort_id, (select count(ort) from sp_besuche where ort = sp.ort) as anzahl, ifnull(o.ort,'') ";
    }
    if ($lookFor == "spieler_id") {
        $querySQL .= " ifnull(CONCAT(IFNULL(trim(spi.vorname), ''), ' ', trim(spi.name)),'') AS name,
    ifnull(ss.spieler_id,'') as spieler_id, ifnull(DATE_FORMAT(spi.geb_datum,GET_FORMAT(DATE,'EUR')), '') as geb_datum, (SELECT IFNULL(CONCAT(IFNULL(vorname, ''), ' ', name),'') 
    FROM spieler WHERE spieler_id = IFNULL(ss.spieler_id, '')) sort_name,
    (select count(spieler_id) from sp_spieler_spiel_tabelle where spieler_id = ss.spieler_id ) as anzahl";
    }

    if ($lookFor == "ausverkauft") {
        $querySQL .= " sp.ausverkauft, case when sp.ausverkauft = 0 then 'Nein' when sp.ausverkauft = 1 then 'Ja' end as Ausverkauft, "
                . "(select count(ausverkauft) from sp_besuche where ausverkauft = sp.ausverkauft) as anzahl"
                . ", sp.ausverkauft as sort_ausv ";
    }

    if ($lookFor == "trainer_id") {
        $querySQL .= " ifnull(sp.trainer_id_a,'') as trainer_id, ifnull(ta.name,'') as trainername, "
                . "(SELECT COUNT(*) FROM sp_besuche LEFT JOIN trainer v1 ON trainer_id_a = v1.trainer_id
                          LEFT JOIN trainer v2 ON trainer_id_h = v2.trainer_id WHERE v1.trainer_id = sp.trainer_id_a OR v2.trainer_id = sp.trainer_id_a) as anzahl, "
                . "(select name from trainer where trainer_id = ifnull(sp.trainer_id_a,''))   ";
        $UnionTrainer = " Union Select distinct
		ifnull(sp.trainer_id_h,'') as trainer_id, ifnull(th.name,'') as trainername, 
                (SELECT COUNT(*) FROM sp_besuche LEFT JOIN trainer v1 ON trainer_id_a = v1.trainer_id
                          LEFT JOIN trainer v2 ON trainer_id_h = v2.trainer_id WHERE v1.trainer_id = sp.trainer_id_h OR v2.trainer_id = sp.trainer_id_h) as anzahl,
                (select name from trainer where trainer_id = ifnull(sp.trainer_id_h,''))   
		 From sp_besuche sp left join laender l on sp.land = l.code "
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
                . " Left Join begleiter b on b.begleiter_id = bs.begleiter_id "
                . " WHERE  sp.spiel_id > -1 "
                . $andStadionName
                . $andLand
                . $andOrt
                . $andSpieler
                . $andTrainer
                . $andVerein
                . $andSchiri
                . $andErgebnis
                . $andErg_Zusatz
                . $andWettbewerb
                . $andBegleiter
                . $andDatum
                . $andAusverkauft
                . $andDayName
                . $andJahr;
    } else {
        $UnionTrainer = "";
    }

    if ($lookFor == "schiri_id") {
        $querySQL .= " ifnull(s.name, '') as schiriname, ifnull(sp.schiri_id, '') as schiri_id, (select count(*) from sp_besuche where schiri_id = sp.schiri_id) as anzahl"
                . ", ifnull(s.name, '') ";
    }
    if ($lookFor == "verein_id") {
        $querySQL .= " ifnull(sp.verein_id_h,'') as verein_id, ifnull(vh.gaengiger_name,'') AS vereinsname,
            (SELECT COUNT(*) FROM sp_besuche LEFT JOIN vereine v1 ON verein_id_a = v1.verein_id
                          LEFT JOIN vereine v2 ON verein_id_h = v2.verein_id WHERE v1.verein_id = sp.verein_id_h OR v2.verein_id = sp.verein_id_h) as anzahl,
                (select gaengiger_name from vereine WHERE verein_id = ifnull(sp.verein_id_h,'')) as sortVerein";
        $UnionVereine = " Union Select distinct
		ifnull(sp.verein_id_a,'') as verein_id, ifnull(va.gaengiger_name,'') AS vereinsname,
                (SELECT COUNT(*) FROM sp_besuche LEFT JOIN vereine v1 ON verein_id_a = v1.verein_id
                          LEFT JOIN vereine v2 ON verein_id_h = v2.verein_id WHERE v1.verein_id = sp.verein_id_a OR v2.verein_id = sp.verein_id_a) as anzahl, 
                (select gaengiger_name from vereine WHERE verein_id =  ifnull(sp.verein_id_a,'')) as sortVerein"
                . " From sp_besuche sp left join laender l on sp.land = l.code "
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
                . " Left Join begleiter b on b.begleiter_id = bs.begleiter_id "
                . " WHERE  sp.spiel_id > -1 "
                . $andStadionName
                . $andLand
                . $andOrt
                . $andSpieler
                . $andTrainer
                . $andVerein
                . $andSchiri
                . $andErgebnis
                . $andErg_Zusatz
                . $andWettbewerb
                . $andBegleiter
                . $andDatum
                . $andAusverkauft
                . $andDayName
                . $andJahr;
    } else {
        $UnionVereine = "";
    }

    if ($lookFor == "begleiter_id") {
        $querySQL .= " ifnull(b.name, '') as begleitername, ifnull(bs.begleiter_id,'') as begleiter_id , "
                . "(Select count(b.begleiter_id) from sp_begleiter_spiel_tabelle b where b.begleiter_id = bs.begleiter_id) as anzahl, ifnull(b.name, '') sortBegleiter";
    }
    if ($lookFor == "liga_id") {
        $querySQL .= " ifnull(w.liga_bez, '') as liga_bez , ifnull(sp.liga_id, '') as liga_id , (select count(liga_id) from sp_besuche where liga_id = sp.liga_id) as anzahl, ifnull(w.liga_bez, '') as sort_Wettbew";
    }
    if ($lookFor == "ergebnis") {
        $querySQL .= " ifnull(sp.ergebnis, '') as ergebnis, (select count(ergebnis) from sp_besuche where ergebnis = sp.ergebnis) as anzahl, '', ifnull(sp.ergebnis, '') as sort_erg ";
    }
    if ($lookFor == "erg_zusatz") {
        $querySQL .= "     IFNULL(sp.erg_zusatz, 'nada') AS erg_zusatz,
    CASE
        WHEN sp.erg_zusatz = 'nvUiE' THEN 'Nach Verlängerung und im Elfmeterschießen'
        WHEN sp.erg_zusatz = 'i. E.' THEN 'Im Elfmeterschießen'
        WHEN sp.erg_zusatz = 'n. V.' THEN 'Nach Verlängerung'
        ELSE 'Noch nicht in den Genuss gekommen'
    END AS Erg_zusatz,
    (Select count(erg_zusatz) from sp_besuche where erg_zusatz = sp.erg_zusatz) as anzahl,
    IFNULL(sp.erg_zusatz, '') AS sort_erg_zusatz ";
    }
    if ($lookFor == "sp_datum") {
        $querySQL .= " DATE_FORMAT(sp.sp_datum,GET_FORMAT(DATE,'EUR')) as sp_datum, '', (select count(sp_datum) from sp_besuche where sp_datum = sp.sp_datum) as anzahl ,sp.sp_datum as sort_datum ";
    }
    if ($lookFor == "dayname") {
        $querySQL .= " DAYNAME(sp.sp_datum) as dayname, '', (select count(sp_datum) from sp_besuche where sp_datum = sp.sp_datum group by DAYNAME(sp_datum)) as anzahl ,weekday(sp.sp_datum) as sort_day ";
    }
    if ($lookFor == "jahr") {
        $querySQL .= " Year(sp.sp_datum) as jahr, '', (select count(YEAR(sp_datum)) from sp_besuche where YEAR(sp_datum) = YEAR(sp.sp_datum)) as anzahl, Year(sp.sp_datum) as sortJahr ";
    }
    $querySQL .=
            " From sp_besuche sp left join laender l on sp.land = l.code "
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
            . " Left Join begleiter b on b.begleiter_id = bs.begleiter_id "
            . " WHERE  sp.spiel_id > -1 "
            . $andStadionName
            . $andLand
            . $andOrt
            . $andSpieler
            . $andTrainer
            . $andVerein
            . $andSchiri
            . $andErgebnis
            . $andErg_Zusatz
            . $andWettbewerb
            . $andBegleiter
            . $andDatum
            . $andJahr
            . $andAusverkauft
            . $andDayName
            . $UnionVereine
            . $UnionStadion
            . $UnionTrainer
            . " Order by 4";
    // . $lookFor ;
//    file_put_contents('SpieleSucheFelderDS.txt', $querySQL);

    $rs = $dbSyb->Execute($querySQL); //=>>> Abfrage wird an den Server übermittelt / ausgeführt?

    $data = array();

    if (!$rs) {
        // keine Query hat nicht funtioniert
        //print("Query 1: " . $dbSyb->ErrorMsg());
        //
    //>> [1] Fehlermeldung: INSERT-Fehler
        $out = array();

        $out{'response'}{'data'} = $data;
        $out{'response'}{'status'} = -4;
        $out{'response'}{'errors'} = array('land' => ($dbSyb->ErrorMsg()));

        print json_encode($out);
        return;
    }

    $i = 0;

    while (!$rs->EOF) {

        if (isset($rs->fields{'land'})) {
            $data{$i}{"land"} = ($rs->fields{'land'});
        }

        if (isset($rs->fields{'code'})) {
            $data{$i}{"code"} = ($rs->fields{'code'});
        }

        if (isset($rs->fields{'stadionname'})) {
            $data{$i}{"stadionname"} = ($rs->fields{'stadionname'});
        }

        if (isset($rs->fields{'stadion_id'})) {
            $data{$i}{"stadion_id"} = $rs->fields{'stadion_id'};
        }

        if (isset($rs->fields{'ort'})) {
            $data{$i}{"ort"} = ($rs->fields{'ort'});
        }

        if (isset($rs->fields{'ort_id'})) {
            $data{$i}{"ort_id"} = ($rs->fields{'ort_id'});
        }

        if (isset($rs->fields{'spieler_id'})) {
            $data{$i}{"spieler_id"} = $rs->fields{'spieler_id'};
        }

        if (isset($rs->fields{'geb_datum'})) {
            $data{$i}{"geb_datum"} = $rs->fields{'geb_datum'};
        }

        if (isset($rs->fields{'name'})) {
            $data{$i}{"name"} = trim(($rs->fields{'name'}));
        }

        if (isset($rs->fields{'trainer_id'})) {
            $data{$i}{"trainer_id"} = $rs->fields{'trainer_id'};
        }

        if (isset($rs->fields{'trainername'})) {
            $data{$i}{"trainername"} = ($rs->fields{'trainername'});
        }

        if (isset($rs->fields{'verein_id'})) {
            $data{$i}{"verein_id"} = $rs->fields{'verein_id'};
        }

        if (isset($rs->fields{'vereinsname'})) {
            $data{$i}{"vereinsname"} = ($rs->fields{'vereinsname'});
        }

        if (isset($rs->fields{'begleiter_id'})) {
            $data{$i}{"begleiter_id"} = $rs->fields{'begleiter_id'};
        }

        if (isset($rs->fields{'begleitername'})) {
            $data{$i}{"begleitername"} = ($rs->fields{'begleitername'});
        }

        if (isset($rs->fields{'liga_bez'})) {
            $data{$i}{"liga_bez"} = ($rs->fields{'liga_bez'});
        }

        if (isset($rs->fields{'liga_id'})) {
            $data{$i}{"liga_id"} = $rs->fields{'liga_id'};
        }

        if (isset($rs->fields{'ergebnis'})) {
            $data{$i}{"ergebnis"} = ($rs->fields{'ergebnis'});
        }

        if (isset($rs->fields{'erg_zusatz'})) {
            $data{$i}{"erg_zusatz"} = ($rs->fields{'erg_zusatz'});
        }

        if (isset($rs->fields{'Erg_zusatz'})) {
            $data{$i}{"Erg_zusatz"} = $rs->fields{'Erg_zusatz'};
        }

        if (isset($rs->fields{'sp_datum'})) {
            $data{$i}{"sp_datum"} = $rs->fields{'sp_datum'};
        }

        if (isset($rs->fields{'jahr'})) {
            $data{$i}{"jahr"} = $rs->fields{'jahr'};
        }

        if (isset($rs->fields{'schiriname'})) {
            $data{$i}{"schiriname"} = ($rs->fields{'schiriname'});
        }

        if (isset($rs->fields{'schiri_id'})) {
            $data{$i}{"schiri_id"} = $rs->fields{'schiri_id'};
        }

        if (isset($rs->fields{'Ausverkauft'})) {
            $data{$i}{"Ausverkauft"} = ($rs->fields{'Ausverkauft'});
        }

        if (isset($rs->fields{'ausverkauft'})) {
            $data{$i}{"ausverkauft"} = $rs->fields{'ausverkauft'};
        }
        if (isset($rs->fields{'anzahl'})) {
            $data{$i}{"anzahl"} = $rs->fields{'anzahl'};
        }
        if (isset($rs->fields{'dayname'})) {
            $data{$i}{"dayname"} = $rs->fields{'dayname'};
        }

        $i++;
        $rs->MoveNext();
    }

    $rs->Close();

    $out{'response'}{'data'} = $data;
    $out{'response'}{'status'} = 0;
    $out{'response'}{'errors'} = array();

    print json_encode($out);
} else {
    header("Location: http://$host$uri/noadmin.php");
}
?>