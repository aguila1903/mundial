<?php

session_start();

require_once('db_psw.php');



$path = __DIR__ . "\\Backups\\";
$datum = getdate();
if ($datum["mon"] < 10) {
    $mon = (string) '0' . $datum["mon"];
} else {
    $mon = $datum["mon"];
}
$dateiname = $datum["year"] . "-" . $mon . "-" . $datum["mday"];


if (is_dir($path) != 1) {
    mkdir($path);
}

if (is_file($path . $dateiname . ".sql") == 1) {
    $out = array();

    $out{'response'}{'data'} = array();
    $out{'response'}{'status'} = -66;
    $out{'response'}{'errors'} = "Dateiname existiert bereits!";

    print json_encode($out);

    return;
}

$find_path = explode("\\", __DIR__);

$mysql_bin_path = $find_path[0] . "\\" . $find_path[1] . "\\mysql\\bin";
$sevenZip_path = "{$find_path[0]}\\{$find_path[1]}\\{$find_path[2]}\\include\\7-Zip\\App\\7-Zip";
$backup_path = __DIR__ . "\\Backups";
$images_path = __DIR__ . "\\images";

//file_put_contents("seven.txt", __DIR__);
//exit;

/*
 * ************** BACKUP DATABASE *************************
 */
$batch = "@echo off\n
cd $mysql_bin_path\n


$mysql_bin_path\\mysqldump.exe -uroot -p" . psw . " " . db . " > $path$dateiname.sql --routines\n

echo %errorlevel% ";

file_put_contents("$path$dateiname.bat", $batch);

$bathFileRun = "$path$dateiname.bat";


$output = exec("C:\\windows\\system32\\cmd.exe /c $bathFileRun");

$data = array();

if ($output == 0) {
    $data{"rueckmeldung"} = ($path) . $dateiname . ".sql";
    /*
     * ************** BACKUP IMAGES *************************
     */

    if (is_dir($images_path)) {
        $batch2 = "@echo off\n
cd $images_path\n

$sevenZip_path\\7z.exe a -tzip $backup_path\\images.zip * -mx9 -aoa ";


        file_put_contents(__DIR__ . "\\backup.cmd", $batch2);

        $backupImages = __DIR__ . "\\backup.cmd";

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
//    $rs->Close();   


$out = array();

$out{'response'}{'status'} = 0;
$out{'response'}{'errors'} = array();
$out{'response'}{'data'} = $data;

print json_encode($out);
?>