<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 8.11.17
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
    <title>Profiilisivu</title>
    <link rel="stylesheet" type="text/css" href="style/foorumi.css">
</head>
<body>
<div id="banneri">
<h1><%= session.getAttribute("knimi")%></h1>
</div>
<div>
    <a href="index.jsp">Etusivu</a>
    <a href="LogoutServlet">Kirjaudu ulos</a>
</div>

<div id="fiidi">
    <table border="1">
    <tr>
        <th colspan="4"><h2>Omat tiedot</h2></th>
    </tr>
        <c:forEach var="k" items="${sessionScope.henkilotiedot}">
            <tr>
                <td>Nimi: ${k.nimi}</td>
            </tr>
        <tr>
            <td>Rooli: ${k.kuvaus}</td>
        </tr>
        <tr>
            <td>Minusta: ${k.kuvausteksti}</td>
        </tr>
        </c:forEach>
    </table>

    <table border="1">
            <tr>
                <th colspan="4"><h2>Aloittamasi keskustelut</h2></th>
            </tr>
            <tr>
                <th>Otsikko</th><th>Viesti</th><th>Kirjoitettu</th>
            </tr>
            <c:forEach var="msg" items="${sessionScope.kayttajanviestit}">
                <tr>
                    <td><a href="viesti?value=${msg.viestiID}" value="viestiID" action="viesti" method="post">${msg.otsikko}</a></td><td>${msg.viesti}</td><td>${msg.ajankohta}</td>
                </tr>
            </c:forEach>
        </table>
</div>
</body>
</html>
