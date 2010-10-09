<html>
	<head>
	<% session.invalidate(); %>
	</head>
	<body>
		<div class="form-container">
			<form action="collect_session.jsp" method="GET">
				<div class="field-container"> 
					<span class="label">First Name:</span><input type="text" name="first_name"/>
				</div>
				<div class="field-container"> 
					<span class="label">Last Name:</span><input type="text" name="last_name"/>
				</div>
				<div class="field-container"> 
					<span class="label">Middle Name:</span><input type="text" name="middle_name"/>
				</div>
				<input type="hidden" name="next" value="citizenship.jsp"/>
				<div class="field-container"> 
					<input type="submit" name="submit" value="submit"/> 
				</div>
			</form>
		</div>
	</body>
</html>