<?php

$path = getcwd()."\Backups\\";
$backups = array();
$backups = scandir($path);
$i = 2;
$ii = 0;
$data = array();
$out = array();


while($i<count($backups)){    
    
    $data{$ii}{"dateiname"} = ($backups[$i]);
    $i++;
    $ii++;
}

print json_encode($data);


?>