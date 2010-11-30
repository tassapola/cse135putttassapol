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

import form.RemoveReviewerForm;

public class RemoveReviewerAction extends Action 
{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception 
    {
		RemoveReviewerForm reviewerForm = (RemoveReviewerForm)form;
		
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		con.setAutoCommit(false);
		PreparedStatement stmt = con.prepareStatement("");
		
		stmt = con.prepareStatement("DELETE FROM user_roles WHERE user_name=?");
        stmt.setString(1, reviewerForm.getUsername());
        stmt.execute();
		
		stmt = con.prepareStatement("DELETE FROM users WHERE user_name=?");
        stmt.setString(1, reviewerForm.getUsername());
        stmt.execute();
        
        con.commit();
		stmt.close();
		con.close();
		
		return mapping.findForward("success");
	}
}
