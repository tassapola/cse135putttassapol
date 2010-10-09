<%@page import="support.*, java.util.*" %>

<%
for (Enumeration attr = session.getAttributeNames(); attr.hasMoreElements();)
{
	String attrName = (String)attr.nextElement();
%>
	<%= attrName %>: <%= session.getAttribute(attrName)%> <br/>
<%
}
%>