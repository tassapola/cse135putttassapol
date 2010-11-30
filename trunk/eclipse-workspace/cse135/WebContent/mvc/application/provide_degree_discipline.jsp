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
		
	</body>
</html>