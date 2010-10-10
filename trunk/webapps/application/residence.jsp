<%@page import="support.*, java.util.*" %>

<% String nextPage = "collect_session.jsp?next=address.jsp&"; %>

<html>
	<head>
	</head>
	<body>
		<div class="info-container">
			Country of Citizenship: <%= session.getAttribute("citizenship")%> <br/>
		</div>
		<br/>
		<div class="country-list-container">
			Please select your country of recidence:<br/>
			<%
				support s = new support();   	
				String countryPath = config.getServletContext().getRealPath("/support/countries.txt");
				
				Vector countryVector =  s.getCountries(countryPath);
				int counter = 0;
			%>
			<a href="<%= nextPage %>residence=<%= session.getAttribute("citizenship") %>">Same with country of citizenship</a>
			<table>
			<%
				for (Enumeration e = countryVector.elements(); e.hasMoreElements();)
				{
					String country = (String) e.nextElement();
					if (counter % 3 == 0) out.println("<tr>");
			%>
					<td><a href="<%= nextPage %>residence=<%= country %>"> <%= country %> </a></td> 
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