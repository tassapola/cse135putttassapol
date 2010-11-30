package action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

import javax.servlet.http.*;
import org.apache.struts.action.*;
import model.*;

import form.AddReviewerForm;

public class AddReviewerAction extends Action 
{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception 
    {
		AddReviewerForm reviewerForm = (AddReviewerForm)form;
		
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		con.setAutoCommit(false);
		PreparedStatement stmt = con.prepareStatement("");
		
		stmt = con.prepareStatement("INSERT INTO users(user_name, password, email) VALUES(?,md5(?),?)");
        stmt.setString(1, reviewerForm.getUsername());
        stmt.setString(2, reviewerForm.getPassword());
        stmt.setString(3, "");
        stmt.execute();
        
        stmt = con.prepareStatement("INSERT INTO user_roles (user_name, role) values (?, 'reviewer');");
        stmt.setString(1, reviewerForm.getUsername());
        stmt.execute();
        
        con.commit();
		stmt.close();
		con.close();
		
		return mapping.findForward("success");
	}
}
