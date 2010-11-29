<%@ page language="java" import="java.sql.*,support.*, java.util.*" %>

<html>
	<head>
	<style>
		body {margin:auto; width:800px; font-size:10pt; font-family: helvetica,Arial,verdana,sans-serif;color:#000;}
		table {margin: 10px auto; max-width:90%;}
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
		<%
			String location = (String)session.getAttribute("location");
		%>
		<div class="node">
			<div class="title">Degree</div>
			<div class="info">
				<span class="topic">Location: </span><%= location %> <br/>
			</div>
		</div>
		<div class="node">
			<div class="title">Select University in <%= location %></div>
			<%
				Class.forName("org.postgresql.Driver");
				Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
				con.setAutoCommit(false);
				
				PreparedStatement stmt = con.prepareStatement("SELECT name FROM universities WHERE universities.location = ?  ORDER BY name asc;");
				stmt.setString(1, location);
				
				//Get all states
				ResultSet universities = stmt.executeQuery();
				
				int counter = 0;
			%>
			
			<table>
			<%
				String university = "";
				counter = 0;
				while(universities.next())
				{
					university = universities.getString("name");
					if (counter % 3 == 0) out.println("<tr>");
			%>
					<td><a href="collect_session.jsp?next=provide_degree_discipline.jsp&university=<%= university %>"> <%= university %> </a></td> 
			<%  
					if (counter % 3 == 2) out.println("</tr>");
					counter ++;
				} 
				if (counter % 3 != 0) out.println("</tr>");
			%>			
			</table>
			<form method="get" action="collect_session.jsp">
				<div style="margin:10px 40px;">
					<span style="font-weight:bold; font-size:110%;"> Input your university name if you cannot find it in the list</span> <br/>
					<input type="text" name="university" value="">
					<input type="hidden" name="next" value="provide_degree_discipline.jsp">
					<input type="submit" name="submit" value="Submit">
					<input type="reset">
				</div>
			</form>
			
			
		</div>
	</body>
</html>