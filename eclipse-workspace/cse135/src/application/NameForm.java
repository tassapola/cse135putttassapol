package application;

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
								) {
		ActionErrors errors = new ActionErrors();
		//System.out.println("validating");
		//System.out.println(firstName + " " + lastName);
		if (firstName.equals("") || lastName.equals("")) {
			errors.add("err1", new ActionMessage("errors.required", "first name/last name"));
			//System.out.println("adding error");
		}
		//TODO: Check for digits
		return errors;
	}
	
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		setFirstName(null);
		setLastName(null);
		setMiddleName(null);
	}
}
