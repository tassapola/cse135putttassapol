package action;

import javax.servlet.http.*;
import model.*;

import org.apache.struts.action.*;

import form.NameForm;
import form.ResidencyForm;
import form.SpecializationForm;

public class SpecializationAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception {
		SpecializationForm f = (SpecializationForm) form;
		Applicant a = (Applicant) request.getSession().getAttribute(Constants.ATTR_NAME_APPLICANT);
		if (a == null) {
			a = new Applicant();
		}
		a.setSpecialization(f.getSpecialization());
		//System.out.println("specialization = " + f.getSpecialization());
		request.getSession().setAttribute(Constants.ATTR_NAME_APPLICANT, a);
		
		return mapping.findForward(Constants.FORWARD_SUCCESS);
	}
}
