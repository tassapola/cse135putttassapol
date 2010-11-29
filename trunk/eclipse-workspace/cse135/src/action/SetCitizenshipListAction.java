package action;

import java.sql.*;
import java.util.LinkedList;

import javax.servlet.http.*;
import model.*;

import org.apache.struts.action.*;

public class SetCitizenshipListAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception {
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		con.setAutoCommit(false);
		Statement stmt = con.createStatement();
		ResultSet countries = stmt.executeQuery("SELECT * FROM countries ORDER BY id asc;");
		LinkedList<String> l = new LinkedList<String>();
		while(countries.next()) {
			String country = countries.getString("name");
			l.add(country);
		}
		stmt.close();
		request.setAttribute(Constants.LIST_COUNTRIES, l);
		return mapping.findForward(Constants.FORWARD_SUCCESS);
	}
}
