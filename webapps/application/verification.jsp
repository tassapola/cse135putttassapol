<%@page import="java.util.*" %>

<html>
	<head>
	</head>
	<body>
		<div class="info-container">
			First name: <%= session.getAttribute("first_name")%> <br/>
			Last name: <%= session.getAttribute("last_name")%> <br/>
			Middle name: <%= session.getAttribute("middle_name")%> <br/>
			<hr/>
			Country of Citizenship: <%= session.getAttribute("citizenship")%> <br/>
			Country of Residence: <%= session.getAttribute("residence")%> <br/>
			<hr/>
			Street Address: <%= session.getAttribute("street") %> <br/>
			City:<%= session.getAttribute("city") %> <br/>
			<% 
			if (session.getAttribute("residence").equals("United States"))
			{
			%>
			State:<%= session.getAttribute("state") %> <br/>
			<% } %>
			
			Zip code: <%= session.getAttribute("zipcode") %> <br/>
			<% 
			if (!session.getAttribute("residence").equals("United States")) 
			{
			%>
			Country code:<%= session.getAttribute("countrycode") %> <br/>
			<% } %>
			Area code: <%= session.getAttribute("areacode") %> <br/>
			Telephone number: <%= session.getAttribute("telephone") %> <br/>
			<% 
				if(session.getAttribute("citizenship").equals("United States"))
				{
			%>
			Residency: <%= session.getAttribute("residency") %> <br/>	
			<%  } %>
			<hr/>
			<%
				Vector degreeVector = (Vector)session.getAttribute("degree_vector");
				
				for (Enumeration e = degreeVector.elements(); e.hasMoreElements();)
				{
					HashMap degree = (HashMap) e.nextElement();
			%>
				Location: <%= degree.get("location") %> <br/>
				University: <%= degree.get("university") %> <br/>
				Discipline: <%= degree.get("discipline") %> <%= ":" + ((degree.get("discipline").equals("other"))?degree.get("other_discipline"):"") %> <br/>
				Degree Title: <%= degree.get("degree_title") %> <br/>
				Degree Date: <%= degree.get("degree_month") %> / <%= degree.get("degree_year") %> <br/>
				GPA:  <%= degree.get("degree_gpa") %> <br/>
				Transcript: <%= degree.get("transcript_file") %> <br/>
				<hr/>
			<%
				}
			%>
			Specialization: <%= session.getAttribute("specialization") %> <br/>
		</div>
		<br/>
		<div class="form-container">
			<form action="" method="GET">
				<input type="submit" name="submit" value="Submit Application"/> 
				<input type="submit" name="submit" value="Cancel"/> 
			</form>
		</div>
	</body>
</html>