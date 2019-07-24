
<?php
session_start();

require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');
header("Cache-Control: no-cache, must-revalidate");
$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");

if (isset($_SESSION["login"]) && $_SESSION["login"] == login && $_SESSION["admin"] == admin) {





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
   if (isset($_REQUEST["verein_id"])) {
    if($_REQUEST["verein_id"] != "null" && $_REQUEST["verein_id"] != ""){
    $stadion_id = $_REQUEST["verein_id"];    
    }else {
    $result = json_encode('Die Stadion-ID fehlt!');
   
    echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";

    return;
}
}else{
$result = json_encode('Die ID fehlt!');
   
    echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";

    return;
}
}

   
if (isset($_FILES['datei']) && (($_FILES["datei"]["type"] != "image/gif"
&& ($_FILES["datei"]["type"] != "image/jpeg")
&& ($_FILES["datei"]["type"] != "image/jpg")
&& ($_FILES["datei"]["type"] != "image/pjpeg")
&& ($_FILES["datei"]["type"] != "image/x-png")
&& ($_FILES["datei"]["type"] != "image/png")))) {

        $result = json_encode('Bei der übergebenen Datei handelt es sich nicht um eine Bild-Datei!</br></br>Bitte nur Grafiken mit dem Format jpg, jpeg, pjpeg, png oder x-png hochladen.');
      
        echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";

        return;
    }
    
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

    if (!$_FILES['datei']['error']) {
        $bild_name = basename(($_FILES['datei']['name']));
        $target = $path2 . $bild_name;
        if (@move_uploaded_file($_FILES['datei']['tmp_name'], $path2 . $bild_name)) {
		
		
		include("resizer.php");
		
		list($wo, $ho)= getimagesize($target);
		$new = getcwd() . '/images/media/thumbnails/' . $bild_name; // Pfad für den Thumbnail
		$type = $_FILES['datei']['type'];
		if($ref == "vn"){ // Upload bei Vereinswappen
				if($wo < $ho){
				$w = ($wo/$ho)*100;
                $h = 100;
		}else if($wo == $ho)
		{$w = 100;
		$h = 100;}
		else if($wo > $ho)
		{$w = 100;
		$h = ($ho/$wo)*100;}
		}else{ // Upload bei Stadion-Bildern
		if($wo < $ho){
                $w = ($wo/$ho)*203;
                $h = 203;}
                else{
                $w = 175;
                $h = ($ho/$wo)*175;   
                }}
		resize($target, $new,$w,$h,$type); // Funktion in der reseizer.php wird ausgeführt
		
		if($bild_art == 'fr'){
		list($wo, $ho)= getimagesize($target);
		$new = getcwd() . '/images/media/cover/' . $bild_name; // Pfad für den Thumbnail
		$type = $_FILES['datei']['type'];
		if($ref == "vn"){
			if($wo < $ho){
				$w = ($wo/$ho)*220;
                $h = 220;
		}else if($wo == $ho){$w = 220;
		$h = 220;}
		else if($wo > $ho)
		{$w = 220;
		$h = ($ho/$wo)*220;}
		}
		else{// Upload beim Stadion-Cover
		if($wo < $ho){
                $w = ($wo/$ho)*390;
                $h = 390;}
                else{
                 $w = 310;
                $h = ($ho/$wo)*310;   
                }}
		resize($target, $new,$w,$h,$type); // Funktion in der reseizer.php wird ausgeführt
		
		}
       

            $querySQL = " Call mediaUpload (". $dbSyb->Quote($bild_name)
                     .", ". $dbSyb->Quote($ref)
					 .", ". $stadion_id
                     .", ". $dbSyb->Quote($bild_art) .")";
            
//            file_put_contents("bild_upload.txt", $querySQL);
            
            $rs = $dbSyb->Execute($querySQL);


            if (!$rs) {

                $result = json_encode('Datenbank-Fehler aufgetregen</br>' . $dbSyb->ErrorMsg());               
                echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";
                return;
            }

            $i = 0;
            $ergebnis = "";

            while (!$rs->EOF) {
                $ergebnis = $rs->fields{'ergebnis'};

                $i++;

                $rs->MoveNext();
            }

            $rs->Close();
            
//            if(isset($rs->fields{'ergebnis'}) && isset($rs->fields{'historie'})){
            if ($ergebnis == 1) {

                $result = json_encode(($bild_name) . ' erfolgreich hochgeladen!');
                $status = json_encode("ok");
                $bild = json_encode(($bild_name));
                echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";
            } else {

                $result = json_encode("Datei Upload hat versagt. (" . $ergebnis . ")");
                echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";
            } 
			
			if ($ergebnis == 99) {

                $result = json_encode("Dieser Dateiname existiert bereits für ein anderes Medium. Bitte ändern Sie den Dateinamen und versuchen Sie es erneut.");
                echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";
            } 
            
//                }else {
//
//                $result = json_encode("Keine Rückmeldung erhalten.");
//                echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";
//            } 
        
            }
			
			else { //echo 'Datei Upload hat versagt.'; 
            $result = json_encode("Fehler beim verschieben der Datei!");
            echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";
        }
            
            
    } else {

        $fehlerText = "?";

        $fehler = $_FILES['datei']['error'];

        if ($fehler == 0) {
            $fehlerText = "kein Datei-Fehler!";
        } else
        if ($fehler == 1) {
            $fehlerText = "Fehler 1 (" . $_FILES['datei']['size'] . ")";
        } else
        if ($fehler == 2) {
            $fehlerText = "Fehler 2(" . $_FILES['datei']['size'] . ")";
        } else
        if ($fehler == 3) {
            $fehlerText = "die Datei wurde nur teilweise übertragen";
        } else
        if ($fehler == 4) {
            $fehlerText = "es wurde keine Datei übertragen";
        }


        $result = json_encode($fehlerText);
        echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";
    }
} else {
    header("Location: http://$host/kartal/noadmin.php");
}
?>
