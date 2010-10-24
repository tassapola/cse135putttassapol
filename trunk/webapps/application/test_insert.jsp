<%@ page language="java" import="java.sql.*" %>
<%
Class.forName("org.postgresql.Driver");
Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
con.setAutoCommit(false);
out.println("Connection = " + con);
Statement stmt = con.createStatement();
String queryString;
queryString = "insert into countries (name) values ('thailand')";
ResultSet rset;
try {
	stmt.executeQuery(queryString);
	
} catch (SQLException se) {
	out.println(se);
} finally {
	con.commit();
}

queryString = "select * from countries";
rset = null;
try {
	rset = stmt.executeQuery(queryString);
} catch (SQLException se) {
	out.println(se);
}

while (rset != null && rset.next()) {
	out.println("<br>");
	out.println(rset.getString(1));
	out.println(rset.getString(2));
	
}
rset.close();

stmt.close();
%>

