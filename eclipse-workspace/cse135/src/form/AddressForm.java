package form;

import javax.servlet.http.*;
import org.apache.struts.action.*;

public class AddressForm extends ActionForm {

	private String street;
	private String city;
	private String state;
	private String zipcode;
	private String countrycode;
	private String areacode;
	private String telephone;
		
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

	public ActionErrors validate(ActionMapping mappping,
								 HttpServletRequest request
								) 
	{
		ActionErrors errors = new ActionErrors();
		/*
		if (firstName.equals("")) 
			errors.add("firstName", new ActionMessage("error.firstname.required"));
		else if (firstName.matches(".*\\d.*"))
			errors.add("firstname", new ActionMessage("error.firstname.invalid"));
		
		if (lastName.equals(""))
			errors.add("lastName", new ActionMessage("error.lastname.required"));
		else if (lastName.matches(".*\\d.*")) 
			errors.add("lastName", new ActionMessage("error.lastname.invalid"));
		*/
		return errors;
	}
	
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		setStreet(null);
		setCity(null);
		setState(null);
		setZipcode(null);
		setCountrycode(null);
		setAreacode(null);
		setTelephone(null);
	}
}
