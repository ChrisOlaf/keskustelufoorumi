<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 7.11.2017
  Time: 11.15
  To change this template use File | Settings | File Templates.
--%>
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
            <input type="submit" value="Sisään">
        </fieldset>
    </form>
</body>
</html>
