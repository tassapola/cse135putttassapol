<%@page import="
    org.apache.commons.fileupload.*, 
    org.apache.commons.fileupload.disk.*,
	org.apache.commons.fileupload.servlet.*, 
	java.util.*,
	java.io.*,
	java.sql.*
" %>
<%@ page language="java" import="java.sql.*,model.*, java.util.*" %>
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
		<html:errors/>
		<%
			String location = (String) session.getAttribute(Constants.SESS_UNI_LOCATION);
			String university = (String) session.getAttribute(Constants.SESS_UNIVERSITY);
		%>
		<div class="node">
			<div class="title">Degree</div>
			<div class="info">
				<span class="topic">Location: </span><%= location %> <br/>
				<span class="topic">University: </span><%=university%> <br/>
			</div>
		</div>
		
		<html:form action="/mvc/application/provide_degree_discipline">
		<div class="node">
			<div class="title">Enter degree information</div>
			<table>
				<tr class="field-container">
					<td class="label">Discipline: </td>
					<td class="field">
						<%
							LinkedList<String> disciplines =  (LinkedList<String>) request.getAttribute(Constants.LIST_DISCIPLINES);
							int counter = 0;
							
							boolean isFirst = true;

							for (Iterator<String> it = disciplines.iterator(); it.hasNext();) 
							{
								String discipline = it.next();
						%>
								<html:radio property="discipline" value="<%= discipline %>"/>
								<%= discipline %><br/>
						<%  
								isFirst = false;
							} 
						%>
						<html:radio property="discipline" value="other"/>Other
						<html:text property="otherDiscipline"/>
						<br/>
					</td>
				</tr>
				<tr class="field-container">
					<td class="label">Graduation date (MM/YYYY): </td>
					<td class="field">
						<html:text property="degreeMonth" size="2" maxlength="2"/> 
						<html:text property="degreeYear" size="2" maxlength="4"/> 
					</td>
				</tr>
				<tr class="field-container">
					<td class="label">GPA:</td>
					<td class="field">
					<html:text property="degreeGpa" size="4"/>
					</td>
				</tr>
				<tr class="field-container">
					<td class="label">Title of Degree:</td>
					<td class="field">
						<html:select property="degreeTitle">
							<html:option value="PhD">PhD</html:option>
							<html:option value="MS">MS</html:option>
							<html:option value="BS">BS</html:option>
						</html:select>
					</td>
				</tr>
				<tr class="field-container">
					<td class="label">Transcript:</td>
					<td class="field">
					<html:file property="transcriptFile"/>
					</td>
				</tr>
			</table>

			<div class="field-container"> 
				<html:submit value="Submit"/>
			</div>
		</div>
		</html:form>
	</body>
</html>