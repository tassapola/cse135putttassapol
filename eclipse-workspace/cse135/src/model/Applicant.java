package model;

import form.NameForm;

public class Applicant {
	private String firstName;
	private String lastName;
	private String middleName;
	
	public void setNames(NameForm f) {
		firstName = f.getFirstName();
		lastName = f.getLastName();
		middleName = f.getLastName();
		//System.out.println("set firstName = " + firstName);
	}
}
