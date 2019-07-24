
<?php
session_start();

require_once('adodb5/adodb.inc.php');
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
$dbSyb->Connect(link, user, psw, db);//$dsn = "'localhost','root',psw,'vitaldb'";



$status = json_encode('stop');
$bild = json_encode('');

if (!$dbSyb->IsConnected()) {
    $result = json_encode('Datenbank-Verbindung konnte nicht hergestellt werden!');
   
    echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";

    return;
}
$dbSyb->debug = false;


if (isset($_REQUEST["ref"])) {
    if($_REQUEST["ref"] != "null" && $_REQUEST["ref"] != ""){
    $ref = $_REQUEST["ref"];    
    }else {
    $result = json_encode('Die Media-Referenz fehlt!');
   
    echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";

    return;
}
} else {
    $result = json_encode('Die Media-Referenz fehlt!');
   
    echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";

    return;
}


if (isset($_REQUEST["bild_art"])) {
    if($_REQUEST["bild_art"] != "null" && $_REQUEST["bild_art"] != ""){
    $bild_art = $_REQUEST["bild_art"];    
    }else {
    $result = json_encode('Die Art des Bildes fehlt!');
   
    echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";

    return;
}
} else {
    $result = json_encode('Die Art des Bildes fehlt!');
   
    echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";

    return;
}

if (isset($_REQUEST["stadion_id"])) {
    if($_REQUEST["stadion_id"] != "null" && $_REQUEST["stadion_id"] != ""){
    $stadion_id = $_REQUEST["stadion_id"];    
    }else {
    $result = json_encode('Die Stadion-ID fehlt!');
   
    echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";

    return;
}
} else {
    $result = json_encode('Die Stadion-ID fehlt!');
   
    echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";

    return;
}

   
//if (isset($_FILES['datei']) && (($_FILES["datei"]["type"] != "image/gif"
//&& ($_FILES["datei"]["type"] != "image/jpeg")
//&& ($_FILES["datei"]["type"] != "image/jpg")
//&& ($_FILES["datei"]["type"] != "image/pjpeg")
//&& ($_FILES["datei"]["type"] != "image/x-png")
//&& ($_FILES["datei"]["type"] != "image/png")))) {
//
//        $result = json_encode('Bei der übergebenen Datei handelt es sich nicht um eine Bild-Datei!</br></br>Bitte nur Grafiken mit dem Format jpg, jpeg, pjpeg, png oder x-png hochladen.');
//      
//        echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";
//
//        return;
//    }
    
    $path1 = getcwd() . "\images\\";
    $path2 = getcwd() . "\images\media\\";
    $path3 = getcwd() . "\images\media\thumbnails\\";

    if (is_dir($path1) != 1) {
        mkdir($path1, 0777, true);
        chmod($path1, 0777);
    }

    if (is_dir($path2) != 1) {
        mkdir($path2, 0777, true);
        chmod($path2, 0777);
    }
	
	 if (is_dir($path3) != 1) {
        mkdir($path3);
    }

 if(isset($_FILES['datei'])){ 
$name_array = $_FILES['datei']['name']; 
$tmp_name_array = $_FILES['datei']['tmp_name']; 
$type_array = $_FILES['datei']['type']; 
$size_array = $_FILES['datei']['size']; 
$error_array = $_FILES['datei']['error']; 

$i = 0;
$count = count($tmp_name_array);

while($i < $count){ 

if(move_uploaded_file($tmp_name_array[$i], $path2.$name_array[$i])){
    
      $querySQL = " Call mediaUpload (". $dbSyb->Quote($name_array[$i])
                     .", ". $dbSyb->Quote($ref)
					 .", ". $stadion_id
                     .", ". $dbSyb->Quote($bild_art) .")";
            
            $rs = $dbSyb->Execute($querySQL);           
            

echo $name_array[$i]." upload is complete<br>"; } 
else { 
echo "move_uploaded_file function failed for ".$name_array[$i]."<br>"; } 
$i++;
} 
  $rs->Close(); 
} 
  

?>
