package action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.*;
import model.*;

import org.apache.struts.action.*;
import form.SelectReviewerForm;

public class AssignReviewerAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception {
		
		SelectReviewerForm f = (SelectReviewerForm)form;
		
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		con.setAutoCommit(false);
		Statement stmt = con.createStatement();
		
		PreparedStatement add = con.prepareStatement("INSERT INTO review_result (applicant, reviewer) VALUES(?,?)");
		add.setInt(1, f.getApplicant());
		add.setInt(2, f.getReviewer());
		add.execute();
		
		con.commit();
		
		stmt.close();
		con.close();
		return mapping.findForward(Constants.FORWARD_SUCCESS);
	}
}
