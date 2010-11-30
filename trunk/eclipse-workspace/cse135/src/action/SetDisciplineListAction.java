package action;

import java.sql.*;
import java.util.LinkedList;

import javax.servlet.http.*;
import model.*;

import org.apache.struts.action.*;

public class SetDisciplineListAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception {

		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		con.setAutoCommit(false);
		PreparedStatement stmt = con.prepareStatement("SELECT name FROM disciplines WHERE id <= 4 ORDER BY name asc;");
		
		ResultSet disciplines = stmt.executeQuery();
		LinkedList<String> l = new LinkedList<String>();
		while(disciplines.next()) {
			String discipline = disciplines.getString("name");
			l.add(discipline);
		}
		stmt.close();
		//System.out.println("disciplines list size = " + l.size());
		request.setAttribute(Constants.LIST_DISCIPLINES, l);
		return mapping.findForward(Constants.FORWARD_SUCCESS);
	}
}
