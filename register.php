<!DOCTYPE html>
<html lang="de">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Mundial Login</title>
        <link href="styles.css" rel="stylesheet">
        <script src="register.js"></script>
        <!--<script src="..\login\md5.js" type="text/javascript"></script>--> 
        <script src="..\login\sha512.js" type="text/javascript"></script> 
    </head>
    <body>
        <img id="bg_img" alt="Register" class="center">
        <div class="box">
            <span id="title">FUTBOL MUNDIAL</span>
            <form>
                <br />
                 <!--<label for="name">User: </label>-->
                 <span class="glyphi" id="glyph_usr"></span>                    
                <input class="feld" type="text" name="benutzername" id="benutzername"/>
                <br />
                <br />
                <!--<label for="passwort">Passwort: </label>-->
                <span class="glyphi glyph_pw"></span> 
                <input class="feld" type="password" name="passwort" id="passwort""/>
                <br />               
                <br />
                <!--<label for="passwort2">Passwort bestätigen: </label>-->
				<span class="glyphi glyph_pw"></span>  
                <input class="feld" type="password" name="passwort2" id="passwort2"/>
                <br />  
				<!-- <br />
                 <label for="email">E-Mail: </label>
                 <input class="feld" type="text" name="email" id="email"/>
                 <br /> -->               
            </form> 
            <br />
            <div><button class="button" id="btnLogin">Send</button></div>          
<p id="antwort"></p>
        </div>


    </body>
</html>

