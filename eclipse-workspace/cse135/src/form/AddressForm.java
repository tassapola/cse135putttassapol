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
		//TODO: us and non-us
		if (street.equals("")) 
			errors.add("street", new ActionMessage("error.street.required"));
		if (city.equals("")) 
			errors.add("city", new ActionMessage("error.city.required"));
		//US
		//state and zip code
		if (state.equals("")) 
			errors.add("state", new ActionMessage("error.state.required"));
		if (zipcode.equals("")) 
			errors.add("zipcode", new ActionMessage("error.zipcode.required"));
		else
			if (!(zipcode.matches("[0-9\\-\\s]*")))
				errors.add("zipcode", new ActionMessage("error.zipcode.invalid"));
		//non-US
		//country code
		if (areacode.equals("")) 
			errors.add("arecode", new ActionMessage("error.areacode.required"));
		else
			if (!(areacode.matches("[0-9\\-\\s]*")))
				errors.add("areacode", new ActionMessage("error.areacode.invalid"));
		if (telephone.equals("")) 
			errors.add("telephone", new ActionMessage("error.telephone.required"));
		else
			if (!(telephone.matches("[0-9\\-\\s]*")))
				errors.add("telephone", new ActionMessage("error.telephone.invalid"));
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
