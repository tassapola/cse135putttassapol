package action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

import javax.servlet.http.*;
import org.apache.struts.action.*;
import model.*;

import form.ReviewForm;

public class CommitReviewAction extends Action 
{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception 
    {
		ReviewForm review = (ReviewForm)form;
		
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		con.setAutoCommit(false);
		PreparedStatement stmt = con.prepareStatement("" +
				"UPDATE review_result " +
				"SET grade=?, comments=? " +
				"WHERE reviewer=? " +
				"AND applicant=?");
		
		stmt.setInt(1, review.getGrade());
		stmt.setString(2, review.getComment());
		stmt.setInt(3, review.getReviewer());
		stmt.setInt(4, review.getApplicant());
        
		stmt.execute();
		
        con.commit();
        
        stmt = con.prepareStatement("" +
        		"SELECT COUNT(*) " +
        		"FROM review_result " +
        		"WHERE applicant=? " +
        		"AND grade IS NOT NULL");
        
        stmt.setInt(1, review.getApplicant());
        
        ResultSet reviewerCount = stmt.executeQuery();
        reviewerCount.next();
        
        int count = reviewerCount.getInt(1);
        
		stmt.close();
		con.close();
		
		request.setAttribute("applicant", review.getApplicant());
		request.setAttribute("reviewer", review.getReviewer());
		
		if(count < 3)
			return mapping.findForward("assign");
		else
			return mapping.findForward("decision");
	}
}
