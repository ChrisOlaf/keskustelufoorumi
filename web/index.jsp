<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Etusivu</title>
</head>
<body>
    <div id="banneri">
        <h1>FOORUMI</h1>
    </div>

    <div>
        <nav id="navi">
            <a href="1.jsp">Aihe 1</a>
            <a href="2.jsp">Aihe 2</a>
            <a href="3.jsp">Aihe 3</a>
            <a href="4.jsp">Aihe 4</a>
            <a href="5.jsp">Aihe 5</a>
        </nav>
    </div>

    <div>
        <h3>Uusimmat viestit keskustelualueille</h3>
        <table>
            <tr><th>Keskustelu 1</th></tr>
            <tr><td>Keskustelu 2</td></tr>
            <tr><td>Keskustelu 3</td></tr>
        </table>
    </div>

    <div>
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
