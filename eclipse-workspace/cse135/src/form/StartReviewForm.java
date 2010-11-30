package form;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.*;
import org.apache.struts.action.*;

import java.sql.*;


public class StartReviewForm extends ActionForm {

	public ActionErrors validate(ActionMapping mappping,
								 HttpServletRequest request
								) 
	{
		ActionErrors errors = new ActionErrors();
		boolean canReviewStart = false;
		
		try {
			Class.forName("org.postgresql.Driver");
			Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
			con.setAutoCommit(false);
			Statement stmt = con.createStatement();
			ResultSet count = stmt.executeQuery("SELECT COUNT(*) FROM user_roles WHERE role='reviewer'");
			count.next();
			canReviewStart = (count.getInt(1) >= 2);
			count.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(!canReviewStart)
			errors.add("reviewers", new ActionMessage("error.reviewer.required"));
		
		return errors;
	}
	
	public void reset(ActionMapping mapping, HttpServletRequest request) {
	}
}
