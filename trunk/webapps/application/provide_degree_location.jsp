<%@page import="support.*, java.util.*" %>

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
		.field-container .field{ text-align: left;}
		
	</style>
	</head>
	<body>
		<div class="header-container">	
			<div class="header">
				Graduate Admission System
			</div>
		</div>
		<div class="node">
			<div class="title">Choose University Location</div>

			<%
				support s = new support();   	
				String countryPath = config.getServletContext().getRealPath("/support/countries.txt");
				String universitiesPath = config.getServletContext().getRealPath("/support/universities.txt");
				
				Vector countryVector =  s.getCountries(countryPath);
				Vector universitiesVector =  s.getUniversities(universitiesPath);
				int counter = 0;
			%>
				<div class="node">
					<div class="title">United State</div>
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
				</div>
				<div class="node">
					<div class="title">Other Countries</div>
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
		</div>
	</body>
</html>