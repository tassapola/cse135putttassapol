<html>
	<head>
	<style>
		body {margin:auto; width:800px; font-size:10pt; font-family: helvetica,Arial,verdana,sans-serif;color:#000;}
		table {margin: 10px auto; }
		.header {font-size:200%; text-align:center; margin:10px 0; padding:10px 0; border-bottom:solid thin #000;}
		.node {border: solid thin #DDD;}
		.node .title {font-size:120%; font-weight:bold; margin:5px 20px; border-bottom:solid thin #DDD;}
		.field-container {font-size:10pt; text-align:center; margin: 5px;}
		.field-container .label{ text-align: right;}
		
	</style>
	</head>
	<body>
	<div class="header-container">	
			<div class="header">
				Graduate Admission System Login
			</div>
		</div>
	<form method="POST" action="j_security_check">
    Username:
    <input size="12" name="j_username" type="text"/><br/>
    Password:
    <input size="12" name="j_password" type="password"/><br/>
    <input type="submit" value="Login"/>
	</body>
</form>