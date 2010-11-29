<%@ page language="java" import="java.sql.*,support.*, java.util.*" %>

<%
	Class.forName("org.postgresql.Driver");
	Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
	con.setAutoCommit(false);
	
	support s = new support();   	
   	
   	String path1 = config.getServletContext().getRealPath("/support/countries.txt");
   	String path2 = config.getServletContext().getRealPath("/support/universities.txt");
    String path3 = config.getServletContext().getRealPath("/support/majors.txt");
    String path4 = config.getServletContext().getRealPath("/support/specializations.txt");
	String queryString;
	
    Vector countries = s.getCountries(path1);    
    Vector universities = s.getUniversities(path2);
    Vector majors = s.getMajors(path3);
    Vector specializations = s.getSpecializations(path4);
	
	Statement stmt = con.createStatement();
	Boolean isErr = false;
	
	for(int i=0; i<countries.size(); i++)
	{
		try 
		{
			queryString = "insert into countries (name) values ('" + ((String)countries.get(i)).replace("'", "''")+ "')";
			stmt.execute(queryString);	
		} 
		catch (SQLException se) 
		{
			out.println("countries > " + se);
			isErr = true;
		} 
		finally 
		{
			if(isErr) return;
			con.commit();
		}
	}
	
	out.println("Countries Table Installed <br/>");
	
	for(int i=0; i<majors.size(); i++)
	{
		try 
		{
			queryString = "insert into disciplines (name) values ('" + majors.get(i) + "')";
			stmt.execute(queryString);	
		} 
		catch (SQLException se) 
		{
			out.println("disciplines > " + se);
			isErr = true;
		} 
		finally 
		{
			if(isErr) return;	
			con.commit();
		}
	}
	
	out.println("Disciplines Table Installed <br/>");
	
	for(int i=0; i<specializations.size(); i++)
	{
		try 
		{
			queryString = "insert into specializations (name) values ('" + specializations.get(i) + "')";
			stmt.execute(queryString);	
		} 
		catch (SQLException se) 
		{
			out.println("specializations > " + se);
			isErr = true;
		} 
		finally 
		{
			if(isErr) return;
			con.commit();
		}
	}

	out.println("Specializaetions Table Installed <br/>");
	
	for (int i=0; i<universities.size(); i++)
	{
		Vector tuple = (Vector)universities.get(i);
		String state = (String)tuple.get(0);
		Vector u = (Vector)tuple.get(1);
		for(int j=0; j<u.size(); j++)
		{
			try 
			{
				queryString = "insert into universities (location,name) values ('"+  state +"','" + ((String)u.get(j)).replace("'", "''") + "')";
				stmt.execute(queryString);	
			} 
			catch (SQLException se) 
			{
				out.println("universities > " + se);
				isErr = true;
			} 
			finally 
			{
				if(isErr) return;
				con.commit();
			}
		}
    } 
	
	out.println("Universities Table Installed <br/>");
	
	stmt.close();
%>

