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

import form.StatusUpdateForm;

public class ChangeStatusAction extends Action 
{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception 
    {
		StatusUpdateForm statusForm = (StatusUpdateForm)form;
		
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		con.setAutoCommit(false);
		PreparedStatement stmt = con.prepareStatement("");
		
		String status = statusForm.getStatus();
		
		if(status.equalsIgnoreCase("admit")) status = "admitted";
		else if(status.equalsIgnoreCase("reject")) status = "rejected";
		else status = "pending";
		
		stmt = con.prepareStatement("UPDATE applicant SET status=? WHERE id=?");
        stmt.setString(1, status);
        stmt.setInt(2, statusForm.getId());
        stmt.execute();
        
        con.commit();
		stmt.close();
		con.close();
		
		return mapping.findForward("success");
	}
}
