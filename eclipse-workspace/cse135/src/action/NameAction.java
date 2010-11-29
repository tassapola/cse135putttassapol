package action;

import javax.servlet.http.*;
import model.*;

import org.apache.struts.action.*;

import form.NameForm;

public class NameAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) {
		Applicant a = (Applicant) request.getSession().getAttribute(Constants.ATTR_NAME_APPLICANT);
		if (a == null) {
			a = new Applicant();
		}
		a.setNames((NameForm) form);
		request.getSession().setAttribute(Constants.ATTR_NAME_APPLICANT, a);
		return mapping.findForward(Constants.FORWARD_SUCCESS);
	}
}
