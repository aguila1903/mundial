<?php

session_start();

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


if (!$dbSyb->IsConnected()) {


    print ("Anmeldung: " . $dbSyb->ErrorMsg());

    $data = array();

    return ($data);
}

$dbSyb->debug = false;

if (isset($_REQUEST["dateiname"])) {
    $dateiname = ($_REQUEST["dateiname"]);
} else {
    $out = array();

    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('errors' => "Wo isn der Dateiname?");

    return;
}
$path = __DIR__ . "\\Backups\\";

//file_put_contents("LoadBackup.txt", $path);

if (is_file($path . $dateiname) != 1) {
    $out = array();

    $out{'response'}{'data'} = array();
    $out{'response'}{'status'} = -66;
    $out{'response'}{'errors'} = "Dateiname existiert nicht!";

    print json_encode($out);

    return;
}


//$datum = getdate();
//$dateiname = $datum["year"]."-".$datum["mon"]."-".$datum["mday"].".bak";


$find_path = explode("\\", __DIR__);
$sevenZip_path = "{$find_path[0]}\\{$find_path[1]}\\{$find_path[2]}\\include\\7-Zip\\App\\7-Zip";
$backup_path = __DIR__ . "\\Backups";
$images_path = __DIR__ . "\\images";
$mysql_bin_path = $find_path[0] . "\\" . $find_path[1] . "\\mysql\\bin";

/*
 * ************** BACKUP DATABASE *************************
 */

$batch = "@echo off\n
cd $mysql_bin_path\n


$mysql_bin_path\\mysql -uroot -p" . psw . " " . db . " < $path$dateiname \n

echo %errorlevel% ";

file_put_contents("$path$dateiname.bat", $batch);

$bathFileRun = "$path$dateiname.bat";

$output = exec("C:\\windows\\system32\\cmd.exe /c $bathFileRun");




$data = array();

if ($output == 0) {
    $data{"rueckmeldung"} = $path . $dateiname;
    /*
     * ************** BACKUP IMAGES *************************
     */
    if (!is_dir($images_path)) {
        mkdir($images_path);
    }
    $batch2 = "@echo off\n

$sevenZip_path\\7z.exe x -aoa -y $backup_path\\images.zip -o$images_path";

    if (is_file("$backup_path\\images.zip")) {
        file_put_contents(__DIR__ . "\\backupLoad.cmd", $batch2);

        $backupImages = __DIR__ . "\\backupLoad.cmd";

        exec("C:\\windows\\system32\\cmd.exe /c $backupImages");
    }
} else {

    unlink("$path$dateiname.sql");
    $out = array();

    $out{'response'}{'data'} = array();
    $out{'response'}{'status'} = -99;
    $out{'response'}{'errors'} = "Fehler in der Matrix!";

    print json_encode($out);

    return;
}

unlink("$path$dateiname.bat");

$out = array();

$out{'response'}{'status'} = 0;
$out{'response'}{'errors'} = array();
$out{'response'}{'data'} = $data;

print json_encode($out);
?>