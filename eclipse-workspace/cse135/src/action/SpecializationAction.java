package action;

import javax.servlet.http.*;
import org.apache.struts.action.*;
import model.*;

import java.sql.*;
import java.util.ArrayList;

public class SpecializationAction extends Action 
{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception 
    {
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		Statement stmt = con.createStatement();
		
		ResultSet sp = stmt.executeQuery("" +
				"SELECT s.name AS name, " + 
				"COUNT(DISTINCT a.id) AS count FROM applicant a, specializations s " + 
				"WHERE a.specialization = s.id " +
				"GROUP BY s.name"); 
		
		ArrayList<String> s = new ArrayList<String>();
		ArrayList<Integer> c = new ArrayList<Integer>();
		while(sp.next())
		{
			s.add(sp.getString(1));
			c.add(sp.getInt(2));
		}
		
		request.setAttribute("specialization", s);
		request.setAttribute("count", c);
				
		return mapping.findForward(Constants.FORWARD_SUCCESS);
	}
}

