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
		
	</style>
	</head>
	<body>
		<div class="header-container">	
			<div class="header">
				Graduate Admission System
			</div>
		</div>
		<div class="node">
			<div class="title">Applications by Reviewer</div>
			<div class="info">
				<%
					ArrayList<String> reviewers = (ArrayList<String>)request.getAttribute(Constants.LIST_REVIEWERS);
					ArrayList<Integer> reviews = (ArrayList<Integer>)request.getAttribute(Constants.LIST_REVIEWERS_REVIEW);
					ArrayList<Integer> notreviews = (ArrayList<Integer>)request.getAttribute(Constants.LIST_REVIEWERS_NOT_REVIEW);
				%>
					<table>
					<tr>
						<th>Reviewers</th>
						<th>Reviewed Application</th>
						<th>Remaining Application</th>
					</tr>
					<%
						for (int i = 0; i < reviewers.size(); i++) {							
					%>
						<tr>
							<td><%= reviewers.get(i) %></td> 
							<td>
								<html:link action="/mvc/chair/applications">
									<html:param name="reviewed">true</html:param>
									<html:param name="reviewer"><%= reviewers.get(i) %></html:param>
									<%= reviews.get(i) %>
								</html:link>
							</td>
							<td>
								<html:link action="/mvc/chair/applications">
									<html:param name="reviewed">false</html:param>
									<html:param name="reviewer"><%= reviewers.get(i) %></html:param>
									<%= notreviews.get(i) %>
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