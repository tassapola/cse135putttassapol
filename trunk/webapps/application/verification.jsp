<%@page import="java.util.*" %>


<html>
	<head>
	<style>
		body {margin:auto; width:800px; font-size:10pt; font-family: helvetica,Arial,verdana,sans-serif;color:#000;}		
		table {margin: 10px auto; max-width:90%;}
		hr {color:#DDD;}
		.header {font-size:200%; text-align:center; margin:10px 0; padding:10px 0; border-bottom:solid thin #000;}
		.node {border: solid thin #DDD; margin:10px;}
		.node .title {font-size:120%; font-weight:bold; margin:5px 20px; border-bottom:solid thin #DDD;}
		.node .info {text-align:left; margin:5px 70px;}
		.node .topic {font-weight:bold;}
		.field-container {font-size:10pt; text-align:center; margin: 5px;}
		.field-container .label{ text-align: right; vertical-align: top;}
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
					if(session.getAttribute("citizenship").equals("United States"))
					{
				%>
				<span class="topic">Residency: </span><%= session.getAttribute("residency") %> <br/>	
				<%  } %>
			</div>
			<div class="title">Degree</div>
			<div class="info">
				<%
					Vector degreeVector = (Vector)session.getAttribute("degree_vector");
					
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
			<div class="title">Specialization</div>
			<div class="info">
				<span class="topic">Specialization: </span><%= session.getAttribute("specialization") %> <br/>
			</div>
			<div class="field-container">
				<form action="" method="GET">
					<input type="submit" name="submit" value="Submit Application"/> 
					<input type="submit" name="submit" value="Cancel"/> 
				</form>
			</div>
		</div>
	</body>
</html>