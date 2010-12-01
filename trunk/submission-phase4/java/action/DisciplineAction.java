package action;

import javax.servlet.http.*;
import org.apache.struts.action.*;
import model.*;

import java.sql.*;
import java.util.ArrayList;

public class DisciplineAction extends Action 
{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception 
    {
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		Statement stmt = con.createStatement();
		
		ResultSet disciplines = stmt.executeQuery("" +
				"SELECT di.name AS name, COUNT(DISTINCT a.id) AS count " +
				"FROM applicant a, degree_holder dh, degree de, disciplines di " +
				"WHERE dh.applicant = a.id " +
				"AND dh.degree = de.id " +
				"AND de.discipline = di.id " +
				"GROUP BY di.name"); 
		
		ArrayList<String> d = new ArrayList<String>();
		ArrayList<Integer> c = new ArrayList<Integer>();
		while(disciplines.next())
		{
			d.add(disciplines.getString(1));
			c.add(disciplines.getInt(2));
		}
		
		request.setAttribute("discipline", d);
		request.setAttribute("count", c);
				
		return mapping.findForward(Constants.FORWARD_SUCCESS);
	}
}

