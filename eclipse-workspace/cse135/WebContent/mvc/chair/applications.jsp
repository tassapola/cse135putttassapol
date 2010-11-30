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
					ArrayList<String> f = (ArrayList<String>)request.getAttribute("firstname");
					ArrayList<String> l = (ArrayList<String>)request.getAttribute("lastname");
					ArrayList<String> m = (ArrayList<String>)request.getAttribute("middlename");
					ArrayList<Double> g = (ArrayList<Double>)request.getAttribute("grade");
					ArrayList<String> s = (ArrayList<String>)request.getAttribute("status");
					ArrayList<Integer> id = (ArrayList<Integer>)request.getAttribute("id");
				%>
					<table>
					<tr>
						<th>No.</th>
						<th>First name</th>
						<th>Last name</th>
						<th>Middle name</th>
						<th>Grade</th>
						<th>Status</th>
					</tr>
					<%
						for (int i = 0; i < f.size(); i++) {							
					%>
						<tr>
							<td><%= id.get(i) %></td>
							<td><%= f.get(i) %></td> 
							<td><%= l.get(i) %></td>
							<td><%= m.get(i) %></td>
							<td><%= g.get(i) %></td>
							<td><%= s.get(i) %></td>
							<logic:notPresent name="reviewer">
								<html:form action="/mvc/chair/changestatus">
									<html:hidden property="id" value="<%= id.get(i).toString()%>"/>
									<% if (!s.get(i).equalsIgnoreCase("Admitted")){ %>
									<td>
										<html:submit property="status">Admit</html:submit>
									</td>
									<%} %>
									<% if (!s.get(i).equalsIgnoreCase("Rejected")){ %>
									<td>
										<html:submit property="status">Reject</html:submit>
									</td>
									<%} %>
									<% if (!s.get(i).equalsIgnoreCase("Pending")){ %>
									<td>
										<html:submit property="status">Cancel Decision</html:submit>
									</td>
									<%} %>
								</html:form>
							</logic:notPresent>
						</tr> 
					<%  
						} 
					%>
					</table>
			</div>
		</div>
	</body>
</html>