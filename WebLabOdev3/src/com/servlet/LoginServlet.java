package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String bootStrap ="<link href=\"dist/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\" />";
		
		HttpSession session = request.getSession();
		if (session.getAttribute("kulad")!= null && session.getAttribute("kulad")!=null){
			out.println ("<Doctype html");
			out.println( "<html>");
			out.println("<head>");
			out.println( "<meta http-equiv=\"Content-Type \" content=\"text/html; charset=UTF-8\">");
			out.println("<title>Yetkili Sayfasý</title>");
			out.println(bootStrap);
			out.println("</head>");
			out.println("<body>");
			out.println("<div class=\"container\">");
			out.println("<div class=\"navbar navbar-default\">");
			out.println("<div class=\"navbar-collapse collapse\">");
			out.println("<ul class=\"nav navbar-nav\">");
			out.println("<li><a href=\"# \">AnaSayfa</a></li>");
			out.println("<li><a href=\"# \">Hakkýmýzda</a></li>");
			out.println("<li><a href=\"# \">Hizmetlerimiz</a></li>");
			out.println("<li><a href=\"# \">Yetkili Giriþi</a></li>");
			out.println("</ul>");
			out.println("</div>");
			out.println("</div>");
			out.println("<h2>Hoþ geldiniz</h2>");
			out.println("</div>");			
			
		}
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
		
		
	

}
