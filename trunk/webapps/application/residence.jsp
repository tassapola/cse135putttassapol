<%@page import="support.*, java.util.*" %>

<% String nextPage = "collect_session.jsp?next=address.jsp&"; %>

<html>
	<head>
	<style>
		body {margin:auto; width:800px; font-size:10pt; font-family: helvetica,Arial,verdana,sans-serif;color:#000;}
		table {margin: 10px auto; }
		.header {font-size:200%; text-align:center; margin:10px 0; padding:10px 0; border-bottom:solid thin #000;}
		.node {border: solid thin #DDD; margin:10px;}
		.node .title {font-size:120%; font-weight:bold; margin:5px 20px; border-bottom:solid thin #DDD;}
		.node .info {text-align:left; margin:5px 70px;}
		.node .topic {font-weight:bold;}
		.field-container {font-size:10pt; text-align:center; margin: 5px;}
		.field-container .label{ text-align: right;}
		
	</style>
	</head>
	<body>
		<div class="header-container">	
			<div class="header">
				Graduate Admission System
			</div>
		</div>
		<div class="node">
			<div class="title">Country of Citizenship</div>
			<div class="info">
				<span class="topic">Country of Citizenship</span> <%= session.getAttribute("citizenship")%> 
			</div>
		</div>

		<div class="node">
			<div class="title">Please select your country of recidence:</div>
			<%
				support s = new support();   	
				String countryPath = config.getServletContext().getRealPath("/support/countries.txt");
				
				Vector countryVector =  s.getCountries(countryPath);
				int counter = 0;
			%>
			<table>
			<tr><td><a href="<%= nextPage %>residence=<%= session.getAttribute("citizenship") %>">Same with country of citizenship</a></td></tr>
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