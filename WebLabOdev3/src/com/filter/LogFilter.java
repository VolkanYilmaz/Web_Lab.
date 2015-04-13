package com.filter;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LogFilter implements Filter {
  protected FilterConfig config;
  private ServletContext context;
  private String filterName;
  
  
  @Override
  public void doFilter(ServletRequest request,
                       ServletResponse response,
                       FilterChain chain)
      throws ServletException, IOException {
    HttpServletRequest req = (HttpServletRequest)request;
    HttpSession session = req.getSession();
    
    FileWriter fw = new FileWriter("C:\\Users\\toshýba\\workspace\\WebLabFoy_3\\WebContent\\logger\\logger.log",true);
    BufferedWriter bw = new BufferedWriter(fw);
    SimpleDateFormat tarih =new SimpleDateFormat("dd/M/yyyy hh:mm:ss");
    
    if(session.getAttribute("kulad") == null){
    	bw.write("\n Giriþ Tarihi: " + tarih.format(new Date()) + ". \n" +
                "(Reported by " + filterName + ".)\n\n");
     }
    else {
    
    bw.write("Kullanýcý Adý:"+session.getAttribute("kulad")+"\n"+
            "Yetki:"+session.getAttribute("yetki")+
            "\n Giriþ Tarihi: " + tarih.format(new Date()) + ". \n" +
            "(Reported by " + filterName + ".)\n\n");
    }
    
    bw.close();
    chain.doFilter(request,response);
  }

  public void init(FilterConfig config)
      throws ServletException {
    this.config = config;
    context = config.getServletContext();
    filterName = config.getFilterName();
  }
  
  public void destroy() {}
  
}

