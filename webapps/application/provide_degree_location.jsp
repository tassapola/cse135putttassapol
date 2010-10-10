<%@page import="support.*, java.util.*" %>

<html>
	<head>
	</head>
	<body>
		<div class="country-list-container">
			<%
				support s = new support();   	
				String countryPath = config.getServletContext().getRealPath("/support/countries.txt");
				String universitiesPath = config.getServletContext().getRealPath("/support/universities.txt");
				
				Vector countryVector =  s.getCountries(countryPath);
				Vector universitiesVector =  s.getUniversities(universitiesPath);
				int counter = 0;
			%>
			
			<h1>State List</h1>
			<table>
			<%
				String state = "";
				Enumeration e = universitiesVector.elements();
				counter = 0;
				while (!state.equals("Wyoming"))
				{
					Vector u = (Vector) e.nextElement();
					Enumeration e2 = u.elements();
					state = (String) e2.nextElement();
					if (counter % 3 == 0) out.println("<tr>");
					%>
					<td><a href="collect_session.jsp?next=provide_degree_university.jsp&location=<%= state %>"> <%= state %> </a></td>
					<%
					if (counter % 3 == 2) out.println("</tr>");
					counter++;
				}
				if (counter % 3 != 0) out.println("</tr>");
			%>
			</table>
			
			<h1>Country List</h1>
			<table>
			<%
				for (e = countryVector.elements(); e.hasMoreElements();)
				{
					String country = (String) e.nextElement();
					if (!country.equals("United States")) {
						if (counter % 3 == 0) out.println("<tr>");
			%>
						<td><a href="collect_session.jsp?next=provide_degree_university.jsp&location=<%= country %>"> <%= country %> </a></td> 
			<%  
						if (counter % 3 == 2) out.println("</tr>");
						counter ++;
					}
				} 
				if (counter % 3 != 0) out.println("</tr>");
				
			%>
			</table>
			
			
		</div>
	</body>
</html>