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
    <%--<style>--%>
    <%--td {--%>
    <%--column-width: 350px;--%>
    <%--text-align: center;--%>
    <%--}--%>
    <%--table {--%>
    <%--width: 100%;--%>
    <%--}--%>
    <%--</style>--%>
    <link rel="stylesheet" type="text/css" href="style/foorumi.css">
</head>
<body>
<div id="banneri">
    <c:forEach var="aiheet" items="${sessionScope.otsikkoLista}">
        <h1 style="text-align: center"><c:out value="${aiheet.nimi}"/></h1>
    </c:forEach>
</div>
<div>
<table border="2">
    <tr>
        <th>Otsikko</th>
        <th>Nimimerkki</th>
        <th>Kirjoitettu</th>
    </tr>
    <c:forEach var="viesti" items="${sessionScope.viestiLista}">
        <tr>
            <td><a href="viesti?value=${viesti.viestiID}"><c:out value="${viesti.otsikko}"/></a></td>
            <td><c:out value="${viesti.nimimerkki}"/></td>
            <td><c:out value="${viesti.ajankohta}"/></td>
        </tr>
    </c:forEach>
</table>
</div>
<%--<c:forEach var="row" items="${rs.rows}">--%>
<%--<table border="3">--%>
<%--<tr><td>Otsikko ${row.otsikko}</td><td>Kirjoittaja ${row.nimimerkki}</td><td>Aika ${row.kirjoitettu}</td></tr>--%>
<%--</table>--%>
<%--</c:forEach>--%>
<div>
<table>
    <tr>
        <td>
            <c:choose>
                <c:when test="${sessionScope.knimi != null}">
                    <form action="uusiviesti" method="post">
                        <fieldset>
                            <legend>Kirjoita uusi viesti:</legend>
                            <c:forEach var="viesti0" items="${sessionScope.otsikkoLista}">
                                <input type="text" id="viotsikko" name="uusiotsikko" placeholder="Please enter your topic here"
                                       required="Please enter your topic here"/>
                                <br/>
                                <input type="text" id="vitekstikentta" name="uusiviesti" placeholder="Please enter your message here"
                                       required="Please enter your message here"/>
                                <br/>
                                Olen vain ihminen: <input type="checkbox" name="rasti"
                                                          required="Please confirm that you are only a human"/>
                                <input type="hidden" name="viestiid" value="0"/>
                                <input type="hidden" name="alueid" value="${viesti0.alueid}"/>
                            </c:forEach>
                            <c:forEach var="hloid" items="${sessionScope.henkilotiedot}">
                                <input type="hidden" name="hloid" value="${hloid.hloid}"/>
                            </c:forEach>
                            <br/>
                            <button type="submit" id="bottom">Lähetä</button>
                        </fieldset>
                    </form>
                </c:when>
                <c:otherwise>
                    <h3><a href="index.jsp">Kirjaudu sisään</a> tai <a href="rekisteroityminen.jsp">rekisteröidy</a>
                        kirjoittaaksesi
                        viestejä.</h3>
                </c:otherwise>
            </c:choose>
        </td>
    </tr>
</table>
</div>

</body>
</html>