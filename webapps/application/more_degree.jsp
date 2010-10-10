<%@page import="support.*, java.util.*" %>

<html>
	<head>
	</head>
	<body>
		<%
		for (Enumeration attr = session.getAttributeNames(); attr.hasMoreElements();)
		{
			String attrName = (String)attr.nextElement();
		%>
			<%= attrName %>: <%= session.getAttribute(attrName)%> <br/>
		<%
		}
		%>
		<div class="form-container">
			<form action="merge_degree_info.jsp" method="GET">
				<div class="field-container"> 
					<input type="submit" name="submit" value="Submit Next Degree"/> 
					<input type="submit" name="submit" value="Done"/> 
				</div>
			</form>
		</div>
	</body>
</html>