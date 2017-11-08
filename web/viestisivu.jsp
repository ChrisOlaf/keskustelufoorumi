<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<%--<sql:query var="rs" dataSource="jdbc/FoorumiDB">--%>
    <%--select henkilo.nimi, otsikko, kirjoitettu, viesti from viesti join henkilo on viesti.kirjoittaja = henkilo.hloid--%>
<%--</sql:query>--%>

<html>
<head>
    <title>Viestisivu</title>
</head>
<body>
<h3>Tällä sivulla on yksittäinen viesti + vastaukset</h3>

<c:forEach var="msg" items="${sessionScope.viestiLista}">
    <table>
        <tr>
            <td>
                Otsikko ${msg.otsikko}
            </td>
        </tr>
        <tr>
            <td>
                Kirjoittaja ${msg.nimimerkki}
            </td>
        </tr>
        <tr>
            <td>
                Aika ${msg.ajankohta}
            </td>
        </tr>
        <tr>
            <td>
                Viesti ${msg.viesti}
            </td>
        </tr>
    </table>
</c:forEach>


</body>
</html>
