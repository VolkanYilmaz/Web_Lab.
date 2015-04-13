package com.filter;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import java.util.*;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.net.InetAddress;

public class ReportFilter implements Filter {
  
  private ServletContext context;
    
  public void doFilter(ServletRequest request,
                       ServletResponse response,
                       FilterChain chain)
      throws ServletException, IOException {
    HttpServletRequest req = (HttpServletRequest)request;
    
    
    FileWriter fw = new FileWriter("C:/Users/toshýba/workspace/WebLabFoy_3/WebContent/report/report.log",true);
    BufferedWriter bw = new BufferedWriter(fw);
    String s;
    s = req.getHeader("user-agent");
    bw.write( "Host: "+req.getServerName()+"\n"+
    		"Browser: "+s+"\n"+
            "ip adresi: "+IpAddress(req)+
            "\n"+req.getRequestURL() +
            "\n on " + new Date() + ".\n\n");
   
    bw.close();
   
    
    chain.doFilter(request,response);
  }

  public void init(FilterConfig config)
      throws ServletException {
  }
  
  public void destroy() {}
  
  
 
  
  public String IpAddress(HttpServletRequest request)
  {
	  String ip = request.getHeader("X-Forwarded-For");
	  if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
		  ip = request.getHeader("Proxy-Client-Ip");
	  }
	  
	  if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
		  ip = request.getHeader("WL-Proxy-Client-Ip");
	  }
	  
	  if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
		  ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	  }
	  
	  if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
		  ip = request.getHeader("HTTP_X_FORWARDED");
	  }
	  
	  if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
		  ip = request.getHeader("HTTP_X_CLUSTER_CLIENT_IP");
	  }
	  
	  if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
		  ip = request.getHeader("HTTP_CLIENT_IP");
	  }
	  
	  if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
		  ip = request.getHeader("HTTP_FORWARDED_FOR");
	  }
	  
	  if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
		  ip = request.getHeader("HTTP_FORWARDED");
	  }
	  
	  if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
		  ip = request.getHeader("HTTP_VIA");
	  }
	  
	  if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
		  ip = request.getHeader("REMOTE_ADDR");
	  }
	  
	  if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
		  ip = request.getRemoteAddr();
	  }
	  	  
	  return ip;
		  
  }
  
  
}

