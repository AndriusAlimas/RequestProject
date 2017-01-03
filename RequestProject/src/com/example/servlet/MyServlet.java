package com.example.servlet;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class MyServlet extends HttpServlet {
  public void doGet(HttpServletRequest request,
		  HttpServletResponse response)throws ServletException,IOException{
	  // ServletRequest has method to get parameter (key=value) get always String
	  String parameter = request.getParameter("param");
	  // HttpServletRequest has method to get header(key=value) get always String
	  // but in this example we using parameter as argument, so parameter must be Header key:
      String header = request.getHeader(parameter);
      

  }
}
