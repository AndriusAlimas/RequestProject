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

			String result = (String) request.getAttribute("full_answer");
			Integer localPort = (Integer) request.getAttribute("localPort");
			Integer remotePort = (Integer) request.getAttribute("remotePort");
			Integer serverPort = (Integer) request.getAttribute("serverPort");
			Integer contentLength = (Integer) request.getAttribute("contentLength");
			InputStream input = (InputStream) request.getAttribute("input");

			// ServletRequest method getParameterNames() Returns an Enumeration of String objects containing
			// the names of the parameters contained in this request. If the request has no parameters, the
			// method returns an empty Enumeration.
			Enumeration en = request.getParameterNames();
			List<String> list = new ArrayList<String>();

			// simply read all elements store parameter value and key both
			// as well include getParameter method from ServletRequest interface
			// and all this information store in the list
			while (en.hasMoreElements()) {
				Object objOri = en.nextElement();
				String param = (String) objOri;
				String value = request.getParameter(param);
				String show = "Parameter Name is '" + param + "' and Parameter Value is '" + value + "'";
				list.add(show);
			}
		%>
		<%=result%>
		<br>
		<br>
	<h3 align="center">Your localPort is :</h3>
	<%=localPort%>
	<br>
	<br>
	<h3 align="center">Your remotePort is :</h3>
	<%=remotePort%>
	<br>
	<br>
	<h3 align="center">Your serverPort is :</h3>
	<%=serverPort%>
	<p>
	<h4>
		Your contentLength is :
		<%=contentLength%></b>
	</h4>
	Your input:
	<h4><%=input%></h4>
	<br>
	<br>
</body>
</html>