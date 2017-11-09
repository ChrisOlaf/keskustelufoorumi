<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<html>
<head>
    <title>Foorumi - Viestiketju</title>
    <link rel="stylesheet" type="text/css" href="style/foorumi.css">
</head>
<body>
<nav>
    <a class="linkit" href="index.jsp">Takaisin etusivulle</a>
</nav>
<div id="banneri">
<h1> </h1>
</div>
<c:forEach var="viesti" items="${sessionScope.viestiLista}">
    <div>
    <table>
        <tr>
            <th>
                <h3> ${viesti.otsikko} </h3>
            </th>
        </tr>
        <tr>
            <td>
                <h6> ${viesti.nimimerkki} </h6>
            </td>
            <td>
                <h6> ${viesti.ajankohta} </h6>
            </td>
        </tr>
        <tr>
            <td>
                ${viesti.viesti}
            </td>
        </tr>
        <tr>
            <td>
                <form action="#bottom" method="get">
                    <button type="submit">Vastaa ketjuun</button>
                </form>
            </td>
            <td>
                <form action="PoistaServlet" method="post">
                    <input type="hidden" name="viestiid" value="${viesti.viestiID}"/>
                    <c:forEach var="viesti0" items="${sessionScope.viesti0}">
                        <input type="hidden" name="viesti0" value="${viesti0.viestiID}"/>
                    </c:forEach>
                    <button type="submit">Poista viesti</button>
                </form>
            </td>
        </tr>
    </table>
    </div>
</c:forEach>
<div>
<table>
    <tr>
        <td>
<c:choose>
    <c:when test="${sessionScope.knimi != null}">
            <form action="uusiviesti" method="post">
                <fieldset>
                    <legend>Kirjoita uusi viesti:</legend>
                    <c:forEach var="viesti0" items="${sessionScope.viesti0}">
                    <input type="text" id="viotsikko" name="uusiotsikko" placeholder="Please enter your topic here"
                           required="Please enter your topic here"/>
                    <br/>
                    <textarea id="vitekstikentta" name="uusiviesti" placeholder="Please enter your message here"
                              required="Please enter your message here"></textarea>
                    <br/>
                    Olen vain ihminen: <input type="checkbox" name="rasti"
                                              required="Please confirm that you are only a human"/>
                    <input type="hidden" name="viestiid" value="${viesti0.viestiID}"/>
                    <input type="hidden" name="alueid" value="${viesti0.alueID}"/>
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
        <h3><a href="index.jsp">Kirjaudu sisään</a> tai <a href="rekisteroityminen.jsp">rekisteröidy</a> kirjoittaaksesi
            viestejä.</h3>
    </c:otherwise>
</c:choose>
        </td>
    </tr>
</table>
</div>

</body>
</html>
