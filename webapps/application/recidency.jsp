<html>
	<head>
	</head>
	<body>
		<div class="info-container">
			Street Address: <%= session.getAttribute("street") %> <br/>
			City:<%= session.getAttribute("city") %> <br/>
			<% 
			if (session.getAttribute("residence").equals("United States"))
			{
			%>
			State:<%= session.getAttribute("state") %> <br/>
			<% } %>
			
			Zip code: <%= session.getAttribute("zipcode") %> <br/>
			<% 
			if (!session.getAttribute("residence").equals("United States")) 
			{
			%>
			Country code:<%= session.getAttribute("countrycode") %> <br/>
			<% } %>
			Area code: <%= session.getAttribute("areacode") %> <br/>
			Telephone number: <%= session.getAttribute("telephone") %> <br/>
		</div>
		<br/>
		<div class="form-container">
			<form action="collect_session.jsp" method="GET">
				<div class="field-container"> 
					<span class="label">Residency:</span> <br/>
					<input type="radio" name="residency" value="US Permanent Resident" checked="yes" /> US Permanent Resident <br/>
					<input type="radio" name="residency" value="Non-Resident"/> Non-Resident <br/>
				</div>
				<input type="hidden" name="next" value="provide_degree_location.jsp"/>
				<div class="field-container"> 
					<input type="submit" name="submit" value="submit"/> 
				</div>
			</form>
		</div>
	</body>
</html>