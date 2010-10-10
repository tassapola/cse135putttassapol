<%@page import="support.*, java.util.*" %>

<html>
	<head>
	</head>
	<body>
		<div class="info-container">
			First name: <%= session.getAttribute("first_name")%> <br/>
			Last name: <%= session.getAttribute("last_name")%> <br/>
			Middle name: <%= session.getAttribute("middle_name")%> <br/>
		</div>
		<br/>
		<div class="country-list-container">
			Please select your country of citizenship:
			<%
				support s = new support();   	
				String countryPath = config.getServletContext().getRealPath("/support/countries.txt");
				
				Vector countryVector =  s.getCountries(countryPath);
				int counter = 0;
			%>
			<table>
			<%
				for (Enumeration e = countryVector.elements(); e.hasMoreElements();)
				{
					String country = (String) e.nextElement();
					if (counter % 3 == 0) out.println("<tr>");
			%>
					<td><a href="collect_session.jsp?next=residence.jsp&citizenship=<%= country %>"> <%= country %> </a></td> 
			<%  
					if (counter % 3 == 2) out.println("</tr>");
					counter ++;
				} 
				if (counter % 3 != 0) out.println("</tr>");
			%>
			</table>
		</div>
	</body>
</html>