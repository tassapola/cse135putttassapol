<%@page import="support.*, java.util.*" %>
s
<%
	for (Enumeration attr = session.getAttributeNames(); attr.hasMoreElements();)
	{
		String attrName = (String)attr.nextElement();
%>
		<%= attrName %>: <%= session.getAttribute(attrName)%> <br/>
<%
	}
%>