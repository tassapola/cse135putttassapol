package action;

import javax.servlet.http.*;
import org.apache.struts.action.*;
import model.*;

import java.sql.*;
import java.util.ArrayList;;

public class ReviewersAction extends Action 
{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception 
    {
		boolean isReviewStarted = false;
		
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		Statement stmt = con.createStatement();
		ResultSet count = stmt.executeQuery("SELECT COUNT(*) FROM applicant WHERE status IS NOT NULL");
		count.next();
		isReviewStarted = (count.getInt(1) > 0);
		count.close();
		
		ResultSet users = stmt.executeQuery("SELECT id,user_name FROM user_roles WHERE role='reviewer'");
		PreparedStatement countReviewed = con.prepareStatement("SELECT COUNT(*) FROM review_result WHERE reviewer=? AND grade IS NOT NULL");
		PreparedStatement countNotReviewed = con.prepareStatement("SELECT COUNT(*) FROM review_result WHERE reviewer=? AND grade IS NULL");
		ArrayList<String> reviewers  = new ArrayList<String>();
		ArrayList<Integer> reviewedCount  = new ArrayList<Integer>();
		ArrayList<Integer> notReviewerCount  = new ArrayList<Integer>();
		while(users.next()) {
			countReviewed.setInt(1, users.getInt("id"));
			ResultSet reviewed = countReviewed.executeQuery();
			reviewed.next();
			countNotReviewed.setInt(1, users.getInt("id"));
			ResultSet notReviewed = countNotReviewed.executeQuery();
			notReviewed.next();
			
			reviewers.add(users.getString("user_name"));
			reviewedCount.add(reviewed.getInt(1));
			notReviewerCount.add(notReviewed.getInt(1));
			
			reviewed.close();
			notReviewed.close();
		}
		stmt.close();
		request.setAttribute(Constants.LIST_REVIEWERS, reviewers);
		request.setAttribute(Constants.LIST_REVIEWERS_REVIEW, reviewedCount);
		request.setAttribute(Constants.LIST_REVIEWERS_NOT_REVIEW, notReviewerCount);
		
		return mapping.findForward(Constants.FORWARD_SUCCESS);
	}
}
