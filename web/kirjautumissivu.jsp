<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kirjautumissivu</title>
</head>
<body>
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

</body>
</html>
