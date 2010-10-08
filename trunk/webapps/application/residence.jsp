<%@page import="support.*, java.util.*" %>

<% String nextPage = "address.jsp"; %>

<html>
	<head>
	<%
		String citizenship =  request.getParameter("citizenship");
		session.setAttribute("citizenship", citizenship);
	%>
	</head>
	<body>
		<div class="info-container">
			First name: <%= session.getAttribute("first_name")%> <br/>
			Last name: <%= session.getAttribute("last_name")%> <br/>
			Middle name: <%= session.getAttribute("middle_name")%> <br/>
			Citizenship: <%= session.getAttribute("citizenship")%> <br/>
		</div>
		<br/>
		<div class="country-list-container">
			<%
				support s = new support();   	
				String countryPath = config.getServletContext().getRealPath("/support/countries.txt");
				
				Vector countryVector =  s.getCountries(countryPath);
				int counter = 0;
			%>
			<a href="<%= nextPage %>?residence=<%= session.getAttribute("citizenship") %>">Same with country of citizenship</a>
			<table>
			<%
				for (Enumeration e = countryVector.elements(); e.hasMoreElements();)
				{
					String country = (String) e.nextElement();
					if (counter % 3 == 0) out.println("<tr>");
			%>
					<td><a href="<%= nextPage %>?residence=<%= country %>"> <%= country %> </a></td> 
			<%  
					if (counter % 3 == 2) out.println("</tr>");
					counter ++;
				} 
			%>
			</table>
		</div>
	</body>
</html>