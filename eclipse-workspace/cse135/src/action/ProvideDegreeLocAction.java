package action;

import java.sql.*;
import java.util.LinkedList;

import javax.servlet.http.*;
import model.*;

import org.apache.struts.action.*;

import form.NameForm;
import form.ProvideDegreeLocForm;
import form.ResidencyForm;

public class ProvideDegreeLocAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception {
		//System.out.println("form = " + form);
		//System.out.println("location = " + ((ProvideDegreeLocForm) form).getLocation());
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		con.setAutoCommit(false);
		PreparedStatement stmt = con.prepareStatement("SELECT name FROM universities WHERE universities.location = ?  ORDER BY name asc;");
		stmt.setString(1, request.getParameter(Constants.PARAM_UNI_LOCATION));
		ResultSet universities = stmt.executeQuery();
		LinkedList<String> l = new LinkedList<String>();
		while(universities.next()) {
			String university = universities.getString("name");
			l.add(university);
		}
		stmt.close();
		request.setAttribute(Constants.LIST_UNIVERSITIES, l);
		request.getSession().setAttribute(Constants.SESS_UNI_LOCATION, ((ProvideDegreeLocForm) form).getLocation());
		//System.out.println("list universities size = " + l.size());
		//null
		//System.out.println("request: param val = " + request.getParameter(Constants.PARAM_UNIVERSITY));
		
		//has value
		//System.out.println("form: val = " + ((ProvideDegreeLocForm) form).getLocation());
		return mapping.findForward(Constants.FORWARD_SUCCESS);
	}
}
