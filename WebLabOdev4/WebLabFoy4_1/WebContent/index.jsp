<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql_rt" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
 pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Öğrenci Seçimi</title>
<link href="dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="dist/css/signin.css" rel="stylesheet" type="text/css" />
<script>
function showCustomer(str)
{
var xmlhttp;    
if (str=="")
  {
  document.getElementById("txtHint").innerHTML="";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
	
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","bilgi.jsp?id="+str,true);
xmlhttp.send();
}
</script>
</head>
<body style="background-color: #ffffff;">
<div class="container">
<div class="navbar navbar-default">

			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="#">AnaSayfa</a></li>
					<li><a href="#">Hakkımızda</a></li>



					<li><a href="#">Hizmetlerimiz</a></li>

					<li><a href="#">Kayıt</a></li>
					<li ><a href="#">Yetkili Girişi</a></li>
				</ul>

			</div>
</div>			

<form class="form-signin" action=""> 
<table class="table">
<sql:setDataSource var="datasource" 
     driver="com.mysql.jdbc.Driver" 
     url="jdbc:mysql://localhost/dbogrenci"
     user="root" password="12345"/>

<sql:query var="ogrenci" dataSource="${datasource}">
  SELECT ogrenciID,ad,soyad from tOgrenci
</sql:query>

<tr>

<td><select name="ogrenci" onchange="showCustomer(this.value)" class="form-control">

<option value="">Öğrenci Şeç</option>
<c:forEach items="${ogrenci.rows}" var="row">
<option value=<c:out value="${row.ogrenciID}" />><c:out value="${row.ad}" /> &nbsp;<c:out value="${row.soyad}" /></option>
</c:forEach> 
</select></td></tr>
</table>
</form>

<div id="txtHint"></div>
</div>
</body>
</html>