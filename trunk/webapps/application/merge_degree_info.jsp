<%@page import="support.*, java.util.*" %>

<%
	String submit = request.getParameter("submit");
	String nextPage = "provide_degree_location.jsp";
	if(submit.equals("Done"))
	{
		nextPage = "specialization.jsp";
	}
	
	HashMap degree = new HashMap();
    degree.put("location", session.getAttribute("location"));
	degree.put("university", session.getAttribute("university"));
	degree.put("degree_title", session.getAttribute("degree_title"));
	degree.put("degree_month", session.getAttribute("degree_month"));
	degree.put("degree_year", session.getAttribute("degree_year"));
	degree.put("degree_gpa", session.getAttribute("degree_gpa"));	
	degree.put("transcript_file", session.getAttribute("transcript_file"));
	degree.put("discipline", session.getAttribute("discipline"));
	degree.put("other_discipline", session.getAttribute("other_discipline"));
	
	Vector degreeVector = (Vector)session.getAttribute("degree_vector");
	if (degreeVector == null)
	{
		degreeVector = new Vector();
	}
	
	degreeVector.add(degree);
	
	session.setAttribute("degree_vector", degreeVector);
%>

<html>
	<head>
	<meta http-equiv="REFRESH" content="0;url=<%= nextPage %>"/>
	</head>
</html>
