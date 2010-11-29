<%@ page language="java" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

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
				Graduate Admission System
			</div>
		</div>
		<html:form action="/mvc/application/name">
			First name: <html:text property="firstName"/><br>
			Last name: <html:text property="lastName"/><br>
			Middle name: <html:text property="middleName"/></br>
			<html:submit value="Submit"/>
			<html:reset />
		</html:form>
		<!--
		<form action="name.do" method="GET">
			<div class="node">
				<div class="title">Applicant Name</div>
				<table >
					<tr class="field-container"> 
						<td class="label">First Name:</td>
						<td class="field"> <input type="text" name="first_name"/> </td>
					</tr>
					<tr class="field-container"> 
						<td class="label">Last Name:</td>
						<td class="field"> <input type="text" name="last_name"/> </td>
					</tr>
					<tr class="field-container"> 
						<td class="label">Middle Name:</td>
						<td class="field"><input type="text" name="middle_name"/> </td>
					</tr>
				</table>
				<input type="hidden" name="next" value="citizenship.jsp"/>
			</div>
			<div class="field-container"> 
				<input type="submit" name="submit" value="submit"/> 
				<input type="reset" name="reset" value="clear"/> 
			</div>
		</form>
		-->
	</body>
</html>