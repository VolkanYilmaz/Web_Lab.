<?xml version="1.0" encoding="UTF-8"?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql_rt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
</head>
<body>
<sql:setDataSource var="data" 
     driver="com.mysql.jdbc.Driver" 
     url="jdbc:mysql://localhost/dbogrenci"
     user="root" password="12345"/>
     
<sql:query var="ogrenci" dataSource="${data}">
  SELECT dersAd,tders.dersID from tders,togrenciders where togrenciders.ogrenciID = ${param["id"]} and togrenciders.dersId = tders.dersId    
</sql:query>
<center><table class="table table-striped table-bordered table-hover" style="width: 400px; height: 100px">
      <tr>
        <td>Dersin Kodu</td><td>Dersin Adi</td>
      </tr>
      <c:forEach items="${ogrenci.rows}" var="row"> 
      <tr>
        <td><c:out value="${row.dersID}" /></td>
        <td><c:out value="${row.dersAd}" /></td>
        
      </tr>
</c:forEach> 
    </table></center>

</body>
</html>
