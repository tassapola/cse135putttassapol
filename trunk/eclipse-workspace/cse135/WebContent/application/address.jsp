<%@page import="support.*, java.util.*" %>

<% String nextPage = "collect_session.jsp"; %>

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
			<div class="title">Country of Citizenship</div>
			<div class="info">
				<span class="topic">Country of Citizenship</span> <%= session.getAttribute("citizenship")%> 
			</div>
			<div class="title">Country of Residence</div>
			<div class="info">
				<span class="topic">Country of Residence</span> <%= session.getAttribute("residence")%> 
			</div>
		</div>
		<div class="node">
			<div class="title">Address</div>
			<form action="collect_session.jsp" method="GET">
				<table>
					<tr class="field-container"> 
						<td class="label">Street Address:</td>
						<td class="field"><input type="text" name="street"/></td>
					</tr>
					<tr class="field-container"> 
						<td class="label">City:</td>
						<td class="field"><input type="text" name="city"/></td>
					</tr>
					<% 
					if (session.getAttribute("residence").equals("United States"))
					{
					%>
					<tr class="field-container"> 
						<td class="label">State:</td>
						<td class="field"><input type="text" name="state"/></td>
					</tr>
					<% } %>
					<tr class="field-container"> 
						<td class="label">Zip code:</td>
						<td class="field"><input type="text" name="zipcode"/></td>
					</tr>
					<% 
					if (!session.getAttribute("residence").equals("United States"))
					{
					%>
					<tr class="field-container"> 
						<td class="label">Country code:</td>
						<td class="field"><input type="text" name="countrycode" maxlength="3" size="3"/> </td>
					</tr>
					<% } %>
					<tr class="field-container"> 
						<td class="label">Area code:</td>
						<td class="field"><input type="text" name="areacode" maxlength="3" size="3"/></td>
					</tr>
					<tr class="field-container"> 
						<td class="label">Telephone number:</td>
						<td class="field"><input type="text" name="telephone"/></td>
					</tr>
				</table>
				<input type="hidden" name="next" value="<%= (session.getAttribute("citizenship").equals("United States"))?"provide_degree_location.jsp":"recidency.jsp" %>"/>
				<div class="field-container"> 
					<input type="submit" name="submit" value="submit"/> 
				</div>
			</form>
		</div>
	</body>
</html>