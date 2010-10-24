<%@page import="support.*, java.util.*" %>

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
				<span class="topic">Location: </span><%= session.getAttribute("location") %> <br/>
				<span class="topic">University: </span><%=session.getAttribute("university")%> <br/>
				<span class="topic">Discipline: </span><%= session.getAttribute("discipline") %> <%= (session.getAttribute("discipline").equals("other"))? "-" + session.getAttribute("other_discipline"):"" %> <br/>
				<span class="topic">Degree Title: </span><%= session.getAttribute("degree_title") %> <br/>
				<span class="topic">Degree Date: </span><%= session.getAttribute("degree_month") %> / <%= session.getAttribute("degree_year") %> <br/>
				<span class="topic">GPA: </span><%= session.getAttribute("degree_gpa") %> <br/>
				<span class="topic">Transcript: </span><%= session.getAttribute("transcript_file") %> <br/>
			</div>
		</div>
		<div class="node">
			<div class="title">Submit more degree information?</div>
			<form action="merge_degree_info.jsp" method="GET">
				<div class="field-container"> 
					<input type="submit" name="submit" value="Submit Next Degree"/> 
					<input type="submit" name="submit" value="Done"/> 
				</div>
			</form>	
		</div>
	</body>
</html>