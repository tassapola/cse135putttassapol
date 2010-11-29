<%@ page language="java" import="java.sql.*,support.*, java.util.*" %>

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
			<div class="title">Applicant name</div>
			<div class="info">
				<span class="topic">First name: </span><%= session.getAttribute("first_name")%> <br/>
				<span class="topic">Last name: </span><%= session.getAttribute("last_name")%> <br/>
				<span class="topic">Middle name: </span><%= session.getAttribute("middle_name")%> <br/>
			</div>
			<div class="title">Country of Citizenship</div>
			<div class="info">
				<span class="topic">Country of Citizenship</span> <%= session.getAttribute("citizenship")%> 
			</div>
		</div>

		<div class="node">
			<div class="title">Please select your country of recidence:</div>
			<%
				Class.forName("org.postgresql.Driver");
				Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
				con.setAutoCommit(false);
				
				Statement stmt = con.createStatement();
				
				ResultSet countries = stmt.executeQuery("SELECT * FROM countries ORDER BY id asc;");
				int counter = 0;
			%>
			<table>
			<tr><td><a href="<%= nextPage %>residence=<%= session.getAttribute("citizenship") %>">Same with country of citizenship</a></td></tr>
			<%
				while(countries.next())
				{
					String country = countries.getString("name"); //(String) e.nextElement();
					if (counter % 3 == 0) out.println("<tr>");
			%>
					<td><a href="collect_session.jsp?next=address.jsp&residence=<%= country %>"> <%= country %> </a></td> 
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