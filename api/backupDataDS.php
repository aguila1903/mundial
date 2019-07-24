<?php

$path = __DIR__ . "\\Backups\\";
$backups = scandir($path);
$i = 2;
$ii = 0;
$data = array();
$out = array();


while ($i < count($backups)) {
    $pathinfo = pathinfo($path.$backups[$i]);
    if ($pathinfo['extension'] == "sql") {
        $data{$ii}{"dateiname"} = $backups[$i];
        $data{$ii}{"dateigroesse"} = filesize($path.$backups[$i]);
        $data{$ii}{"dateizeit"} = date("d.m.Y H:i:s", fileatime($path.$backups[$i]));
		$ii++;
    }
    $i++;
}

print json_encode($data);
?>