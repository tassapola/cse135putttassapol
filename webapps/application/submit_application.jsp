<page language="java" import="java.sql.*,support.*, java.util.*" %>
<%@page import="
    org.apache.commons.fileupload.*, 
    org.apache.commons.fileupload.disk.*,
	org.apache.commons.fileupload.servlet.*, 
	java.util.*,
	java.io.*,
	java.sql.*
" %>

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
		stmt.setString(7, (session.getAttribute("countrycode") != null)?(String)session.getAttribute("countrycode"):"-");
		
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
			insert_stmt.setString(7, (session.getAttribute("countrycode") != null)?(String)session.getAttribute("countrycode"):"-");
			
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
		
		if(session.getAttribute("citizenship").equals("United States") ||session.getAttribute("residency").equals("US Permanent Resident"))
			insert_stmt.setBoolean(8,  true);
		else
			insert_stmt.setBoolean(8,  false);
		
		insert_stmt.execute();
		conn.commit();
		
		//Beginning of degree insertion
		Vector degreeVector = (Vector)session.getAttribute("degree_vector");
			
		for (Enumeration e = degreeVector.elements(); e.hasMoreElements();)
		{
			HashMap degree = (HashMap) e.nextElement();
			String location = (String) degree.get("location");
			String university = (String) degree.get("university");
			String discipline = (String) degree.get("discipline");
			String other_discipline = (String) ((degree.get("discipline").equals("other"))? "-" + degree.get("other_discipline"):"");
			String degree_title	= (String) degree.get("degree_title");
			String degree_month = (String) degree.get("degree_month");
			String degree_year = (String) degree.get("degree_year");
			String degree_gpa = (String) degree.get("degree_gpa");
			DiskFileItem transcript_file = (DiskFileItem) degree.get("transcript_file");
			
			String fileName = transcript_file.getName();
			InputStream stream = transcript_file.getInputStream();
			insert_stmt = conn.prepareStatement("INSERT INTO transcript (name, content) values (?, ?);");
			insert_stmt.setString(1, fileName);
			insert_stmt.setBinaryStream(2, stream, (int) transcript_file.getSize());
			insert_stmt.execute();
			int transcript_id;
			stmt = conn.prepareStatement("SELECT id FROM transcript WHERE name = ?;");
			stmt.setString(1, fileName);
			resultSet = stmt.executeQuery();
			if(resultSet.next())
			{
				//Transcript exists in database
				transcript_id = resultSet.getInt("id");
			}
			else
				throw new Exception("transcript must be stored in the database and has ID");
			
			stmt = conn.prepareStatement("SELECT id FROM universities WHERE name = ? AND location = ?;");
			stmt.setString(1, university);
			stmt.setString(2, location);
			resultSet = stmt.executeQuery();
			int university_id = 0;
			if(!resultSet.next())
			{
				resultSet.close();
				
				insert_stmt = conn.prepareStatement("INSERT INTO universities (name, location) VALUES (?, ?);");
				insert_stmt.setString(1, university);
				insert_stmt.setString(2, location);
				
				insert_stmt.execute();
				
				resultSet = stmt.executeQuery();
				
				if(!resultSet.next())
					throw new Exception();
			}
			
			university_id = resultSet.getInt("id");
			resultSet.close();
			//End getting university ID
			
			stmt = conn.prepareStatement("SELECT id FROM disciplines WHERE name = ?;");
			String discipline_name_in_db = discipline + other_discipline;
			stmt.setString(1, discipline_name_in_db);
			resultSet = stmt.executeQuery();
			int discipline_id = 0;
			if(resultSet.next())
			{
				//Discipline exists in database
				discipline_id = resultSet.getInt("id");
			}
			else
			{
				//New discipline
				insert_stmt = conn.prepareStatement("INSERT INTO disciplines (name) VALUES (?);");
				
				insert_stmt.setString(1, discipline_name_in_db);
				insert_stmt.execute();
				resultSet.close();
				stmt = conn.prepareStatement("SELECT id FROM disciplines WHERE name = ?;");
				stmt.setString(1, discipline_name_in_db);
				resultSet = stmt.executeQuery();
				if (resultSet.next())
				{
					discipline_id = resultSet.getInt("id");
				} else {
					throw new Exception("discipline must exist in the database.");
				}
			}
			resultSet.close(); //close either first select or second select depending on if-case
			//End getting discipline ID
			
			//Start a transaction here (not fully correct)
			//Create degree entry if it does not exist
			
			stmt = conn.prepareStatement("SELECT id FROM degree WHERE university = ? AND discipline = ? AND degree_title = ? AND degree_date = ? AND (gpa - ?) < 0.0001 AND transcript = ?;");
			stmt.setInt(1, university_id);
			stmt.setInt(2, discipline_id);
			stmt.setString(3, degree_title);
			Calendar cal = Calendar.getInstance();
			int year = Integer.parseInt(degree_year);
			int month = Integer.parseInt(degree_month) - 1;
			cal.set(year, month, 01);
			stmt.setDate(4, new java.sql.Date(cal.getTimeInMillis()));
			stmt.setFloat(5, Float.parseFloat(degree_gpa));
			stmt.setInt(6, transcript_id);
			resultSet = stmt.executeQuery();
			
			if (!resultSet.next())
			{
				insert_stmt = conn.prepareStatement("INSERT INTO degree (university, discipline, degree_title, degree_date, gpa, transcript) VALUES (?, ?, ?, ?, ?, ?)");
				insert_stmt.setInt(1, university_id);
				insert_stmt.setInt(2, discipline_id);
				insert_stmt.setString(3, degree_title);
				insert_stmt.setDate(4, new java.sql.Date(cal.getTimeInMillis()));
				insert_stmt.setFloat(5, Float.parseFloat(degree_gpa));
				insert_stmt.setInt(6,  transcript_id);
				insert_stmt.execute();
			}
			
			
			int applicant_id;
			stmt = conn.prepareStatement("SELECT id FROM applicant WHERE first_name = ? AND last_name = ? AND middle_name = ?;");
			stmt.setString(1, (String)session.getAttribute("first_name"));
			stmt.setString(2, (String)session.getAttribute("last_name"));
			stmt.setString(3, (String)session.getAttribute("middle_name"));
			resultSet = stmt.executeQuery();
			if (resultSet.next())
			{
				applicant_id = resultSet.getInt("id");
			} else {
				throw new Exception("applicant must exist in the database.");
			}
			
			int degree_id;
			
			stmt = conn.prepareStatement("SELECT id FROM degree WHERE university = ? AND discipline = ? AND degree_title = ? AND degree_date = ? AND (gpa - ?) < 0.0001 AND transcript = ?;");
			stmt.setInt(1, university_id);
			stmt.setInt(2, discipline_id);
			stmt.setString(3, degree_title);
			stmt.setDate(4, new java.sql.Date(cal.getTimeInMillis()));
			stmt.setFloat(5, Float.parseFloat(degree_gpa));
			stmt.setInt(6, transcript_id);
			resultSet = stmt.executeQuery();
			if (resultSet.next())
			{
				degree_id = resultSet.getInt("id");
			} else {
				throw new Exception("degree must exist in the database.");
			}
			
			
			//Create degree_holder entry if it does not exist
			stmt = conn.prepareStatement("SELECT id FROM degree_holder WHERE applicant = ? AND degree = ?;");
			stmt.setInt(1, applicant_id);
			stmt.setInt(2, degree_id);
			resultSet = stmt.executeQuery();
			if (!resultSet.next())
			{
				insert_stmt = conn.prepareStatement("INSERT INTO degree_holder (applicant, degree) VALUES (?, ?)");
				insert_stmt.setInt(1, applicant_id);
				insert_stmt.setInt(2, degree_id);
				insert_stmt.execute();
			} 
			
			
			//DEBUG
			out.println("<b>== insert one degree successful ==</b><br>");
			out.println("location = " + location + "<br>");
			out.println("university = " + university + "<br>");
			out.println("discipline = " + discipline + "<br>");
			out.println("other_discipline = " + other_discipline + "<br>");
			out.println("degree_title = " + degree_title + "<br>");
			out.println("degree_month = " + degree_month + "<br>");
			out.println("degree_year = " + degree_year + "<br>");
			out.println("degree_gpa = " + degree_gpa + "<br>");
			out.println("transcript_id = " + transcript_id + "<br>");
			out.println("university_id = " + university_id + "<br>");
			out.println("discipline_id = " + discipline_id + "<br>");
			out.println("applicant_id = " + applicant_id + "<br>");
			out.println("degree_id = " + degree_id + "<br>");
			out.println("<br>");
		 }
		 //Commit the transaction after all degrees are inserted
		conn.commit();
		//End of degree insertion	
	}
	
	
%>

<html>
	<head>
	<!--
	TODO: enable after debug
	<meta http-equiv="REFRESH" content="0;url=<%= nextPage %>"/>
	-->
	</head>
	<body>
	</body>
</html>