<%@ page language="java" import="java.sql.*, java.util.*, model.*" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

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
		<%
		 	Applicant a = (Applicant) session.getAttribute(Constants.ATTR_NAME_APPLICANT);
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
		<div class="node">
     		<%
     		LinkedList<String> specList =  (LinkedList<String>) request.getAttribute(Constants.LIST_SPECIALIZATIONS);
			%>
			<div class="title">Select your specialization</div>
			<html:form action="/mvc/application/specialization.do">
				<table>
					<tr class="field-container"> 
						<td class="label">Specialization: </td>
						<td class="field">
							<html:select property="specialization">
								<%
								  
								  for (Iterator<String> it = specList.iterator(); it.hasNext();) 
								  {
									  String item = it.next();
									  
								  %>
								  <html:option value="<%= item %>"><%= item %></html:option>
								<%
								  }
								
								%>
							</html:select>
						</td>
					</tr>
				</table>
				
				<div class="field-container">
					<html:submit value="submit"/>
					 
				</div>
			</html:form>
		</div>
	</body>
</html>