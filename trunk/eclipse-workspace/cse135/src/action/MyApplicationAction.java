package action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

import javax.servlet.http.*;
import model.*;

import org.apache.struts.action.*;

import form.NameForm;

public class MyApplicationAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception {
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		con.setAutoCommit(false);
		Statement stmt = con.createStatement();
		ResultSet app = stmt.executeQuery("select a.* from applicant a, users u where a.user_id = u.id and u.user_name = '" + request.getRemoteUser() + "'");
		
		if (app.next()) {
			stmt.close();
			Applicant a = new Applicant();
			a.load(con, request.getRemoteUser());
			request.setAttribute(Constants.MY_APP, a);
			return mapping.findForward(Constants.FORWARD_MY_APP_SUBMITTED);
		}
		else {
			stmt.close();
			return mapping.findForward(Constants.FORWARD_MY_APP_NOT_SUBMITTED);
		}
					
	}
}
