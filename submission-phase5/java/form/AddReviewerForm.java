package form;

import javax.servlet.http.*;
import org.apache.struts.action.*;

public class AddReviewerForm extends ActionForm {

	private String username = null;
	private String password = null;
		
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public ActionErrors validate(ActionMapping mappping,
								 HttpServletRequest request
								) 
	{
		ActionErrors errors = new ActionErrors();
		if (username.equals("")) 
			errors.add("username", new ActionMessage("error.username.required"));
		
		if (password.equals(""))
			errors.add("password", new ActionMessage("error.password.required"));
		
		return errors;
	}
	
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		setUsername(null);
		setPassword(null);
	}
}
