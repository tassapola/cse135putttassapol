<%@page import="model.Constants"%>
<%@ page language="java" import="java.sql.*, java.util.*" %>
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
			String location = (String)session.getAttribute(Constants.SESS_UNI_LOCATION);
		%>
		<div class="node">
			<div class="title">Degree</div>
			<div class="info">
				<span class="topic">Location: </span><%= location %> <br/>
			</div>
		</div>
		<div class="node">
			<div class="title">Select University in <%= location %></div>
			<%
				LinkedList<String> universities =  (LinkedList<String>) request.getAttribute(Constants.LIST_UNIVERSITIES);
				int counter = 0;
			%>
			
			<table>
			<%
				String university = "";
				counter = 0;
				for (Iterator<String> it = universities.iterator(); it.hasNext();) 
				{
					university = it.next();
					if (counter % 3 == 0) out.println("<tr>");
			%>
					<td>
				  
					<html:link action="/mvc/application/provide_degree_university.do">
					  <html:param name="university">
					  	<%= university %>
					  </html:param>
					  <%= university %>
					</html:link>

					</td> 
			<%  
					if (counter % 3 == 2) out.println("</tr>");
					counter ++;
				} 
				if (counter % 3 != 0) out.println("</tr>");
			%>			
			</table>
			<html:form action="/mvc/application/provide_degree_university.do">
				University: <html:text property="university"/><br>
				<html:submit value="Submit"/>
				<html:reset />
			</html:form>
			
		</div>
	</body>
</html>