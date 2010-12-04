<%@ page language="java" import="java.sql.*, java.util.*, model.*" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

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
		<%
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		con.setAutoCommit(false);
		Statement stmt = con.createStatement();
		String id = request.getParameter("id");
		ResultSet app = stmt.executeQuery("select u.user_name \"user\" from applicant a, users u where a.user_id = " + id + " and u.id = a.user_id");
		Applicant a = null;
		if (app.next()) {
			//add app info
			a = new Applicant();
			a.load(con, app.getString("user"));
		}
		stmt.close();
		%>
		<div class="node">
			<div class="title">Applicant name</div>
			<div class="info">
				<span class="topic">First name: </span><%=a.getFirstName()%> <br/>
				<span class="topic">Last name: </span><%= a.getLastName()%> <br/>
				<span class="topic">Middle name: </span><%= a.getMiddleName()%> <br/>
			</div>
			<div class="title">Citizenship</div>
			<div class="info">
				<span class="topic">Country of Citizenship: </span><%= a.getCitizenship()%> <br/>
				<span class="topic">Country of Residence: </span><%= a.getResidence()%> <br/>
			</div>
			<div class="title">Address</div>
			<div class="info">
				<span class="topic">Street Address: </span><%= a.getStreet()%> <br/>
				<span class="topic">City: </span><%= a.getCity() %> <br/>
				<% 
				if (a.getResidence().equals("United States"))
				{
				%>
				<span class="topic">State: </span><%= a.getState() %> <br/>
				<% } %>
				
				<span class="topic">Zip code: </span><%= a.getZipcode() %> <br/>
				<% 
				if (!a.getResidence().equals("United States")) 
				{
				%>
				<span class="topic">Country code: </span><%= a.getCountrycode() %> <br/>
				<% } %>
				<span class="topic">Area code: </span><%= a.getAreacode() %> <br/>
				<span class="topic">Telephone number: </span><%= a.getTelephone() %> <br/>
				<% 
					if(!a.getCitizenship().equals("United States"))
					{
				%>
				<span class="topic">Residency: </span><%= a.getResidency() %> <br/>	
				<%  } %>
			</div>
			<div class="title">Degree</div>
			<div class="info">
				<%
					Vector degreeVector = a.getDegreeVector();
					
					for (Enumeration e = degreeVector.elements(); e.hasMoreElements();)
					{
						Degree d = (Degree) e.nextElement();
				%>
					<span class="topic">Location: </span><%= d.getLocation() %> <br/>
					<span class="topic">University: </span><%= d.getUniversity() %> <br/>
					<span class="topic">Discipline: </span><%= d.getDiscipline() %> <%= (d.getDiscipline().equals("other"))? "-" + d.getOtherDiscipline():"" %> <br/>
					<span class="topic">Degree Title: </span><%= d.getDegreeTitle() %> <br/>
					<span class="topic">Degree Date: </span><%= d.getDegreeMonth() %> / <%= d.getDegreeYear() %> <br/>
					<span class="topic">GPA: </span><%= d.getDegreeGpa() %> <br/>
					<span class="topic">Transcript: </span><%=  d.getTranscriptFile() %> <br/>
				<%
				
					if(e.hasMoreElements()) out.println("<hr/>");
					}
				%>
			</div>
		</div>
		<div class="title">Specialization</div>
			<div class="info">
				<span class="topic">Specialization: </span><%= a.getSpecialization() %> <br/>
			</div>
		
	</body>
</html>