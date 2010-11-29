<%@ page language="java" import="java.sql.*, java.util.*, model.*" %>
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
			</div>
		</div>
		<br/>
		<div class="node">
			<div class="title">Residency:</div>
			<html:form action="/mvc/application/residency.do">
				<table>
				<tr class="field-container"> 
					<td>
					<html:radio name="residency" value="US Permanent Resident"/>
					<input type="radio" name="residency" value="US Permanent Resident" checked="yes" />
					</td>
					<td class="field">US Permanent Resident </td>
				</tr>
				<tr class="field-container"> 
					<td>
					<html:radio name="residency" value="Non-Resident"/>
					<input type="radio" name="residency" value="Non-Resident"/></td>
					<td class="field">Non-Resident </td>
				</tr>
				</table>
				<input type="hidden" name="next" value="provide_degree_location.jsp"/>
				<div class="field-container"> 
					<input type="submit" name="submit" value="submit"/> 
				</div>
			</html:form>
		</div>
	</body>
</html>