package action;

import javax.servlet.http.*;
import model.*;

import org.apache.struts.action.*;

import form.MergeDegreeForm;
import form.NameForm;
import form.ProvideDegreeDiscForm;

public class MergeDegreeAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception {
		Degree degree = new Degree();
		
		degree.setLocation((String) request.getSession().getAttribute(Constants.SESS_UNI_LOCATION));
		degree.setUniversity((String) request.getSession().getAttribute(Constants.SESS_UNIVERSITY));
		degree.setDiscipline((String) request.getSession().getAttribute(Constants.SESS_DISCIPLINE));
		degree.setOtherDiscipline((String) request.getSession().getAttribute(Constants.SESS_OTHER_DISCIPLINE));
	    degree.setDegreeMonth((String) request.getSession().getAttribute(Constants.SESS_DEG_MONTH));
	    degree.setDegreeYear((String) request.getSession().getAttribute(Constants.SESS_DEG_YEAR));
	    degree.setDegreeGpa((String) request.getSession().getAttribute(Constants.SESS_DEG_GPA));
	    degree.setDegreeTitle((String) request.getSession().getAttribute(Constants.SESS_DEG_TITLE));
	    degree.setTranscriptFile((String) request.getSession().getAttribute(Constants.SESS_DEG_TRANSCRIPT));
	    
	    Applicant a = (Applicant) request.getSession().getAttribute(Constants.ATTR_NAME_APPLICANT);
	    a.addDegree(degree);
	    MergeDegreeForm f = (MergeDegreeForm) form;
	    //System.out.println("form submit = " + f.getSubmit());
	    if (f.getSubmit().equals("Submit Next Degree"))
	    	return mapping.findForward(Constants.FORWARD_MORE_DEGREE_YES);
	    else 
	    	return mapping.findForward(Constants.FORWARD_MORE_DEGREE_NO);
	}
}
