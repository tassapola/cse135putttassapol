package action;

import javax.servlet.http.*;
import org.apache.struts.action.*;
import model.*;

import java.sql.*;
import java.util.LinkedList;

import form.AddReviewerForm;

public class ChairHomeAction extends Action 
{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception 
    {
		boolean isReviewStarted = false;
		
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		Statement stmt = con.createStatement();
		ResultSet users = stmt.executeQuery("SELECT id,user_name FROM user_roles WHERE role='reviewer'");
		LinkedList<String> l  = new LinkedList<String>();
		while(users.next()) {
			String user = users.getString("user_name");
			l.add(user);
		}
		stmt.close();
		request.setAttribute(Constants.LIST_REVIEWERS, l);
		
		if (!isReviewStarted)
			return mapping.findForward("case1");
		else
			return mapping.findForward("case2");
	}
}
