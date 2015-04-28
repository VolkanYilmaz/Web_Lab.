

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql_rt" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%String s = request.getParameter("id"); %>
<sql:setDataSource var="datasource" 
     driver="com.mysql.jdbc.Driver" 
     url="jdbc:mysql://localhost/dbogrenci"
     user="root" password="12345"/>


<sql:query var="ogrenci" dataSource="${datasource}">
  SELECT dersAd,tders.dersID from tders,togrenciders where togrenciders.ogrenciID = <%=s %> and tders.dersID = togrenciders.dersID 
</sql:query>
<html>
  <head>
    <title>A First JSP Database</title>
  </head>
  <body>
    <center><table class="table table-striped table-bordered table-hover" style="width: 400px; height: 100px">
      <tr>
        <td>Dersin Kodu</td><td>Dersin Adı</td>
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
