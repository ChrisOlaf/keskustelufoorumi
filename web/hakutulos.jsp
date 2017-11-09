<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<html>
<head>
    <title>Hakutulos</title>
</head>
<body>
    <div id="fiidi">
        <table border="1">
            <tr>
                <th colspan="3"><h2>Hakutulokset</h2></th>
            </tr>
            <tr>
                <th>Otsikko</th><th>Viesti</th><th>Kirjoittaja</th>
            </tr>

            <c:forEach var="viesti" items="${sessionScope.viestiLista}">
                <tr><td><a href="viesti?value=${viesti.id}" method="post"><c:out value="${viesti.otsikko}" /></a></td>
                    <td><c:out value="${viesti.viesti}" /></td>
                    <td><c:out value="${viesti.nimimerkki}" /></td>
                </tr>
            </c:forEach>

            <%--<c:forEach var="row" items="${hakutulos.rows}">--%>
                <%--<tr>--%>
                    <%--<td><a href="viesti?value=${row.id}" method="post">${row.otsikko}</a></td><td>${row.viesti}</td><td>${row.nimimerkki}</td><td>${row.nimi}</td>--%>
                <%--</tr>--%>
            <%--</c:forEach>--%>
        </table>
    </div>

</body>
</html>
