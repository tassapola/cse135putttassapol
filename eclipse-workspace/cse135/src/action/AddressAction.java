package action;

import javax.servlet.http.*;
import model.*;

import org.apache.struts.action.*;

import form.*;

public class AddressAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception {
		Applicant a = (Applicant) request.getSession().getAttribute(Constants.ATTR_NAME_APPLICANT);
		if (a == null) {
			a = new Applicant();
		}
		a.setAddress((AddressForm) form);
		request.getSession().setAttribute(Constants.ATTR_NAME_APPLICANT, a);
		if (a.getResidence().equals("United States")) {
			return mapping.findForward(Constants.FORWARD_ADDRESS_US);
		} else {
			return mapping.findForward(Constants.FORWARD_ADDRESS_NON_US);
		}
	}
}
