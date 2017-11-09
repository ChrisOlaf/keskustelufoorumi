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
<h3>Tällä sivulla on yksittäinen viesti + vastaukset</h3>

<c:forEach var="viesti" items="${sessionScope.viestiLista}">
    <table>
        <tr>
            <td>
                Otsikko ${viesti.otsikko}
            </td>
        </tr>
        <tr>
            <td>
                Kirjoittaja ${viesti.nimimerkki}
            </td>
        </tr>
        <tr>
            <td>
                Aika ${viesti.ajankohta}
            </td>
        </tr>
        <tr>
            <td>
                Viesti ${viesti.viesti} ${viesti.vastausID} ${viesti.alueID}
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
                    <button type="submit">Poista viesti</button>
                </form>
            </td>
        </tr>
    </table>
</c:forEach>
<table>
    <tr>
        <td>

            <%--${viesti0.viestiID}--%>
            <%--${viesti0.alueID}--%>
            <form action="uusiviesti" method="post">
                <fieldset>
                    <legend>Kirjoita uusi viesti:</legend>
                    <c:forEach var="viesti0" items="${sessionScope.viesti0}">
                    <input type="text" name="uusiotsikko" placeholder="Please enter your topic here"
                           required="Please enter your topic here"/>
                    <br/>
                    <input type="text" name="uusiviesti" placeholder="Please enter your message here"
                           required="Please enter your message here"/>
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
        </td>
    </tr>
</table>

</body>
</html>
