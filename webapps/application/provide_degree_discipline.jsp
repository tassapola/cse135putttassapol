<%@page import="support.*, java.util.*" %>

<% String nextPage = "collect_session.jsp?next=address.jsp&"; %>

<html>
	<head>
	</head>
	<body>
		<form method="GET" action="collect_session.jsp">
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
					<input type="radio" name="discipline" value="<%= discipline %>" <%= (isFirst)?"checked=\"yes\"":"" %> /><%= discipline %><br/>
			<%  
					isFirst = false;
				} 
			%>
			<input type="radio" name="discipline" value="other" />Other <input type="text" name="other_discipline"/><br/>
		</div>
		
		Degree awarded date or expected date: <input type="text" name="degree_month" size="2" maxlength="2"/> / 
											  <input type="text" name="degree_year" size="2" maxlength="4"/> <br/>
		GPA: <input type="text" name="degree_gpa" size="4"/> <br/>
		Title of Degree: <select name="degree_title">
							<option value="phd" selected="yes">PhD</option>
							<option value="ms">MS</option>
							<option value="bs">BS</option>
						 </select> <br/>
		Transcript: <input type="file" name="transcript_file" />
		<br/>
		<input type="hidden" name="next" value="more_degree.jsp"/>
		<input type="submit" name="submit" value="Submit"/>
		</form>
	</body>
</html>