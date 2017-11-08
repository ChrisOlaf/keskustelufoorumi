<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kirjautumissivu</title>
</head>
<body>
    <h3>Kirjaudu sisään</h3>
    <form action="LoginServlet" method="post";>
        <fieldset>
            <legend>Syötä käyttäjätunnus ja salasana</legend>
            <h5>Käyttäjätunnus</h5><input type="text" name="kayttajanimi" required>
            <br>
            <h5>Salasana</h5><input type="password" name="salasana" required>
            <br>
            <br>
            <input type="submit" value="Sisään">
        </fieldset>
    </form>

</body>
</html>
