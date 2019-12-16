var xhr = new XMLHttpRequest();
var errColor = '#EE2C2C';
var normColor = '#F0F0F0';
function sendLogin() {

    var user = document.forms[0][0].value;
    var pw = hex_sha512(document.forms[0][1].value+user);
    var pw2 = hex_sha512(document.forms[0][2].value+user);
//    var email = document.forms[0][3].value;
    var params = "benutzername=" + user + "&passwort=" + pw + "&passwort2=" + pw2;
    xhr.open("POST", "api/userDS_add.php", true);
    xhr.responseType = "json";
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = handleResponse;
    xhr.send(params);
}

function handleResponse() {
    var rueckmeldung;
    rueckmeldung = xhr.response;

    if (xhr.readyState == 4) {
        if (rueckmeldung["ergebnis"] == 1) {
            document.getElementById("antwort").innerHTML = rueckmeldung["text"];
            setTimeout(regSuc, 5000);
        } else {
            document.getElementById("antwort").innerHTML = rueckmeldung["text"];
            switch (rueckmeldung["ergebnis"]) {
                case 4: // Kein Benutzername
                    document.getElementById("benutzername").style = "background-color: " + errColor;
                    break;
                case 5: // Kein Passwort
                    document.getElementById("passwort").style = "background-color: " + errColor;
                    break;
                case 6: // Keine Passwort-Übereinstimmung
                    document.getElementById("passwort2").style = "background-color: " + errColor;
                    document.getElementById("passwort").style = "background-color: " + errColor;
                    break;
                case 7: // Keine Passwort-Bestätigung
                    document.getElementById("passwort2").style = "background-color: " + errColor;
                    break;
                case 8: // Keine Passwort-Bestätigung
                    document.getElementById("email").style = "background-color: " + errColor;
                    break;
            }
        }
    }
}

function regSuc() {
    with (document) {
        getElementsByName("benutzername")[0].value = "";
        getElementsByName("passwort")[0].value = "";
        getElementsByName("passwort2")[0].value = "";
        // getElementsByName("email")[0].value = "";
    }

    window.open('http://' + document.location.host + '/mundial/home', '_self', false);

}
;

function init() {
    document.getElementById("btnLogin").onclick = sendLogin;
    document.images[0].src = "bilder/Panel1_nm.gif";

    document.addEventListener("keypress", function () {
        document.getElementById("passwort").style = "background-color: " + normColor;
        document.getElementById("passwort2").style = "background-color: " + normColor;
        document.getElementById("benutzername").style = "background-color: " + normColor;
        // document.getElementById("email").style = "background-color: white";
    });
    document.addEventListener("change", function () {
        document.getElementById("passwort").style = "background-color: " + normColor;
        document.getElementById("passwort2").style = "background-color: " + normColor;
        document.getElementById("benutzername").style = "background-color: " + normColor;
        // document.getElementById("email").style = "background-color: white";
    });
}

window.onload = init;