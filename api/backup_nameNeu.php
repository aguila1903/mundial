<?php

session_start();

require_once('db_psw.php');



if (isset($_REQUEST["dateiname"])) {
    $dateiname = ($_REQUEST["dateiname"]);
} else {
    $out = array();

    $out{'response'}{'status'} = -4;
    $out{'response'}{'errors'} = array('ID' => "Wo isn der neue Dateiname?");

    return;
}

$path = getcwd() . "\Backups\\";

//$datum = getdate();
//$dateiname = $datum["year"]."-".$datum["mon"]."-".$datum["mday"].".bak";


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

$batch = "@echo off\n
cd c:\\xampp\\mysql\\bin\n


c:\\xampp\\mysql\\bin\\mysqldump.exe -uroot -p" . psw . " " . db . " > $path$dateiname.sql --routines\n

echo %errorlevel% ";

file_put_contents("$path$dateiname.bat", $batch);

$bathFileRun = "$path$dateiname.bat";


$output = exec("C:\\windows\\system32\\cmd.exe /c $bathFileRun");


$data = array();

if ($output == 0) {
    $data{"rueckmeldung"} = ($path) . $dateiname.".sql";
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