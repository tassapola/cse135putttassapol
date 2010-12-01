package action;

import javax.servlet.http.*;
import model.*;

import org.apache.struts.action.*;

import form.NameForm;
import form.ResidencyForm;
import form.SpecializationForm;
import form.VerificationForm;

public class VerificationAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception {
		VerificationForm f = (VerificationForm) form;
		//System.out.println("submit = " + f.getSubmit());
		if (f.getSubmit().equals("Submit Application"))
			return mapping.findForward(Constants.FORWARD_SUBMIT_APP);
		else
			return mapping.findForward(Constants.FORWARD_CANCEL);
		
	}
}
