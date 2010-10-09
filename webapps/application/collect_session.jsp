<%@page import="support.*, java.util.*" %>

<html>
	<head>
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
	<meta http-equiv="REFRESH" content="0;url=<%= nextPage %>"/>
	</head>
</html>
