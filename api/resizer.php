<?php

function resize($target, $new, $w, $h, $type) {
    list($wo, $ho) = getimagesize($target);
    if ($type == "jpg") {
        $nen = imagecreatefromjpeg($target);
    } elseif ($type == "jpeg") {
        $nen = imagecreatefromjpeg($target);
    } elseif ($type == "gif") {
        $nen = imagecreatefromgif($target);
    } elseif ($type == "png") {
        $nen = imagecreatefrompng($target);
    }
    $chen = imagecreatetruecolor($w, $h);

    imagecopyresampled($chen, $nen, 0, 0, 0, 0, $w, $h, $wo, $ho);
    imagejpeg($chen, $new, 100);
}










