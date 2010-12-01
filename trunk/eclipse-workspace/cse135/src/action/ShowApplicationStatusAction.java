package action;

import javax.servlet.http.*;
import model.*;

import org.apache.struts.action.*;

import form.NameForm;

public class ShowApplicationStatusAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception {
		
		return mapping.findForward(Constants.FORWARD_SUCCESS);
	}
}
