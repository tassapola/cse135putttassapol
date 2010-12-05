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
		<div class="header-container">	
			<div class="header">
				Graduate Admission System
			</div>
		</div>
		<div class="node">
			<logic:notPresent name="reviewer">
				<div class="title">Applications</div>
			</logic:notPresent>
			<logic:present name="reviewer">
				<div class="title">Applications by <%= request.getAttribute("reviewer") %></div>
			</logic:present>
			<div class="info">
				<%
					ArrayList<String> s = (ArrayList<String>)request.getAttribute("specialization");
					ArrayList<Integer> c = (ArrayList<Integer>)request.getAttribute("count");
				%>
					<table>
					<tr>
						<th>Discipline</th>
						<th></th>
					</tr>
					<%
						for (int i = 0; i < s.size(); i++) {							
					%>
						<tr>
							<td><%= s.get(i) %></td>
							<td>
								<html:link action="/mvc/chair/viewspecialization">
									<html:param name="specialization"><%= s.get(i) %></html:param>
									<%= c.get(i) %>
								</html:link>
							</td> 
						</tr> 
					<%  
						} 
					%>
					</table>
			</div>
		</div>
	</body>
</html>