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
			<div class="title">Address</div>
			<div class="info">
				<span class="topic">Street Address:</span> <%= session.getAttribute("street")%> <br/>
				<span class="topic">City:</span> <%= session.getAttribute("city")%> <br/>
				<% 
					if (session.getAttribute("residence").equals("United States"))
					{
				%>
				<span class="topic">State:</span> <%= session.getAttribute("state")%> <br/>
				<%  
					} 
				%>

				<span class="topic">Zip code:</span> <%= session.getAttribute("zipcode")%> <br/>

				<% 
					if (!session.getAttribute("residence").equals("United States")) 
					{
				%>
				<span class="topic">Country code:</span> <%= session.getAttribute("countrycode")%> <br/>
				<%
					} 
				%>
				<span class="topic">Area code:</span> <%= session.getAttribute("areacode")%> <br/>
				<span class="topic">Telephone number:</span> <%= session.getAttribute("telephone")%> <br/>
			</div>
		</div>
		<br/>
		<div class="node">
			<div class="title">Residency:</div>
			<form action="collect_session.jsp" method="GET">
				<table>
				<tr class="field-container"> 
					<td><input type="radio" name="residency" value="US Permanent Resident" checked="yes" /></td>
					<td class="field">US Permanent Resident </td>
				</tr>
				<tr class="field-container"> 
					<td><input type="radio" name="residency" value="Non-Resident"/></td>
					<td class="field">Non-Resident </td>
				</tr>
				</table>
				<input type="hidden" name="next" value="provide_degree_location.jsp"/>
				<div class="field-container"> 
					<input type="submit" name="submit" value="submit"/> 
				</div>
			</form>
		</div>
	</body>
</html>