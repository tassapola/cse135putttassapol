package action;

import java.sql.*;
import java.util.LinkedList;

import javax.servlet.http.*;
import model.*;

import org.apache.struts.action.*;

import form.NameForm;
import form.*;
import form.ResidencyForm;

public class ProvideDegreeUniAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception {
		
		request.getSession().setAttribute(Constants.SESS_UNIVERSITY, ((ProvideDegreeUniForm) form).getUniversity());
		//System.out.println("setting university = " + ((ProvideDegreeUniForm) form).getUniversity());
		return mapping.findForward(Constants.FORWARD_SUCCESS);
	}
}
