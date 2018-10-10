<?php 
function resize($target, $new, $w, $h){
list($wo, $ho)= getimagesize($target);    

$nen = imagecreatefrompng($target);    
$chen = imagecreatetruecolor($w, $h);
imagecopyresampled($chen, $nen,0,0,0,0,$w,$h,$wo,$ho);
imagejpeg($chen, $new, 100);
}


// $target = basename($_FILES['datei']['name']);
		// $new = $target;
		// $type = $_FILES['datei']['type'];
		// $w = 158;
		// $h = 205;
		// resize($target, $new,$w,$h,$type);

?>









