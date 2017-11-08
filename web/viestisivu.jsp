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

<c:forEach var="row" items="${requestScope.viestiLista.viestiListaus}">
    <table>
        <tr>
            <td>
                Otsikko ${row.otsikko}
            </td>
        </tr>
        <tr>
            <td>
                Kirjoittaja ${row.nimimerkki}
            </td>
        </tr>
        <tr>
            <td>
                Aika ${row.ajankohta}
            </td>
        </tr>
        <tr>
            <td>
                Viesti ${row.viesti}
            </td>
        </tr>
    </table>
</c:forEach>


</body>
</html>
