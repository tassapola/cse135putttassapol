package model;

import form.*;

public class Applicant {
	private String firstName;
	private String lastName;
	private String middleName;
	private String citizenship;
	private String residence; 
	private boolean isUsResidence; //true if residence=="United States" (for ease of use)
	private String street;
	private String city;
	private String state;
	private String zipcode;
	private String countrycode;
	private String areacode;
	private String telephone;
	
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
		//System.out.println("setting citizenship = " + citizenship);
	}

	
	public String getResidence() {
		return residence;
	}

	public void setResidence(String residence) {
		this.residence = residence;
		//System.out.println("setting residence = " + residence);
	}

	
	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getCountrycode() {
		return countrycode;
	}

	public void setCountrycode(String countrycode) {
		this.countrycode = countrycode;
	}

	public String getAreacode() {
		return areacode;
	}

	public void setAreacode(String areacode) {
		this.areacode = areacode;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public boolean getIsUsResidence() {
		return isUsResidence;
	}

	public void setIsUsResidence(boolean isUsResidence) {
		this.isUsResidence = isUsResidence;
	}

	public void setNames(NameForm f) {
		firstName = f.getFirstName();
		lastName = f.getLastName();
		middleName = f.getMiddleName();
		//System.out.println("set firstName = " + firstName);
	}

	public void setAddress(AddressForm form) {
		street = form.getStreet();
		city = form.getCity();
		state = form.getState();
		zipcode = form.getZipcode();
		countrycode = form.getCountrycode();
		areacode = form.getAreacode();
		telephone = form.getTelephone();
		if (form.getIsUsResidence().equals("true")) {
			setIsUsResidence(true);
		} else {
			setIsUsResidence(false);
		}
		//System.out.println("set street = " + street);
	}
}
