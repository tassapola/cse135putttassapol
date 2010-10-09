<%@page import="support.*, java.util.*" %>

<% String nextPage = "collect_session.jsp"; %>

<html>
	<head>
	</head>
	<body>
		<div class="info-container">
			Country of Residence: <%= session.getAttribute("residence")%> <br/>
		</div>
		<br/>
		<div class="form-container">
			<form action="collect_session.jsp" method="GET">
				<div class="field-container"> 
					<span class="label">Street Address:</span><input type="text" name="street"/>
				</div>
				<div class="field-container"> 
					<span class="label">City:</span><input type="text" name="city"/>
				</div>
				<% 
				if (session.getAttribute("residence").equals("United States"))
				{
				%>
				<div class="field-container"> 
					<span class="label">State:</span><input type="text" name="state"/>
				</div>
				<% } %>
				<div class="field-container"> 
					<span class="label">Zip code:</span><input type="text" name="zipcode"/>
				</div>
				<% 
				if (!session.getAttribute("residence").equals("United States"))
				{
				%>
				<div class="field-container"> 
					<span class="label">Country code:</span><input type="text" name="countrycode" maxlength="3" size="3"/>
				</div>
				<% } %>
				<div class="field-container"> 
					<span class="label">Area code:</span><input type="text" name="areacode" maxlength="3" size="3"/>
				</div>
				<div class="field-container"> 
					<span class="label">Telephone number:</span><input type="text" name="telephone"/>
				</div>
				<input type="hidden" name="next" value="<%= (session.getAttribute("residence").equals("United States"))?"degree_location.jsp":"recidency.jsp" %>"/>
				<div class="field-container"> 
					<input type="submit" name="submit" value="submit"/> 
				</div>
			</form>
		</div>
	</body>
</html>