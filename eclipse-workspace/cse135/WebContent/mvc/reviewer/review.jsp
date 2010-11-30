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
			<div class="title">Application Reviews</div>
			<div class="info">
				<%

					ArrayList<String> r = (ArrayList<String>)request.getAttribute("reviewers");
					ArrayList<Double> g = (ArrayList<Double>)request.getAttribute("grade");
					ArrayList<String> c = (ArrayList<String>)request.getAttribute("comment");
				%>
					<table>
					<tr>
						<th>Reviewer</th>
						<th>Grade</th>
						<th>Comment</th>
					</tr>
					<%
						for (int i = 0; i < r.size(); i++) {							
					%>
						<tr>
							<td><%= r.get(i) %></td>
							<td><%= g.get(i) %></td>
							<td><%= c.get(i) %></td>
						</tr> 
					<%  
						} 
					%>
					</table>
			</div>
			
			<div class="title">Your Reviews</div>
			<div class="info">
				<html:errors/>
				<html:form action="/mvc/reviewer/commitreview">
					Grade: <html:text property="grade"></html:text> <br/>
					Comments: <html:textarea property="comment"></html:textarea> <br/>
					<html:hidden property="reviewer" value='<%=(String)request.getAttribute("reviewer")%>'/>
					<html:hidden property="applicant" value='<%=(String)request.getAttribute("applicant")%>'/> 
					<html:submit/>
					<html:reset/>
				</html:form>
			</div>
		</div>
	</body>
</html>