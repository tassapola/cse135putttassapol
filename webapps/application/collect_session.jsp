<%@page import="support.*, java.util.*" %>

<%
	String nextPage = request.getParameter("next");
	for (Enumeration param = request.getParameterNames(); param.hasMoreElements();)
	{
		String paramName = (String)param.nextElement();
			
		if (paramName.equals("next") || paramName.equals("submit"))
			continue;
		
		String paramValue = (String)request.getParameter(paramName);
		session.setAttribute(paramName, paramValue);
	}
%>

<html>
	<head>
	<meta http-equiv="REFRESH" content="0;url=<%= nextPage %>"/>
	</head>
</html>
