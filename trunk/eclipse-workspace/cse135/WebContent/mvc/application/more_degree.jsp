<%@ page language="java" import="java.sql.*, java.util.*, model.*" %>
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
		<div class="node">
			<div class="title">Degree</div>
			<div class="info">
				<span class="topic">Location: </span><%= session.getAttribute(Constants.SESS_UNI_LOCATION) %> <br/>
				<span class="topic">University: </span><%=session.getAttribute(Constants.SESS_UNIVERSITY)%> <br/>
				<span class="topic">Discipline: </span><%= session.getAttribute(Constants.SESS_DISCIPLINE) %> <%= (session.getAttribute(Constants.SESS_DISCIPLINE).equals("other"))? "-" + session.getAttribute(Constants.SESS_OTHER_DISCIPLINE):"" %> <br/>
				<span class="topic">Degree Title: </span><%= session.getAttribute(Constants.SESS_DEG_TITLE) %> <br/>
				<span class="topic">Degree Date: </span><%= session.getAttribute(Constants.SESS_DEG_MONTH) %> / <%= session.getAttribute(Constants.SESS_DEG_YEAR) %> <br/>
				<span class="topic">GPA: </span><%= session.getAttribute(Constants.SESS_DEG_GPA) %> <br/>
				<!-- 
				<span class="topic">Transcript: </span><%//= ((FileItem)session.getAttribute("transcript_file")).getName() %> <br/>
				 -->
			</div>
		</div>
		<div class="node">
			<div class="title">Submit more degree information?</div>
			<html:form action="/mvc/application/merge_degree">
				<div class="field-container"> 
					<html:submit property="submit" value="Submit Next Degree"/>
					<html:submit property="submit" value="Done"/>
				</div>
			</html:form>	
		</div>
	</body>
</html>