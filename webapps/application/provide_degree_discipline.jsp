<%@page import="support.*, java.util.*" %>

<% String nextPage = "collect_session.jsp?next=address.jsp&"; %>

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
		<div class="node">
			<div class="title">Degree</div>
			<div class="info">
				<span class="topic">Location: </span><%= session.getAttribute("location") %> <br/>
				<span class="topic">University: </span><%=session.getAttribute("university")%> <br/>
			</div>
		</div>
		<form method="GET" action="collect_session.jsp">
		<div class="node">
			<div class="title">Enter degree information</div>
			<table>
				<tr class="field-container">
					<td class="label">Discipline: </td>
					<td class="field">
						<%
							support s = new support();   	
							String disciplinePath = config.getServletContext().getRealPath("/support/majors.txt");
							
							Vector disciplineVector = s.getMajors(disciplinePath);
							boolean isFirst = true;

							for (Enumeration e = disciplineVector.elements(); e.hasMoreElements();)
							{
								String discipline = (String) e.nextElement();
						%>
								<input type="radio" name="discipline" value="<%= discipline %>" <%= (isFirst)?"checked=\"yes\"":"" %> /><%= discipline %><br/>
						<%  
								isFirst = false;
							} 
						%>
						<input type="radio" name="discipline" value="other" />Other <input type="text" name="other_discipline"/><br/>
					</td>
				</tr>
				<tr class="field-container">
					<td class="label">Graduation date (MM/YYYY): </td>
					<td class="field">
						<input type="text" name="degree_month" size="2" maxlength="2"/> / 
						<input type="text" name="degree_year" size="2" maxlength="4"/>
					</td>
				</tr>
				<tr class="field-container">
					<td class="label">GPA:</td>
					<td class="field"><input type="text" name="degree_gpa" size="4"/></td>
				</tr>
				<tr class="field-container">
					<td class="label">Title of Degree:</td>
					<td class="field">
						<select name="degree_title">
							<option value="PhD" selected="yes">PhD</option>
							<option value="MS">MS</option>
							<option value="BS">BS</option>
						 </select> 
					</td>
				</tr>
				<tr class="field-container">
					<td class="label">Transcript:</td>
					<td class="field"><input type="file" name="transcript_file" /></td>
				</tr>
			</table>
			<input type="hidden" name="next" value="more_degree.jsp"/>
			<div class="field-container"> 
				<input type="submit" name="submit" value="submit"/> 
			</div>
		</div>
		</form>
	</body>
</html>