<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Öğrenci Ekleme</title>
</head>
<body>

<h2>Öğrenci Ekleme</h2>
<form:form method="POST" action="/HelloWeb1/addStudent">
   <table>
    <tr>
        <td><form:label path="ad">Ad</form:label></td>
        <td><form:input path="ad" /></td>
    </tr>
    <tr>
        <td><form:label path="yas">Yaş</form:label></td>
        <td><form:input path="yas" /></td>
    </tr>
    <tr>
        <td><form:label path="id">id</form:label></td>
        <td><form:input path="id" /></td>
    </tr>
    <tr>
        <td colspan="2">
            <input type="submit" value="Submit"/>
        </td>
    </tr>
</table>  
</form:form>
</body>
</html>