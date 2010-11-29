package form;

import javax.servlet.http.*;
import org.apache.struts.action.*;

public class NameForm extends ActionForm {

	private String firstName = null;
	private String lastName = null;
	private String middleName = null;
		
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public ActionErrors validate(ActionMapping mappping,
								 HttpServletRequest request
								) 
	{
		ActionErrors errors = new ActionErrors();
		if (firstName.equals("")) 
			errors.add("firstName", new ActionMessage("error.firstname.required"));
		else if (firstName.matches(".*\\d.*"))
			errors.add("firstname", new ActionMessage("error.firstname.invalid"));
		
		if (lastName.equals(""))
			errors.add("lastName", new ActionMessage("error.lastname.required"));
		else if (lastName.matches(".*\\d.*")) 
			errors.add("lastName", new ActionMessage("error.lastname.invalid"));
		
		return errors;
	}
	
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		setFirstName(null);
		setLastName(null);
		setMiddleName(null);
	}
}
