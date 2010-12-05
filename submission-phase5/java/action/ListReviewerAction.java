package action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.*;
import model.*;

import org.apache.struts.action.*;

public class ListReviewerAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception {
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		con.setAutoCommit(false);
		PreparedStatement stmt = con.prepareStatement("" +
				"SELECT id, user_name " +
				"FROM user_roles " +
				"WHERE role='reviewer' " +
				"AND id NOT IN (" +
				"SELECT reviewer FROM review_result WHERE applicant=?" +
				")");
		
		stmt.setInt(1, (Integer)request.getAttribute("applicant"));
		ResultSet r = stmt.executeQuery();
		
		
		ArrayList<String> u = new ArrayList<String>();
		ArrayList<Integer> id = new ArrayList<Integer>();
		
		while(r.next())
		{
			id.add(r.getInt(1));
			u.add(r.getString(2));
		}
		
		request.setAttribute("reviewers", u);
		request.setAttribute("id", id);
		
		return mapping.findForward("success");
	}
}
