<?php

// Script written by Adam Khoury for the following video exercise: // http://www.youtube.com/watch?v=7fTsf80RJ5w 
require_once('adodb5/adodb.inc.php');
require_once('db_psw.php');

$status = json_encode('stop');
$bild = json_encode('');
$date = date("d_m_Y");

if (isset($_FILES['datei'])) {

    $name = $_FILES['datei']['name'];
    $tmp_name = $_FILES['datei']['tmp_name'];
    $type = $_FILES['datei']['type'];
} else {
    $result = json_encode('Die Update-Zip Fehlt');

    echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";

    return;
}

$path1 = getcwd() . "\Backups\\";
$path2 = getcwd() . "\Backups\zips\\";

if (is_dir($path1) != 1) {
    mkdir($path1, 0777, true);
    chmod($path1, 0777);
}

if (is_dir($path2) != 1) {
    mkdir($path2, 0777, true);
    chmod($path2, 0777);
}

// Falls der Ordner Update und die Datei update.zip vorhanden sind, werden diese gelöscht, damit es nicht zu Problemen mit älteren Dateien kommt
if (is_dir($path2 . "update_" . $date)) {
    if (is_file($path2 . "update_" . $date . "\\update.bat")) {
        unlink($path2 . "update_" . $date . "\\update.bat");
    }
    if (is_file($path2 . "update_" . $date . "\\copy.txt")) {
        unlink($path2 . "update_" . $date . "\\copy.txt");
    }
}

if (is_dir($path2)) {
    if (is_file($path2 . "update.zip")) {
        unlink($path2 . "update.zip");
    }

//    rmdir($path2 . "update");
}

