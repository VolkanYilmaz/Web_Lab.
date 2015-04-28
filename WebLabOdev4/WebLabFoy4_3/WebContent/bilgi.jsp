<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql_rt" %>
<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>
<sql:setDataSource var="data" 
     driver="com.mysql.jdbc.Driver" 
     url="jdbc:mysql://localhost/dbogrenci"
     user="root" password="12345"/>
<sql:query var="ogrenci" dataSource="${data}">
  SELECT dersAd,tders.dersID from tders,togrenciders where ogrenciID = ${param["id"]} and togrenciders.dersID = tders.dersID    
</sql:query>     

{ headings: ["Ders Kod", "Ders Ad"],
  liste: [
  <c:forEach  items="${ogrenci.rows}" var="row" varStatus = "status">
  
   ["${row.dersID}" , "${row.dersAd}"]
   <c:if test="${!status.last}">,</c:if>
   
 </c:forEach>
  
  ]
 }


