<html>
	<head>
	<style>
		body {margin:auto; width:800px; font-size:10pt; font-family: helvetica,Arial,verdana,sans-serif;color:#000;}		
		table {margin: 10px auto; max-width:90%;}
		hr {color:#DDD;}
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
				<div class="title">Your registration is complete</div>
				<div class="info">Please proceed to submit application page.</div>
                <div class="field-container">
                    <form action="/cse135/application/name.jsp" method="GET">
                        <input type="submit" name="proceed" value="Proceed"/> 
                    </form>
                </div>
            </div>
	</body>
</html>