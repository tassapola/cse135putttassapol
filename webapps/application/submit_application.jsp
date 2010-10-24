<%@ page language="java" import="java.sql.*,support.*, java.util.*" %>

<%
	String submit = request.getParameter("submit");
	String nextPage = "cancellation.jsp";
	
	if(submit.equals("Submit Application")) 
	{
		nextPage = "confirmation.jsp";
		
		//Add data to database
		
		Class.forName("org.postgresql.Driver");

		Connection conn=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		conn.setAutoCommit(false);
		
		String query = "";
		ResultSet resultSet;
		int count;
		
		int address_id  = -1;
		int citizenship_id  = -1;
		int residence_id  = -1;
		int specialization_id  = -1;
		
		//Address 
		//Check if this address exist in the database
		
		PreparedStatement stmt = conn.prepareStatement("SELECT id FROM address WHERE street_address = ? AND city = ? AND zip_code = ? AND area_code = ? AND tel_number = ? AND state = ? AND country_code = ?;");
		stmt.setString(1, (String)session.getAttribute("street"));
		stmt.setString(2, (String)session.getAttribute("city"));
		stmt.setString(3, (String)session.getAttribute("zipcode"));
		stmt.setString(4, (String)session.getAttribute("areacode"));
		stmt.setString(5, (String)session.getAttribute("telephone"));
		stmt.setString(6, (session.getAttribute("state") != null)?(String)session.getAttribute("state"):"-");
		stmt.setString(7, (String)session.getAttribute("countrycode"));
		
		resultSet = stmt.executeQuery();
		
		if(!resultSet.next())
		{
			resultSet.close();
			
			//Addess does not exist in database
			
			//Create address entry
			PreparedStatement insert_stmt = conn.prepareStatement("INSERT INTO address (street_address,city,zip_code,area_code,tel_number,state,country_code) VALUES (?,?,?,?,?,?,?)");
			insert_stmt.setString(1, (String)session.getAttribute("street"));
			insert_stmt.setString(2, (String)session.getAttribute("city"));
			insert_stmt.setString(3, (String)session.getAttribute("zipcode"));
			insert_stmt.setString(4, (String)session.getAttribute("areacode"));
			insert_stmt.setString(5, (String)session.getAttribute("telephone"));
			insert_stmt.setString(6, (session.getAttribute("state") != null)?(String)session.getAttribute("state"):"-");
			insert_stmt.setString(7, (String)session.getAttribute("countrycode"));
			
			insert_stmt.execute();
			
			//Get  address id
			resultSet = stmt.executeQuery();
			
			if(!resultSet.next())
				throw new Exception();
		}
		
		address_id = resultSet.getInt("id");
		resultSet.close();

		//End Address
		
		//Citizenship
		
		stmt = conn.prepareStatement("SELECT id FROM countries WHERE name = ?");
		stmt.setString(1, (String)session.getAttribute("citizenship"));
		resultSet = stmt.executeQuery();
		
		if(resultSet.next())
		{
			//Addess exists in database
			citizenship_id = resultSet.getInt("id");
		}
		else
		{
			throw new Exception();
		}
		
		//End citizenship
		
		//Country of residence
		
		stmt = conn.prepareStatement("SELECT id FROM countries WHERE name = ?");
		stmt.setString(1, (String)session.getAttribute("residence"));
		resultSet = stmt.executeQuery();
		
		if(resultSet.next())
		{
			//Addess exists in database
			residence_id = resultSet.getInt("id");
		}
		else
		{
			throw new Exception();
		}
		
		resultSet.close();
		//End Country of residence
		
		//Specialization
		
		stmt = conn.prepareStatement("SELECT id FROM specializations WHERE name = ?");
		stmt.setString(1, (String)session.getAttribute("specialization"));
		resultSet = stmt.executeQuery();
		
		if(resultSet.next())
		{
			//Addess exists in database
			specialization_id = resultSet.getInt("id");
		}
		else
		{
			throw new Exception();
		}
		resultSet.close();
		//End Specialization
		
		//Create applicant entry
		PreparedStatement insert_stmt = conn.prepareStatement("INSERT INTO applicant (first_name, last_name, middle_name, citizenship, residence, specialization, address, residency) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
		insert_stmt.setString(1, (String)session.getAttribute("first_name"));
		insert_stmt.setString(2, (String)session.getAttribute("last_name"));
		insert_stmt.setString(3, (String)session.getAttribute("middle_name"));
		insert_stmt.setInt(4,  citizenship_id);
		insert_stmt.setInt(5,  residence_id);
		insert_stmt.setInt(6,  specialization_id);
		insert_stmt.setInt(7,  address_id);
		
		if(session.getAttribute("residency").equals("US Permanent Resident"))
			insert_stmt.setBoolean(8,  true);
		else
			insert_stmt.setBoolean(8,  false);
		
		insert_stmt.execute();
		conn.commit();
					// Vector degreeVector = (Vector)session.getAttribute("degree_vector");
					
					// for (Enumeration e = degreeVector.elements(); e.hasMoreElements();)
					// {
						// HashMap degree = (HashMap) e.nextElement();
						// degree.get("location")
						// degree.get("university")
						// degree.get("discipline")
						// (degree.get("discipline").equals("other"))? "-" + degree.get("other_discipline"):""
						// degree.get("degree_title") 
						// degree.get("degree_month")
						// degree.get("degree_gpa")
						// degree.get("transcript_file")

					// }
	}
%>

<html>
	<head>
	<meta http-equiv="REFRESH" content="0;url=<%= nextPage %>"/>
	</head>
	<body>
	</body>
</html>