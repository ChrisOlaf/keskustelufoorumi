<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 7.11.2017
  Time: 21.30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<html>
<head>
    <title>Aihealue</title>
    <style>
        td {
            column-width: 350px;
            text-align: center;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="style/foorumi.css">
</head>
<body>
<h1 style="text-align: center"><b>Otsikko</b></h1>
<table border="2">
    <tr><th>Otsikko</th><th>Nimimerkki</th><th>Kirjoitettu</th> </tr>
<c:forEach var="viesti" items="${sessionScope.viestiLista}">
    <tr><td><a href="index.jsp"><c:out value="${viesti.otsikko}" /></a></td><td><c:out value="${viesti.nimimerkki}" /></td>
        <td><c:out value="${viesti.kirjoitettu}"/></td></tr>
</c:forEach>
</table>
<%--<c:forEach var="row" items="${rs.rows}">--%>
    <%--<table border="3">--%>
        <%--<tr><td>Otsikko ${row.otsikko}</td><td>Kirjoittaja ${row.nimimerkki}</td><td>Aika ${row.kirjoitettu}</td></tr>--%>
    <%--</table>--%>
<%--</c:forEach>--%>


</body>
</html>
