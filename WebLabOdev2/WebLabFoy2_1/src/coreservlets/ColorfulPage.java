package coreservlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import beans.ColorBean;

public class ColorfulPage extends HttpServlet {
  @Override
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
    ColorBean colorBean = new ColorBean();
    colorBean.setForegroundColor(request.getParameter("foregroundColor"));
    colorBean.setBackgroundColor(request.getParameter("backgroundColor"));
    if (colorBean.getForegroundColor().equals
        (colorBean.getBackgroundColor())) {
      colorBean = new ColorBean();
    }
    request.setAttribute("colorBean", colorBean);
    String address = "/WEB-INF/results/ColorfulPage.jsp";
    RequestDispatcher dispatcher =
      request.getRequestDispatcher(address);
    dispatcher.forward(request, response);
  }
}
