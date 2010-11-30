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

public class StartReviewAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception {
		
		boolean canReviewStart = false;
		
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		con.setAutoCommit(false);
		Statement stmt = con.createStatement();
		ResultSet count = stmt.executeQuery("SELECT COUNT(*) FROM user_roles WHERE role='reviewer'");
		count.next();
		canReviewStart = (count.getInt(1) >= 2);
		count.close();
		
		if(!canReviewStart)
			throw new Exception("Need at least 2 reviewers");
		
		stmt.execute("UPDATE applicant SET status='pending' WHERE status IS NULL");
		con.commit();
		
		ResultSet reviewers = stmt.executeQuery("SELECT id FROM user_roles WHERE role='reviewer'");
		ArrayList<Integer> reviewerIds = new ArrayList<Integer>();
		while(reviewers.next())
		{
			reviewerIds.add(reviewers.getInt(1));
		}
		reviewers.close();
		
		ResultSet applicants = stmt.executeQuery("SELECT id FROM applicant");
		PreparedStatement add = con.prepareStatement("INSERT INTO review_result (applicant, reviewer) VALUES(?,?)");
		int reviewer = 0;
		while(applicants.next())
		{
			add.setInt(1, applicants.getInt(1));
			add.setInt(2, reviewerIds.get(reviewer));
			add.execute();
			reviewer = (reviewer + 1) % reviewerIds.size();
		}
		applicants.close();
		con.commit();
		
		stmt.close();
		con.close();
		return mapping.findForward(Constants.FORWARD_SUCCESS);
	}
}
