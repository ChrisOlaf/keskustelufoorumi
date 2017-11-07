<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Etusivu</title>
    <link rel="stylesheet" type="text/css" href="style/foorumi.css">
</head>
<body>
    <div id="banneri">
        <h1>FOORUMI</h1>
    </div>
    <br>
    <br>
    <div>
        <nav id="navi">
            <a href="Aihealue.jsp">Netflix-sarjat</a>
            <a href="Aihealue.jsp">HBO-fanit</a>
            <a href="Aihealue.jsp">Julkkisjuorut</a>
            <a href="Aihealue.jsp">Viiniarvostelut</a>
            <a href="Aihealue.jsp">Munchies</a>
        </nav>
    </div>
    <br>
    <br>
    <div id="fiidi">
        <table border="4">
            <tr>
                <th colspan="3"><h2>Uusimmat viestit</h2></th>
            </tr>
            <tr>
                <th>Otsikko</th><th>Viestin alku</th><th>Kirjoittaja</th>
            </tr>
            <tr>
                <td>Keskustelu 1</td><td>Olen sitä mieltä, että</td><td>Maikki</td>
            </tr>
            <tr>
                <td>Keskustelu 1</td><td>Olen sitä mieltä, että</td><td>Pirre</td>
            </tr>
        </table>
    </div>
    <br>
    <br>
    <div id="lomake">
    <h3>Kirjaudu sisään</h3>
    <form method="post";>
        <fieldset>
            <legend>Syötä käyttäjätunnus ja salasana</legend>
            <h5>Käyttäjätunnus</h5><input type="text" name="kayttis" required>
            <br>
            <h5>Salasana</h5><input type="text" name="salasana" required>
            <br>
            <br>
            <input type="submit" value="Sisään">
        </fieldset>
    </form>
    </div>
</body>
</html>
