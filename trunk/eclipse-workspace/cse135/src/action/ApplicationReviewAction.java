package action;

import javax.servlet.http.*;
import org.apache.struts.action.*;
import model.*;

import java.sql.*;
import java.util.ArrayList;

public class ApplicationReviewAction extends Action 
{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception 
    {
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		Statement stmt = con.createStatement();
		PreparedStatement reviews = con.prepareStatement("" +
				"SELECT r.user_name, re.grade, re.comments " +
				"FROM review_result AS re, user_roles AS r " +
				"WHERE re.applicant=? " +
				"AND re.reviewer=r.id " +
				"AND re.grade IS NOT NULL");
		
		int applicantId = Integer.parseInt(request.getParameter("applicant"));
		
		reviews.setInt(1, applicantId);
		
		ResultSet re = reviews.executeQuery();
		
		ArrayList<String> r = new ArrayList<String>();
		ArrayList<Double> g = new ArrayList<Double>();
		ArrayList<String> c = new ArrayList<String>();
		while(re.next())
		{
			r.add(re.getString(1));
			g.add(re.getDouble(2));
			c.add(re.getString(3));
		}
		
		request.setAttribute("reviewers", r);
		request.setAttribute("grade", g);
		request.setAttribute("comment", c);
		
		request.setAttribute("reviewer", request.getParameter("reviewer"));
		request.setAttribute("applicant", request.getParameter("applicant"));
		
		return mapping.findForward(Constants.FORWARD_SUCCESS);
	}
}

