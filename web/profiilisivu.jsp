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
<div>
<a href="index.jsp">Etusivu</a>
<a href="LogoutServlet">Kirjaudu ulos</a>
</div>
<div>
<h1><%= session.getAttribute("knimi")%>n profiilisivu!</h1>
</div>
<div>

</div>
</body>
</html>
