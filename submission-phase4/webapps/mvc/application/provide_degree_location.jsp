<%@ page language="java" import="java.sql.*,model.*, java.util.*" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

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
		<%
		 	Applicant a = (Applicant) session.getAttribute(Constants.ATTR_NAME_APPLICANT);
		%>
		<div class="node">
			<div class="title">Applicant name</div>
			<div class="info">
				<span class="topic">First name: </span><%= a.getFirstName() %> <br/>
				<span class="topic">Last name: </span><%= a.getLastName() %> <br/>
				<span class="topic">Middle name: </span><%= a.getMiddleName() %> <br/>
			</div>
			<div class="title">Country of Citizenship</div>
			<div class="info">
				<span class="topic">Country of Citizenship</span> <%= a.getCitizenship() %> 
			</div>
			<div class="title">Country of Residence</div>
			<div class="info">
				<span class="topic">Country of Residence</span> <%= a.getResidence() %> 
			</div>
			<div class="title">Address</div>
			<div class="info">
				<span class="topic">Street Address:</span> <%= a.getStreet() %> <br/>
				<span class="topic">City:</span> <%= a.getCity() %> <br/>
				<% 
					if (a.getIsUsResidence())
					{
				%>
				<span class="topic">State:</span> <%= a.getState() %> <br/>
				<%  
					} 
				%>
				<span class="topic">Zip code:</span> <%= a.getZipcode()%> <br/>

				<% 
					if (!a.getIsUsResidence()) 
					{
				%>
				<span class="topic">Country code:</span> <%= a.getCountrycode()%> <br/>
				<%
					} 
				%>
				<span class="topic">Area code:</span> <%= a.getAreacode()%> <br/>
				<span class="topic">Telephone number:</span> <%= a.getTelephone()%> <br/>
				<span class="topic">Residency: </span><%= a.getResidency() %> <br/>
			</div>
			
		</div>
			<%
					Vector degreeVector = a.getDegreeVector();
					if (degreeVector != null)
					{
			%>
			<div class="title">Degree</div>
			<div class="info">
				<%
					
						for (Enumeration e = degreeVector.elements(); e.hasMoreElements();)
						{
							Degree degree = (Degree) e.nextElement();
				%>
							<span class="topic">Location: </span><%= degree.getLocation() %> <br/>
							<span class="topic">University: </span><%= degree.getUniversity() %> <br/>
							<span class="topic">Discipline: </span><%= degree.getDiscipline().equals("other")? "-" + degree.getOtherDiscipline():"" %> <br/>
							<span class="topic">Degree Title: </span><%= degree.getDegreeTitle() %> <br/>
							<span class="topic">Degree Date: </span><%= degree.getDegreeMonth() %> / <%= degree.getDegreeYear() %> <br/>
							<span class="topic">GPA: </span><%= degree.getDegreeGpa() %> <br/>
							<span class="topic">Transcript: </span><%= degree.getTranscriptFile() %> <br/>
				<%
				
							if(e.hasMoreElements()) out.println("<hr/>");
						}
				%>
			</div>
			<% 		} 
			%>
		</div>
		<div class="node">
			<div class="title">Choose University Location</div>

			<%
				
				
				int counter = 0;
			%>
				<div class="node">
					<div class="title">United State</div>
					<table>
					<%
						LinkedList<String> states = (LinkedList<String>) request.getAttribute(Constants.LIST_UNIVERSITY_STATES);
				
						counter = 0;
						String state;
						for (Iterator<String> it = states.iterator(); it.hasNext();) {
								state = it.next();
								if (counter % 3 == 0) out.println("<tr>");
								%>
								<td>
								<html:link action="/mvc/application/provide_degree_location.do">
								  <html:param name="location">
								     <%= state %>
								  </html:param>
								<%= state %>
								</html:link>
								</td>
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
						LinkedList<String> countries = (LinkedList<String>) request.getAttribute(Constants.LIST_UNIVERSITY_COUNTRIES);
						
						counter = 0;
						String country;
						for (Iterator<String> it = countries.iterator(); it.hasNext();) {
								country = it.next();
								if (counter % 3 == 0) out.println("<tr>");
								%>
								<td>
								<html:link action="/mvc/application/provide_degree_location.do">
								  <html:param name="location">
								     <%= country %>
								  </html:param>
								<%= country %>
								</html:link>
								</td>
								<%
								if (counter % 3 == 2) out.println("</tr>");
								counter++;
							}
						if (counter % 3 != 0) out.println("</tr>");
					%>
					</table>
				</div>
				
		</div>
	</body>
</html>