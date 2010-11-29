package action;

import javax.servlet.http.*;
import model.*;

import org.apache.struts.action.*;

import form.NameForm;

public class CitizenshipAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception {
		Applicant a = (Applicant) request.getSession().getAttribute(Constants.ATTR_NAME_APPLICANT);
		if (a == null) {
			a = new Applicant();
		}
		a.setCitizenship(request.getParameter("citizenship"));
		return mapping.findForward(Constants.FORWARD_SUCCESS);
	}
}
