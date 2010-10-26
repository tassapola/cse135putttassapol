<%@page import="java.sql.*, java.util.*" %>

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
		.field-container .field{ text-align: left;}
		
	</style>
	</head>
	<body>
	<div class="header">
		Specialization Analytics Page
	</div>
	<%
		Class.forName("org.postgresql.Driver");

		Connection conn=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		conn.setAutoCommit(false);
		
		String query;
		query = "select s.name as name, " + 
				"count(distinct (a.first_name, a.last_name, a.middle_name)) as count from applicant a, specializations s " + 
				"where " + 
				"a.specialization = s.id " +
				"group by s.name";
		ResultSet resultSet;
		Statement stmt = conn.createStatement();
		resultSet = stmt.executeQuery(query);
	%>  <table>
	<%
		boolean firstRow = true;
		while (resultSet.next()) {
			String name = resultSet.getString("name");
			String count = resultSet.getString("count");
			if (firstRow) {
				out.print("<tr><th>Specialization</th><th>Number of student(s)</th></tr>");
			}
			out.print("<tr>");
			
			out.print("<td>");
			out.print("<a href=\"applications.jsp?specialization=" + name + "\">");
			out.print(name + "</a></td>");
			out.print("<td>" + count + "</td>");
			out.print("</tr>");
			firstRow = false;
		}
	%>
		</table>
	
	</body>
</html>