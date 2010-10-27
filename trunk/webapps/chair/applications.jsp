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
		Applications Page
	</div>
	<%
		Class.forName("org.postgresql.Driver");

		Connection conn=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		conn.setAutoCommit(false);
		String reqSpec = request.getParameter("specialization");
		String reqDisc = request.getParameter("discipline");
		
		String query;
		query = "select first_name, last_name, middle_name from " +
				"(" +
				"select " +
				"a.id as id, "  +
				"a.first_name as first_name, a.last_name as last_name, a.middle_name as middle_name, " + 
				"s.name as specialization, u.name as university, de.degree_title as degree_title, di.name as discipline " +
				"from applicant a, specializations s, degree de, degree_holder de_h, disciplines di, universities u " +
				"where a.specialization = s.id " +
				"and de_h.applicant = a.id " +
				"and de_h.degree = de.id " + 
				"and de.discipline = di.id " +
				"and de.university = u.id ";
		if (reqSpec != null)
			query += "and s.name = '" + reqSpec + "' ";
		if (reqDisc != null)
			query += "and di.name = '" + reqDisc + "' ";
		//query += "group by a.id ";
		//query += "order by a.last_name, a.first_name, a.middle_name, de.degree_title desc";
		query += ") as Z group by id, first_name, last_name, middle_name ";
		query += "order by last_name, first_name, middle_name";
		ResultSet resultSet;
		Statement stmt = conn.createStatement();
		resultSet = stmt.executeQuery(query);
	%>  <table>
	<%
		boolean firstRow = true;
		int rowNo = 1;
		while (resultSet.next()) {
			String first_name = resultSet.getString("first_name");
			String last_name = resultSet.getString("last_name");
			String middle_name = resultSet.getString("middle_name");
			if (firstRow) {
				out.print("<tr>");
				out.print("<th>No.</th>");
				out.print("<th>First name</th>");
				out.print("<th>Last name</th>");
				out.print("<th>Middle name</th>");
				out.print("</tr>");
			}
			out.print("<tr>");
			out.print("<td>" + rowNo + "</td>");
			out.print("<td>" + first_name + "</td>");
			out.print("<td>" + last_name + "</td>");
			out.print("<td>" + middle_name + "</td>");
			out.print("</tr>");
			firstRow = false;
			rowNo++;
		}
	%>
		</table>
	
	</body>
</html>