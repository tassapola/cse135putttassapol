package action;

import javax.servlet.http.*;
import org.apache.struts.action.*;


public class NameAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) {
		return mapping.findForward("success");
	}
}
