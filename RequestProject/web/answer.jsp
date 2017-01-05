<%@ page import="java.io.*,java.util.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Jsp</title>
</head>
<body>
	<h1 align="center">Your Answer is:</h1>
	<p>
	<%
		// HttpServletRequest method getSession() Returns the current session associated with this
		// request, or if the request does not have a session, creates one.
		HttpSession http_session = request.getSession();
	
		// HttpServletRequest method getContextPath Returns the portion of the request URI that
		// indicates the context of the request. The context path always comes first in a request 
		// URI. The path starts with a "/" character but does not end with a "/" character.
		// For servlets in the default (root) context, this method returns "".
		String contextPath = request.getContextPath();
		
		// HttpServletrequest method getCookies Returns an array containing all of the Cookie objects
		// the client sent with this request. This method returns null if no cookies were sent.
		Cookie[] cookies = request.getCookies(); 
		
		String result = (String)request.getAttribute("full_answer");
		Integer localPort = (Integer)request.getAttribute("localPort");
		Integer remotePort = (Integer)request.getAttribute("remotePort");
		Integer serverPort = (Integer)request.getAttribute("serverPort");
		
		%>
</body>
</html>