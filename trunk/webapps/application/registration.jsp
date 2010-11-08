<%@page import="
	java.util.*,
	java.io.*,
	java.sql.*" 
%>

<html>
	<head>
    <% session.invalidate(); %>
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
    <%
        String username = (String)request.getParameter("username");
        String passwd = (String)request.getParameter("passwd");
        String retyped_passwd = (String)request.getParameter("retyped_passwd");
        String email = (String)request.getParameter("email");
        
        boolean hasRequest = request.getParameterNames().hasMoreElements();
        boolean isUsernameValid = false;
        boolean isPasswordValid = false;
        boolean isPasswordMatch = false;
        boolean isEmailValid = false;
        
        if (hasRequest)
        {
            Class.forName("org.postgresql.Driver");
            Connection conn =DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
            conn.setAutoCommit(false);
            
            try 
            {                
                PreparedStatement stmt = conn.prepareStatement("SELECT user_name FROM users WHERE user_name=?;");
                stmt.setString(1, username);
                ResultSet resultSet = stmt.executeQuery();
                
                isUsernameValid =  !resultSet.next() && !username.equals("");
                
                resultSet.close();
                
                stmt = conn.prepareStatement("SELECT email FROM users WHERE email=?;");
                stmt.setString(1, email);
                resultSet = stmt.executeQuery();
                
                isEmailValid =  !resultSet.next();
                resultSet.close();
                
                isPasswordValid =  !passwd.equals("");
                isPasswordMatch = passwd.equals(retyped_passwd);
                
                if(isUsernameValid && isPasswordValid && isPasswordMatch && isEmailValid )
                {
                    stmt = conn.prepareStatement("INSERT INTO users(user_name, password, email) VALUES(?,md5(?),?)");
                    stmt.setString(1, username);
                    stmt.setString(2, passwd);
                    stmt.setString(3, email);
                    stmt.execute();
                    
                    stmt = conn.prepareStatement("INSERT INTO user_roles (user_name, role) values (?, 'applicant');");
                    stmt.setString(1, username);
                    stmt.execute();
                    
                    conn.commit();
                    out.println("<meta http-equiv=\"REFRESH\" content=\"0;url=registration_complete.jsp\"/>");
                }
            } 
            catch (SQLException se) 
            {
                throw se;
            } 
            finally 
            {
                conn.close();
            }
        }
    %>
	</head>
	<body>
		<div class="header-container">	
			<div class="header">
				Graduate Admission System
			</div>
		</div>
		<form action="" method="GET" <% if (hasRequest && !isEmailValid) out.print("style=\"display:none;\"");%>>
			<div class="node" >
				<div class="title">Applicant Registration</div>
				<table >
					<tr class="field-container"> 
						<td class="label">Username:</td>
						<td class="field"> <input type="text" name="username"/></td>
					</tr>
                        <% 
                            if(hasRequest && !isUsernameValid)
                            {
                         %>
                    <tr class="field-container"> 
						<td class="label"></td>
						<td class="field error">* Username <%=username%> already exists in the system</td>
					</tr>
                         <%
                            }
                         %>
					<tr class="field-container"> 
						<td class="label">Password:</td>
						<td class="field"> <input type="password" name="passwd"/> </td>
					</tr>
                        <% 
                            if(hasRequest && !isPasswordValid)
                            {
                         %>
                    <tr class="field-container"> 
						<td class="label"></td>
						<td class="field error">* Password cannot be empty</td>
					</tr>
                         <%
                            }
                         %>
					<tr class="field-container"> 
						<td class="label">Retyped Password:</td>
						<td class="field"><input type="password" name="retyped_passwd"/> </td>
					</tr>
                        <% 
                            if( hasRequest && !isPasswordMatch)
                            {
                         %>
                    <tr class="field-container"> 
						<td class="label"></td>
						<td class="field error">* Password mismatch</td>
					</tr>
                         <%
                            }
                         %>
                    <tr class="field-container"> 
						<td class="label">E-mail:</td>
						<td class="field"> <input type="text" name="email"/> </td>
					</tr>
				</table>
			</div>
			<div class="field-container"> 
				<input type="submit" name="submit" value="submit"/> 
				<input type="reset" name="reset" value="clear"/> 
			</div>
		</form>
        <div class="node" <% if (!hasRequest || isEmailValid) out.print("style=\"display:none;\"");%>>
				<div class="title">Applicant Registration</div>
                <div class="info">
                    This e-mail address is already registered with the system. You can proceed to submit the application.
                </div>
                <div class="field-container">
                    <form action="name.jsp" method="GET">
                        <input type="submit" name="proceed" value="Proceed"/> 
                    </form>
                </div>
        </div>
	</body>
</html>