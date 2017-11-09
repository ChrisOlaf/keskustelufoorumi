<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 9.11.17
  Time: 09:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Rekisteröityminen</title>
</head>
<link rel="stylesheet" type="text/css" href="style/foorumi.css">
<body>
<div id="banneri">
<h1>Tervetuloa Foorumin käyttäjäksi</h1>
</div>
<div id="lomake">
    <form action="rekisteroityminen" method="post">
        <fieldset>
            <legend>Rekisteröidy käyttäjäksi</legend>
            <h5>Käyttäjätunnus</h5><input type="text" name="nimimerkki" required>
            <h5>Nimi</h5><input type="text" name="nimi" required>
            <h5>Salasana</h5><input type="password" name="salasana" required>
            <h5>Rooli, esim. velho, virtuoosi, MESTARI</h5><input type="text" name="kuvaus" required>
            <h5>Minusta</h5><input type="text" name="kuvausteksti" required>
            <br>
            <input type="submit" value="Rekisteröidy">
        </fieldset>
    </form>
</div>

</body>
</html>
