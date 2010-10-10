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
      	<%
      		support s = new support();   	
      		String specializationsPath = config.getServletContext().getRealPath("/support/specializations.txt");
      		
      		Vector specializationsVector =  s.getSpecializations(specializationsPath);
      		int counter = 0;
      	%>
			<div class="title">Select your specialization</div>
			<form action="collect_session.jsp" method="GET">
				<table>
					<tr class="field-container"> 
						<td class="label">Specialization: </td>
						<td class="field">
							<select name="specialization">
								<%
								  String item;
								  for (Enumeration e = specializationsVector.elements(); e.hasMoreElements();)
								  {
									  item = (String) e.nextElement();
									  
								  %>
								<option value="<%= item %>"><%= item %></option>
								<%
								  }
								%>
							</select>
						</td>
					</tr>
				</table>
				<input type="hidden" name="next" value="verification.jsp"/>
				<div class="field-container"> 
					<input type="submit" name="submit" value="submit"/> 
				</div>
			</form>
		</div>
	</body>
</html>