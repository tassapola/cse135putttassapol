package form;

import javax.servlet.http.*;
import org.apache.struts.action.*;

public class RemoveReviewerForm extends ActionForm {

	private String username = null;
		
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
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
		setUsername(null);
	}
}
