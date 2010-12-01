package action;

import javax.servlet.http.*;
import org.apache.struts.action.*;
import model.*;

import java.sql.*;
import java.util.ArrayList;

public class ReviewerHomeAction extends Action 
{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception 
    {
		int reviewer = 8;
		
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		
		PreparedStatement applications = con.prepareStatement("" +
				"SELECT a.first_name, a.last_name, a.middle_name, re.grade, a.status, a.id " +
				"FROM applicant AS a, user_roles AS r, review_result as re " +
				"WHERE r.id=? " +
				"AND re.reviewer=r.id " +
				"AND re.applicant=a.id " +
				"AND re.grade IS NULL");
		
		applications.setInt(1, reviewer);
		
		ResultSet a = applications.executeQuery();
		
		ArrayList<String> f = new ArrayList<String>();
		ArrayList<String> l = new ArrayList<String>();
		ArrayList<String> m = new ArrayList<String>();
		ArrayList<Double> g = new ArrayList<Double>();
		ArrayList<String> s = new ArrayList<String>();
		ArrayList<Integer> id = new ArrayList<Integer>();
		while(a.next())
		{
			f.add(a.getString(1));
			l.add(a.getString(2));
			m.add(a.getString(3));
			g.add(a.getDouble(4));
			s.add(a.getString(5));
			id.add(a.getInt(6));
		}
		
		request.setAttribute("firstname", f);
		request.setAttribute("lastname", l);
		request.setAttribute("middlename", m);
		request.setAttribute("grade", g);
		request.setAttribute("status", s);
		request.setAttribute("id", id);
		
		request.setAttribute("reviewer", reviewer);
		
		return mapping.findForward(Constants.FORWARD_SUCCESS);
	}
}