// Hochgeladene Zip-Datei wird verschoben und entpackt
if (move_uploaded_file(($tmp_name), $path2 . ($name))) {
    $zip = new ZipArchive;
    if ($zip->open($path2 . ($name)) === TRUE) {
$zip->extractTo($path2 . "update_" . $date);
        $zip->close();
        unlink($path2 . $name);
        // Prüfung auf Existenz der Update Dateien
        $copy_txt = is_file($path2 . "update_" . $date . "\\copy.txt");
        $update_bat = is_file($path2 . "update_" . $date . "\\update.bat");

        if (is_file($path2 . "update_" . $date . "\\sql.sql")) {
            copy($path2 . "update_" . $date . "\\sql.sql", $path2 . "sql.sql");
        }


// Beide Update-Dateien sind vorhanden
        if ($copy_txt && $update_bat) {
// Datenbank wird mit cmd.exe beschrieben

            $output = exec("C:\\windows\\system32\\cmd.exe /c " . $path2 . "update_" . $date . "\\update.bat");

            if ($output == 66) {
                $result = json_encode("Fehler ($output) beim Sichern der Datenbank. Update wird abgebrochen. </br>");
                $status = json_encode("ok");
                $bild = json_encode(($name));
                echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";
                return;
            } elseif ($output == 99) {
                $result = json_encode("Fehler ($output) beim aktualisieren der Datenbank. Update wird abgebrochen </br>");
                $status = json_encode("ok");
                $bild = json_encode(($name));
                echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";
                return;
            } else {

                // Keine Fehler aufgetreten, die Dateien können kopiert werden
                $copy_file = file_get_contents($path2 . "update_" . $date . "\\copy.txt");

                $copy_file = str_replace("\r", "", $copy_file);

                $copy_arr = explode("\n", $copy_file);

                $i = 0;
                $copy_err = "";
                $copy_suc = "";

                while ($i < count($copy_arr)) {

                    $copy_execute = explode(",", $copy_arr[$i]);
                    $source = $copy_execute[0];
                    $dest = $copy_execute[1];
                    file_put_contents("update_log.txt", count($copy_arr) . " " . $i . " " . $source . " " . $dest . "\n", FILE_APPEND);

                    if (!copy($path2 . "update_" . $date . "\\" . $source, $dest)) {
                        $copy_err .= ($i + 1) . $source . "</br>";
                        file_put_contents("update_log.txt", $copy_err . "\n", FILE_APPEND);
                    } else {
                        $copy_suc .= ($i + 1) . ". " . $source . "</br>";
                    }

                    $i++;
                }
                if ($copy_err == "") {
                    $result = json_encode('<b>Update erfolgreich durchgeführt!</b></br>Folgende ' .
                            ($i) . ' Dateien wurden kopiert: </br>' . $copy_suc . '<b></br> </br> Damit die Änderungen wirksam werden, bitte abmelden und wieder anmelden.</b>');
                    $status = json_encode("ok");
                    $bild = json_encode(($name));
                    echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";
                    return;
                } else {
                    $result = json_encode("Datenbank wurde erfolgreich aktualisiert aber folgende Dateien konnten nicht kopiert werden: </br>" . $copy_err);
                    $status = json_encode("ok");
                    $bild = json_encode(($name));
                    echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";
                    return;
                }
            }
        } elseif (!$copy_txt && $update_bat) {
            $output = exec("C:\\windows\\system32\\cmd.exe /c " . $path2 . "update_" . $date . "\\update.bat");

            if ($output == 66) {
                $result = json_encode("Fehler ($output) beim Sichern der Datenbank. Die Datenbank wird daher nicht aktualisiert. Es werden nur die neuen Skirpte eingespielt. </br>");
                $status = json_encode("ok");
                $bild = json_encode(($name));
                echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";
                return;
            } elseif ($output == 99) {
                $result = json_encode("Fehler ($output) beim aktualisieren der Datenbank. </br>");
                $status = json_encode("ok");
                $bild = json_encode(($name));
                echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";
                return;
            } else {
                $result = json_encode('<b>Datenbank wurde erfolgreich aktualisiert!</b></br></br> Damit die Änderungen wirksam werden, bitte abmelden und wieder anmelden.</br>');
                $status = json_encode("ok");
                $bild = json_encode(($name));
                echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";
                return;
            }
        } elseif ($copy_txt && !$update_bat) {

            $copy_file = file_get_contents($path2 . "update_" . $date . "\\copy.txt");

            $copy_file = str_replace("\r", "", $copy_file);

            $copy_arr = explode("\n", $copy_file);

            $i = 0;
            $copy_err = "";
            $copy_suc = "";

            while ($i < count($copy_arr)) {

                $copy_execute = explode(",", $copy_arr[$i]);
                $source = $copy_execute[0];
                $dest = $copy_execute[1];
                    file_put_contents("update_log.txt", count($copy_arr) . " " . $i . " " . $source . " " . $dest . "\n", FILE_APPEND);

                if (!copy($path2 . "update_" . $date . "\\" . $source, $dest)) {
                    $copy_err .= ($i + 1) . $source . "</br>";
                        file_put_contents("update_log.txt", $copy_err . "\n", FILE_APPEND);
                } else {
                    $copy_suc .= ($i + 1) . ". " . $source . "</br>";
                }

                $i++;
            }
            if ($copy_err == "") {
                $result = json_encode('<b>Update erfolgreich durchgeführt!</b></br>Folgende ' .
                        ($i) . ' Dateien wurden kopiert: </br>' . $copy_suc . '<b></br> </br> Damit die Änderungen wirksam werden, bitte abmelden und wieder anmelden.</b>');
                $status = json_encode("ok");
                $bild = json_encode(($name));
                echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";
                return;
            } else {
                $result = json_encode("Datenbank wurde erfolgreich aktualisiert aber folgende Dateien konnten nicht kopiert werden: </br>" . $copy_err);
                $status = json_encode("ok");
                $bild = json_encode(($name));
                echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";
                return;
            }
        } else {
            $result = json_encode("Die zum Update benötigten Dateien copy.txt und update.bat konnten nicht gefunden werden!!");
            echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";
            return;
        }
    } else {
        $result = json_encode("Fehler beim entpacken der Update-Datei " . $name);
        $status = json_encode("ok");
        $bild = json_encode(($name));
        echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";
    }
} else { //echo 'Datei Upload hat versagt.'; 
    $result = json_encode("Fehler beim verschieben der Datei " . $name);
    $status = json_encode("ok");
    $bild = json_encode(($name));
    echo "<script type=\"text/javascript\">if(window && window.parent && window.parent['{$_POST['uploadFormID']}'] && window.parent['{$_POST['uploadFormID']}'].submitDone) { window.parent['{$_POST['uploadFormID']}'].submitDone($result, $status, $bild); } </script>";
}
?>