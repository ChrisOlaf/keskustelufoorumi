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
                Viesti ${viesti.viesti}
            </td>
        </tr>
    </table>
</c:forEach>


</body>
</html>
