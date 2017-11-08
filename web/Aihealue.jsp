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
<sql:query var="rs" dataSource="jdbc/FoorumiDB">
    select * from viesti join henkilo on viesti.kirjoittaja = henkilo.hloid where alueid = 1
</sql:query>
<html>
<head>
    <title>Aihealue</title>
    <style>
        td {
            column-width: 350px;

        }
    </style>
</head>
<body>
<c:forEach var="row" items="${rs.rows}">
    <table border="3">
        <tr><td>Otsikko ${row.otsikko}</td><td>Kirjoittaja ${row.nimimerkki}</td><td>Aika ${row.kirjoitettu}</td></tr>
    </table>
</c:forEach>


</body>
</html>
