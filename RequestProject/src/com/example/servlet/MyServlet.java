package com.example.servlet;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import com.example.model.MyModel;;

public class MyServlet extends HttpServlet {
  public void doGet(HttpServletRequest request,
		  HttpServletResponse response)throws ServletException,IOException{
	  // ServletRequest has method to get parameter (key=value) get always String
	  String parameter = request.getParameter("param");
	  // HttpServletRequest has method to get header(key=value) get always String
	  // but in this example we using parameter as argument, so parameter must be Header key:
      String header = request.getHeader(parameter);
      
      // create model object, and call non-brain method which showing that model class
      // is all business logic 
      MyModel myModel = new MyModel();
      String full_answer = myModel.produceFullAnswer(header);
      // ServletRequest has method getLocalPort() 
      int localPort = request.getLocalPort();
      int n2 = request.getRemotePort();
      int n3 = request.getServerPort();
      int n4 = request.getContentLength();
      // ServletRequest has method setAttribute(String, Object) which save attribute in request
      // scope, later you can get this attribute back using String key, but careful you will
      // always get Object! :
      request.setAttribute("full_answer", full_answer);
  }
}
