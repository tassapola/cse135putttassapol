<%@ page language="java" import="java.sql.*,support.*, java.util.*" %>

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
			<div class="title">Applicant name</div>
			<div class="info">
				<span class="topic">First name: </span><%= session.getAttribute("first_name")%> <br/>
				<span class="topic">Last name: </span><%= session.getAttribute("last_name")%> <br/>
				<span class="topic">Middle name: </span><%= session.getAttribute("middle_name")%> <br/>
			</div>
			<div class="title">Citizenship</div>
			<div class="info">
				<span class="topic">Country of Citizenship: </span><%= session.getAttribute("citizenship")%> <br/>
				<span class="topic">Country of Residence: </span><%= session.getAttribute("residence")%> <br/>
			</div>
			<div class="title">Address</div>
			<div class="info">
				<span class="topic">Street Address: </span><%= session.getAttribute("street") %> <br/>
				<span class="topic">City: </span><%= session.getAttribute("city") %> <br/>
				<% 
				if (session.getAttribute("residence").equals("United States"))
				{
				%>
				<span class="topic">State: </span><%= session.getAttribute("state") %> <br/>
				<% } %>
				
				<span class="topic">Zip code: </span><%= session.getAttribute("zipcode") %> <br/>
				<% 
				if (!session.getAttribute("residence").equals("United States")) 
				{
				%>
				<span class="topic">Country code: </span><%= session.getAttribute("countrycode") %> <br/>
				<% } %>
				<span class="topic">Area code: </span><%= session.getAttribute("areacode") %> <br/>
				<span class="topic">Telephone number: </span><%= session.getAttribute("telephone") %> <br/>
				<% 
					if(!session.getAttribute("citizenship").equals("United States"))
					{
				%>
				<span class="topic">Residency: </span><%= session.getAttribute("residency") %> <br/>	
				<%  } %>
			</div>
			<%
					Vector degreeVector = (Vector)session.getAttribute("degree_vector");
					if (degreeVector != null)
					{
			%>
			<div class="title">Degree</div>
			<div class="info">
				<%
					
						for (Enumeration e = degreeVector.elements(); e.hasMoreElements();)
						{
							HashMap degree = (HashMap) e.nextElement();
				%>
							<span class="topic">Location: </span><%= degree.get("location") %> <br/>
							<span class="topic">University: </span><%= degree.get("university") %> <br/>
							<span class="topic">Discipline: </span><%= degree.get("discipline") %> <%= (degree.get("discipline").equals("other"))? "-" + degree.get("other_discipline"):"" %> <br/>
							<span class="topic">Degree Title: </span><%= degree.get("degree_title") %> <br/>
							<span class="topic">Degree Date: </span><%= degree.get("degree_month") %> / <%= degree.get("degree_year") %> <br/>
							<span class="topic">GPA: </span><%= degree.get("degree_gpa") %> <br/>
							<span class="topic">Transcript: </span><%= degree.get("transcript_file") %> <br/>
				<%
				
							if(e.hasMoreElements()) out.println("<hr/>");
						}
				%>
			</div>
			<% 	}%>
		</div>
		<div class="node">
			<div class="title">Choose University Location</div>

			<%
				Class.forName("org.postgresql.Driver");
				Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
				con.setAutoCommit(false);
				
				Statement stmt = con.createStatement();
				
				//Get all states
				//ResultSet states = stmt.executeQuery("SELECT DISTINCT location FROM universities WHERE location NOT IN (SELECT name FROM countries) ORDER BY location asc;");
				
				ResultSet states = stmt.executeQuery("SELECT DISTINCT location FROM universities WHERE universities.id < 1837 ORDER BY location asc;");
				
				int counter = 0;
			%>
				<div class="node">
					<div class="title">United State</div>
					<table>
					<%
						String state = "";
						counter = 0;
						while (states.next())
						{
							//Vector u = (Vector) e.nextElement();
							//Enumeration e2 = u.elements();
							state = states.getString("location");//(String) e2.nextElement();
							if (counter % 3 == 0) out.println("<tr>");
							%>
							<td><a href="collect_session.jsp?next=provide_degree_university.jsp&location=<%= state %>"> <%= state %> </a></td>
							<%
							if (counter % 3 == 2) out.println("</tr>");
							counter++;
						}
						if (counter % 3 != 0) out.println("</tr>");
						states.close();
					%>
					</table>
				</div>
				<div class="node">
					<div class="title">Other Countries</div>
					<table>
					<%
						ResultSet countries = stmt.executeQuery("SELECT  * FROM countries ORDER BY name asc;");
						counter = 0;
						while(countries.next())
						{
							String country = countries.getString("name");
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
						countries.close();
					%>
					</table>
				</div>
		</div>
	</body>
</html>