<%@page import="support.*, java.util.*" %>

<% String nextPage = "collect_session.jsp?next=address.jsp&"; %>

<html>
	<head>
	</head>
	<body>
		<form>
		<div class="discipline-list-container">
			<%
				support s = new support();   	
				String disciplinePath = config.getServletContext().getRealPath("/support/majors.txt");
				
				Vector disciplineVector = s.getMajors(disciplinePath);
				boolean isFirst = true;

				for (Enumeration e = disciplineVector.elements(); e.hasMoreElements();)
				{
					String discipline = (String) e.nextElement();
			%>
					<input type="radio" name="recidency" value="<%= discipline %>" <%= (isFirst)?"checked=\"yes\"":"" %> /><%= discipline %><br/>
			<%  
					isFirst = false;
				} 
			%>
		</div>
		<input type="submit" name="submit" value="submit"/>
		</form>
	</body>
</html>