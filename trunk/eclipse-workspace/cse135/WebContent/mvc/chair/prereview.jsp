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
			<html:errors/>
			<div class="title">Review</div>
			<div class="info">
				<html:link action="/mvc/chair/startreview">Start Review Process</html:link>
			</div>
			<br/>
			<div class="title">Add Reviewer</div>
			<div class="info">
				<html:form action="/mvc/chair/addreviewer">
					Username: <html:text property="username"/><br/>
					Password: <html:password property="password"/><br/>
					<html:submit value="Add"/>
					<html:reset />
				</html:form> 
			</div>
			<br/>
			<div class="title">Reviewers</div>
			<div class="info">
				<%
					LinkedList<String> reviewers = (LinkedList<String>)request.getAttribute(Constants.LIST_REVIEWERS);
				%>
				<table>
				<%
					for (Iterator<String> it = reviewers.iterator(); it.hasNext();) {
						String reviewer = it.next();
				%>
					<tr>
						<td>
							<%= reviewer %>
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