<!DOCTYPE html>
<html lang="de">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Mundial Login</title>
        <link href="styles.css" rel="stylesheet"> 
	<script src="login.js"></script> 
        

    </head>
    <body>
        <img alt="Login">
        <div class="box">

            <form>
                 <br />
                 <label for="name">User: </label>
                 <input class="feld" type="text" name="benutzername" id="benutzername" size="20"/>
                <br />
                <br />
                <label for="passwort">Passwort: </label>
                <input class="feld" type="password" name="passwort" id="passwort" size="20"/>
                <br />              
            </form> 
            <br/>
            <div><button class="button" id="btnLogin">Login</button>     <button class="button" id="btnRegister">Register</button></div>         
        </div>
        <br />
        <p class="box" id="antwort"></p>
        <script src="..\login\md5.js" type="text/javascript"></script>

		
    </body>
</html>