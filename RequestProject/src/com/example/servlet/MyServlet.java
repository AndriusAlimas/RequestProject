package com.example.servlet;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import com.example.model.MyModel;;

public class MyServlet extends HttpServlet {
  public void doGet(HttpServletRequest request,
		  HttpServletResponse response)throws ServletException,IOException{
	  // ServletRequest  method to get parameter (key=value) get always String
	  String parameter = request.getParameter("param");
	  // HttpServletRequest  method to get header(key=value) get always String
	  // but in this example we using parameter as argument, so parameter must be Header key:
      String header = request.getHeader(parameter);
      
      // create model object, and call non-brain method which showing that model class
      // is all business logic 
      MyModel myModel = new MyModel();
      String full_answer = myModel.produceFullAnswer(header);
      // ServletRequest  method getLocalPort() Returns the Internet Protocol (IP)
      // port number of the interface on which the request was received.
      int localPort = request.getLocalPort();
      
      // ServletRequest method getRemotePort() Returns the Internet Protocol (IP) source 
      // port of the client or last proxy that sent the request
      int remotePort = request.getRemotePort();
      
      // ServletRequest method getServerPort()  Returns the port number to which the request was sent.
      int serverPort = request.getServerPort();
      
      // ServletRequest method getContentLength() Returns the length, in bytes, of the request
      // body and made available by the input stream, or -1 if the length is not known.
      // For HTTP servlets, same as the value of the CGI variable CONTENT_LENGTH.
      int contentLength = request.getContentLength();
      
      // ServletRequest method getInputStream() Retrieves the body of the request as binary data using
      //a ServletInputStream. Either this method or getReader() may be called to read the body, not both.
      
      ServletInputStream servletInputStream = request.getInputStream();
      // ServletRequest has method setAttribute(String, Object) which save attribute in request
      // scope, later you can get this attribute back using String key, but careful you will
      // always get Object! :
      request.setAttribute("full_answer", full_answer);
      request.setAttribute("remotePort", remotePort);
      request.setAttribute("localPort", localPort);
      request.setAttribute("serverPort", serverPort);
      request.setAttribute("contentLength", contentLength);
      request.setAttribute("input", servletInputStream);
      
      // ServletRequest interface has method getRquestDispatcher() to get this object
   	  // then you can use method which can forward request and response to another
   	  // servlet(jsp) to print view
      RequestDispatcher requestDispatcher = request.getRequestDispatcher("answer.jsp");
      requestDispatcher.forward(request, response);
  }
}
