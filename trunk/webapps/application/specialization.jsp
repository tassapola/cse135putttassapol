<%@page import="support.*, java.util.*" %>

<html>
	<head>
	<% session.invalidate(); %>
	</head>
	<body>
      	<%
      		support s = new support();   	
      		String specializationsPath = config.getServletContext().getRealPath("/support/specializations.txt");
      		
      		Vector specializationsVector =  s.getSpecializations(specializationsPath);
      		int counter = 0;
      	%>
		Specialization:	
		<div class="form-container">
			<form action="collect_session.jsp" method="GET">
				<div class="field-container"> 
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
				</div>
				<input type="hidden" name="next" value="verification.jsp"/>
				<div class="field-container"> 
					<input type="submit" name="submit" value="submit"/> 
				</div>
			</form>
		</div>
	</body>
</html>