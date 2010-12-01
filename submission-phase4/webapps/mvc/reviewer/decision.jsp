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
			<div class="title">Decision</div>
			<div class="info">
				<html:form action="/mvc/reviewer/changestatus">
					<html:hidden property="id" value='<%= ((Integer)request.getAttribute("applicant")).toString()%>'/>
					<html:submit property="status">Admit</html:submit>
					<html:submit property="status">Reject</html:submit>
					<html:submit property="status">Remain Pending</html:submit>
				</html:form>
			</div>
		</div>
	</body>
</html>