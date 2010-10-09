<%@page import="support.*, java.util.*" %>

<html>
	<head>
	</head>
	<body>
	<%
		String location =  request.getParameter("location");
	%>
		<div class="country-list-container">
			<%
				support s = new support();   	
				String universitiesPath = config.getServletContext().getRealPath("/support/universities.txt");
				
				Vector universitiesVector =  s.getUniversities(universitiesPath);
				int counter = 0;
			%>
			
			<%
				Vector universitiesToShowVector = null;
				for (Enumeration e = universitiesVector.elements(); e.hasMoreElements();)
				{
					Vector u = (Vector) e.nextElement();
					Enumeration e2 = u.elements();
					String stateOrCountry = (String) e2.nextElement();
					if (stateOrCountry.equals(location)) {
						universitiesToShowVector = (Vector) e2.nextElement();
						break;
					}
				}
			%>
			
			<table>
			<%
				String university = "";
				counter = 0;
				if (universitiesToShowVector != null) {
					for (Enumeration e = universitiesToShowVector.elements(); e.hasMoreElements(); )
					{
						university = (String) e.nextElement();
						if (counter % 3 == 0) out.println("<tr>");
			%>
						<td><a href="provide_degree_discipline.jsp?university=<%= university %>"> <%= university %> </a></td> 
			<%  
						if (counter % 3 == 2) out.println("</tr>");
						counter ++;
					} 
					if (counter % 3 != 0) out.println("</tr>");
				}
			%>
			</table>
			
			<p>
			Input your university name if you cannot find it in the list<br>
			<form method="get" action="provide_degree_discipline.jsp">
				<input type="text" name="university" value="">
				<input type="submit" name="submit" value="Submit">
				<input type="reset">
			</form>
			
		</div>
	</body>
</html>