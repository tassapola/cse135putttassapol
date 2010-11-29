<%@ page language="java" import="java.sql.*, java.util.*, model.*" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<% String nextPage = "collect_session.jsp?next=address.jsp&"; %>

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
		<%
		 	Applicant a = (Applicant) session.getAttribute(Constants.ATTR_NAME_APPLICANT);
		%>
		<div class="node">
			<div class="title">Applicant name</div>
			<div class="info">
				<span class="topic">First name: </span><%= a.getFirstName() %> <br/>
				<span class="topic">Last name: </span><%= a.getLastName() %> <br/>
				<span class="topic">Middle name: </span><%= a.getMiddleName() %> <br/>
			</div>
			<div class="title">Country of Citizenship</div>
			<div class="info">
				<span class="topic">Country of Citizenship</span> <%= a.getCitizenship() %> 
			</div>
		</div>

		<div class="node">
			<div class="title">Please select your country of recidence:</div>
			<%
				LinkedList<String> countries = (LinkedList<String>)request.getAttribute(Constants.LIST_COUNTRIES);
				//Applicant object was set earlier, no need to redeclare
			%>
			<table>
			<tr><td>
			<html:link action="/mvc/application/residence.do">
				<html:param name="residence">
				   <%= a.getCitizenship() %>
				</html:param>
				Same with country of citizenship
			</html:link>
			</td></tr>
			<%
				int counter = 0;
				for (Iterator<String> it = countries.iterator(); it.hasNext();) {
					String country = it.next();
					if (counter % 3 == 0) out.println("<tr>");
			%>
					<td>
					<html:link action="/mvc/application/residence.do">
					  <html:param name="residence">
					     <%= country %>
					  </html:param>
					<%= country %>
					</html:link>
					</td> 
			<%  
					if (counter % 3 == 2) out.println("</tr>");
					counter ++;
				} 
				if (counter % 3 != 0) out.println("</tr>");
			%>
			</table>
		</div>
	</body>
</html>