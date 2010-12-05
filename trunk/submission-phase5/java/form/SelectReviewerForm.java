package form;

import javax.servlet.http.*;
import org.apache.struts.action.*;

public class SelectReviewerForm extends ActionForm {

	private int reviewer = 0;
	private int applicant = 0;
	
	public int getReviewer() {
		return reviewer;
	}

	public void setReviewer(int id) {
		this.reviewer = id;
	}
	
	public int getApplicant() {
		return applicant;
	}

	public void setApplicant(int id) {
		this.applicant = id;
	}
	
	public ActionErrors validate(ActionMapping mappping,
								 HttpServletRequest request
								) 
	{
		ActionErrors errors = new ActionErrors();
		return errors;
	}
	
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		setReviewer(0);
		setApplicant(0);
	}
}
