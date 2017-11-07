<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<sql:query var="rs" dataSource="jdbc/FoorumiDB">
    select henkilo.nimimerkki, otsikko, kirjoitettu, viesti from viesti join henkilo on viesti.kirjoittaja = henkilo.hloid
</sql:query>

<html>
<head>
    <title>Viestisivu</title>
</head>
<body>
<h3>Tällä sivulla on yksittäinen viesti + vastaukset</h3>


<%--<h2>Viestin otsikko</h2>--%>
<%--</td></tr>--%>
<%--<tr><td>--%>
<%--Käyttäjä--%>
<%--</td>--%>
<%--<td>--%>
<%--Kellonaika--%>
<%--</td></tr>--%>
<%--<tr><td>--%>

<c:forEach var="row" items="${rs.rows}">
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
                Aika ${row.kirjoitettu}
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
