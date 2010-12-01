package action;

import java.sql.*;
import java.util.LinkedList;

import javax.servlet.http.*;
import model.*;

import org.apache.struts.action.*;

import form.*;

public class ProvideDegreeUniAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception {
		
		String university = ((ProvideDegreeUniForm) form).getUniversity();
		request.getSession().setAttribute(Constants.SESS_UNIVERSITY, university);
		//System.out.println("setting university = " + ((ProvideDegreeUniForm) form).getUniversity());
		

		return mapping.findForward(Constants.FORWARD_SUCCESS);
	}
}
