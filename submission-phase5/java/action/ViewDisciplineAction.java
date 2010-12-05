package action;

import javax.servlet.http.*;
import org.apache.struts.action.*;
import model.*;

import java.sql.*;
import java.util.ArrayList;

public class ViewDisciplineAction extends Action 
{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception 
    {
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		Statement stmt = con.createStatement();
		PreparedStatement applications;
		
		String discipline = (String)request.getParameter("discipline");
		
		applications = con.prepareStatement("" +
				"SELECT a.first_name, a.last_name, a.middle_name,AVG(r.grade), a.status, a.id " +
				"FROM disciplines as d, review_result as r, applicant as a, degree as deg, degree_holder as h " +
				"WHERE d.name=? " +
				"AND deg.discipline = d.id " +
				"AND h.degree = deg.id " +
				"AND h.applicant = a.id " +
				"AND a.id=r.applicant " +
				"GROUP BY a.first_name, a.last_name, a.middle_name,a.status, a.id " +
				"ORDER BY a.id");
		
		applications.setString(1, discipline);
		
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
		
		return mapping.findForward(Constants.FORWARD_SUCCESS);
	}
}

