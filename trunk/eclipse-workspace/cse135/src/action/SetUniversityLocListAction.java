package action;

import java.sql.*;
import java.util.Enumeration;
import java.util.LinkedList;

import javax.servlet.http.*;
import model.*;

import org.apache.struts.action.*;

public class SetUniversityLocListAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception {
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		con.setAutoCommit(false);
		Statement stmt = con.createStatement();
		ResultSet enumList = stmt.executeQuery("SELECT DISTINCT location FROM universities WHERE universities.id < 1837 ORDER BY location asc;");
		LinkedList<String> l = new LinkedList<String>();
		while(enumList.next()) {
			String state = enumList.getString("location");
			l.add(state);
		}
		request.setAttribute(Constants.LIST_UNIVERSITY_STATES, l);
		
		enumList = stmt.executeQuery("SELECT  * FROM countries ORDER BY name asc;");
		LinkedList<String> l2 = new LinkedList<String>();
		while(enumList.next()) {
			String country = enumList.getString("name");
			l2.add(country);
		}
		stmt.close();
		request.setAttribute(Constants.LIST_UNIVERSITY_COUNTRIES, l2);
		return mapping.findForward(Constants.FORWARD_SUCCESS);
	}
}
