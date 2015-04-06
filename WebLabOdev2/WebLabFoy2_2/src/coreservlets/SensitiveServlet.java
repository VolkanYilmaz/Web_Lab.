package coreservlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class SensitiveServlet extends HttpServlet {
  @Override
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String docType =
      "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " +
      "Transitional//EN\">\n";
    out.println
      (docType +
       "<HTML>\n" +
       "<HEAD><TITLE>Sensitive Information</TITLE></HEAD>\n" +
       "<BODY BGCOLOR=\"#FDF5E6\">\n" +
       "<H1 ALIGN=\"CENTER\">Sensitive Information</H1>\n" +
       "This page contains important and sensitive\n" +
       "company-proprietary information. Shred and eat\n" +
       "all copies.\n" +
       "</BODY></HTML>");
  }
}
