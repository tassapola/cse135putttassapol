package form;

import javax.servlet.http.*;
import org.apache.struts.action.*;

public class RemoveReviewerForm extends ActionForm {

	private String username = null;
		
	public String getId() {
		return username;
	}

	public void setId(String username) {
		this.username = username;
	}

	public ActionErrors validate(ActionMapping mappping,
								 HttpServletRequest request
								) 
	{
		ActionErrors errors = new ActionErrors();
		return errors;
	}
	
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		setId(null);
	}
}