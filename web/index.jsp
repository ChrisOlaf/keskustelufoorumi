<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<sql:query var="alue" dataSource="jdbc/FoorumiDB">
    SELECT nimi, alueid FROM alue
</sql:query>
<sql:query var="uusimmat" dataSource="jdbc/FoorumiDB">
    SELECT viesti.otsikko, henkilo.nimimerkki, alue.nimi, viesti.viesti
    FROM viesti JOIN henkilo ON viesti.kirjoittaja=henkilo.hloid
    JOIN alue ON alue.alueid=viesti.alueid ORDER BY viesti.kirjoitettu DESC LIMIT 5
</sql:query>
<html>
<head>
    <title>Foorumi</title>
    <link rel="stylesheet" type="text/css" href="style/foorumi.css">
</head>
<body>
<div id="banneri">
    <h1>FOORUMI</h1>
</div>
<%--väliaikaiset linkit eri sivuille--%>
<a href="Aihealue.jsp">Aihealueelle</a>
<a href="viestisivu.jsp">Yksittäisen keskustelun sivulle</a>
<a href="LogoutServlet">Kirjaudu ulos</a>
<a href="ProfiiliServlet">Profiili</a>
<div id="kolumnit">
    <div id="aihealueet">
        <h3>Keskustelualueet</h3>
        <c:forEach var="row" items="${alue.rows}">
            <a href="Keskustelut?value=${row.alueid}" value="nro" action="Keskustelut" method="post">${row.nimi}</a><br><br>
        </c:forEach>
    </div>
    <div id="fiidi">
        <table border="1">
            <tr>
                <th colspan="4"><h2>Uusimmat viestit</h2></th>
            </tr>
            <tr>
                <th>Otsikko</th><th>Viesti</th><th>Kirjoittaja</th><th>Aihealue</th>
            </tr>
            <c:forEach var="row" items="${uusimmat.rows}">
                <tr>
                    <td><a href="viesti?value=${row.id}" method="post">${row.otsikko}</a></td><td>${row.viesti}</td><td>${row.nimimerkki}</td><td>${row.nimi}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<div>
    <div id="haku">
        <form action="HakuServlet" method="post">
            <fieldset>
                <legend>Hae keskusteluja otsikon perusteella</legend>
                <h5>Syötä hakusana</h5><input type="text" name="hakusana" required>
                <br>
                <input type="submit" value="Hae">
            </fieldset>
        </form>
    </div>
    <div id="lomake">
        <form action="LoginServlet" method="post">
            <fieldset>
                <legend>Kirjaudu sisään</legend>
                <h5>Käyttäjätunnus</h5><input type="text" name="kayttajanimi" required>
                <h5>Salasana</h5><input type="password" name="salasana" required>
                <br>
                <input type="submit" value="Sisään">
            </fieldset>
        </form>
    </div>
</div>
</body>
</html>