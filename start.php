<?php
session_start();
require_once('db_psw.php');
header("Cache-Control: no-cache, must-revalidate");
header("Expires: Sat, 26 Jul 1997 05:00:00 GMT"); // Datum in der Vergangenheit
$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");

if (isset($_SESSION["login"]) && $_SESSION["login"] == login /* && $_SESSION["admin"] == admin */) {
    //  echo ("Hallo: " . $_SESSION["benutzer"]);
    ?>
    <HTML>
        <HEAD>            
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge" >
            <meta name="viewport" content="width = device-width, initial-scale = 1">
            <TITLE>FUTBOL MUNDIAL</TITLE>
            <link href="main.css" rel="stylesheet">
            <SCRIPT type="text/javascript">
                    var isomorphicDir = "../include/isomorphic/";</SCRIPT>           
            <SCRIPT type="text/javascript" SRC="../include/isomorphic/system/modules/ISC_Core.js?locale=de">
            </SCRIPT>
            <SCRIPT type="text/javascript" SRC="../include/isomorphic/system/modules/ISC_Foundation.js?locale=de">
            </SCRIPT>
            <SCRIPT type="text/javascript" SRC="../include/isomorphic/system/modules/ISC_Containers.js?locale=de">
            </SCRIPT>
            <SCRIPT type="text/javascript" SRC="../include/isomorphic/system/modules/ISC_Grids.js?locale=de">
            </SCRIPT>
            <SCRIPT type="text/javascript" SRC="../include/isomorphic/system/modules/ISC_Forms.js?locale=de">
            </SCRIPT>
            <SCRIPT type="text/javascript" SRC="../include/isomorphic/system/modules/ISC_DataBinding.js?locale=de">
            </SCRIPT>
            <SCRIPT type="text/javascript" SRC="../include/isomorphic/system/modules/ISC_Calendar.js?locale=de">
            </SCRIPT>
            <SCRIPT type="text/javascript" SRC="../include/isomorphic/system/modules/ISC_RichTextEditor.js?locale=de">
            </SCRIPT>
            <SCRIPT type="text/javascript" SRC="../include/isomorphic/skins/Graphite/load_skin.js?locale=de">
            </SCRIPT>
            <SCRIPT type="text/javascript" SRC="../include/isomorphic/locales/frameworkMessages_de.properties">
            </SCRIPT>

            <script src="../include/js/amcharts/amcharts/amcharts.js" type="text/javascript"></script>  
            <script src="../include/js/amcharts/amcharts/pie.js" type="text/javascript"></script>
            <script src="../include/js/amcharts/amcharts/serial.js" type="text/javascript"></script>

            <link rel="stylesheet" href="../include/js/ammap/ammap/ammap.css" type="text/css">
            <script src="../include/js/ammap/ammap/ammap_amcharts_extension.js" type="text/javascript"></script>
            <!-- map file should be included after ammap.js -->
            <script src="../include/js/ammap/ammap/maps/js/worldHigh.js" type="text/javascript"></script>
            <!--<script src="js/ammap/ammap/maps/js/worldLow.js" type="text/javascript"></script>-->
            <script src="../include/js/ammap/ammap/themes/black.js" type="text/javascript"></script>
            <script src="../include/js/ammap/ammap/themes/chalk.js" type="text/javascript"></script>
            <script src="../include/js/ammap/ammap/themes/dark.js" type="text/javascript"></script>
            <script src="../include/js/ammap/ammap/themes/light.js" type="text/javascript"></script>
            <script src="../include/js/ammap/ammap/themes/patterns.js" type="text/javascript"></script>
            <link rel='stylesheet' href='calendar/fullcalendar.css' />
            <script src='calendar/lib/jquery.min.js'></script>
            <script src='calendar/lib/moment.min.js'></script>
            <script src='calendar/fullcalendar.js'></script> 
            <script src='calendar/locale-all.js'></script>
        </HEAD>
        <BODY>
            <SCRIPT type="text/javascript">
                  sidAdmin = "<?php echo $_SESSION['admin'] ?>";
			admin = "<?php echo admin ?>";
			user = "<?php echo $_SESSION['benutzer'] ?>";
		</script>
            <noscript>Bitte aktivieren Sie JavaScript in Ihrem Browser, ansonsten kann diese Seite nicht korrekt angezeigt werden.</noscript><!--Info-Meldung falls JavaScript nicht aktiviert ist-->
            <script src="functions.js" type="text/javascript"></script>      
            <script src="start.js" type="text/javascript"></script>
                
        </BODY>
    </HTML>
    <?php
} else {
    // header("Location: http://$host$uri/login.php");
    header("Location: http://$host$uri/noadmin.php");
}
?>

