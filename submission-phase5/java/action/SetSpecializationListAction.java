package action;

import java.sql.*;
import java.util.LinkedList;

import javax.servlet.http.*;
import model.*;

import org.apache.struts.action.*;

public class SetSpecializationListAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception {
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		con.setAutoCommit(false);
		Statement stmt = con.createStatement();
		ResultSet specializations = stmt.executeQuery("SELECT name FROM specializations ORDER BY name asc;");
		LinkedList<String> l = new LinkedList<String>();
		while(specializations.next()) {
			String spec = specializations.getString("name");
			l.add(spec);
		}
		stmt.close();
		request.setAttribute(Constants.LIST_SPECIALIZATIONS, l);
		return mapping.findForward(Constants.FORWARD_SUCCESS);
	}
}
