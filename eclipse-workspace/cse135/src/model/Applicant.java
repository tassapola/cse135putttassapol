package model;

import form.NameForm;

public class Applicant {
	private String firstName;
	private String lastName;
	private String middleName;
	private String citizenship;
	
	
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

	
	public String getCitizenship() {
		return citizenship;
	}

	public void setCitizenship(String citizenship) {
		this.citizenship = citizenship;
		System.out.println("setting citizenship = " + citizenship);
	}

	public void setNames(NameForm f) {
		firstName = f.getFirstName();
		lastName = f.getLastName();
		middleName = f.getMiddleName();
		//System.out.println("set firstName = " + firstName);
	}
}
