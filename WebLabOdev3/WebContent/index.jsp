<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="com.filter.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link href="dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="dist/css/signin.css" rel="stylesheet" type="text/css" />
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
					<li class="active"><a href="#">Yetkili Girişi</a></li>
				</ul>

			</div>
			<!--/.nav-collapse -->
		</div>


		<form class="form-signin" action="" method="post">
			<table>
				<tr>
					<td>Username</td>
					<td><input type="text" class="form-control" name="kuladi"
						required autofocus /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" class="form-control" name="sifre"
						required autofocus /></td>
				</tr>
				<tr>
					<td></td>
					<td><button class="btn btn-primary" type="submit">Login</button></td>
				</tr>



			</table>

		</form>
		<%
            String kulad = request.getParameter("kuladi");
            String sifre = request.getParameter("sifre");
            Connection conn = null;
            Statement st = null;
            ResultSet rs = null;
            
            if(request.getParameter("kuladi")==null || request.getParameter("sifre")==null)
         	   out.println("");
            else{ 
            try {
                
               
                	Class.forName("com.mysql.jdbc.Driver");
                	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "password");
                	st = conn.createStatement();
                	rs = st.executeQuery("Select Kuladi,Sifre,yetkiAd from tuser,tyetki where Kuladi='"+kulad+"' and Sifre='"+sifre+"' and yetki = yetkiID ;");
                
                	if(rs.next()){
                		LogFilter l = new LogFilter();
                		
                		session.setMaxInactiveInterval(20*20);
                		session.setAttribute("kulad",kulad);
                		session.setAttribute("yetki", rs.getString("yetkiAd"));
                		response.sendRedirect("./login-success.up"); 
                	}
                    else {
               %>
		<br>
		<p style="color:  #b92c28">Hatalı kullanıcı adı veya şifre girdiniz</p>
			<% 
                }
             }
            
            catch(Exception ex){
                out.println(ex);
            }
            }
            
            
            %>
		
	</div>

</body>
</html>
