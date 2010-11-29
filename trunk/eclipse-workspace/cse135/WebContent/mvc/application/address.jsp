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
				<span class="topic">First name:</span> <%= a.getFirstName() %> <br/>
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
		</div>
		<div class="node">
			<div class="title">Address</div>
			<html:form action="/mvc/application/address.do">
				<table>
					<tr class="field-container"> 
						<td class="label">Street Address:</td>
						<td class="field"><html:text property="street"/></td>
					</tr>
					<tr class="field-container"> 
						<td class="label">City:</td>
						<td class="field"><html:text property="city"/></td>
					</tr>
					<% 
					if (a.getResidence().equals("United States"))
					{
					%>
					<tr class="field-container"> 
						<td class="label">State:</td>
						<td class="field"><html:text property="state"/></td>
					</tr>
					<% } %>
					<tr class="field-container"> 
						<td class="label">Zip code:</td>
						<td class="field"><html:text property="zipcode"/></td>
					</tr>
					<% 
					if (!a.getResidence().equals("United States"))
					{
					%>
					<tr class="field-container"> 
						<td class="label">Country code:</td>
						<td class="field"><html:text property="countrycode" maxlength="3" size="3"/>
						</td>
					</tr>
					<% } %>
					<tr class="field-container"> 
						<td class="label">Area code:</td>
						<td class="field"><html:text property="areacode" maxlength="3" size="3"/>
						</td>
					</tr>
					<tr class="field-container"> 
						<td class="label">Telephone number:</td>
						<td class="field"><html:text property="telephone"/></td>
					</tr>
				</table>
				<div class="field-container"> 
					<html:submit value="Submit"/>
					<html:reset />
				</div>
			</html:form>
		</div>
	</body>
</html>