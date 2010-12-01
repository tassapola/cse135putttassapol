package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import form.*;

public class Applicant {
	private String firstName;
	private String lastName;
	private String middleName;
	private String citizenship;
	private String residence; 
	private boolean isUsResidence; //true if residence=="United States" (for ease of use)
	private String residency;
	private String street;
	private String city;
	private String state;
	private String zipcode;
	private String countrycode;
	private String areacode;
	private String telephone;
	Vector<Degree> degreeVector;
	private String specialization;
	private String status;
	
	public Applicant() {
		degreeVector = new Vector<Degree>();
	}
	
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

	
	public String getResidency() {
		return residency;
	}

	public void setResidency(String residency) {
		this.residency = residency;
		//System.out.println("setting residency = " + residency);
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
	
	public void addDegree(Degree d) {
		degreeVector.add(d);
	}

	public Vector<Degree> getDegreeVector() {
		return degreeVector;
	}

	public String getSpecialization() {
		return specialization;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	private void processApplicantResultSet(Connection con, ResultSet app) throws Exception {
		if (app.next()) {
			int id = app.getInt("id");
			firstName = app.getString("first_name");
			lastName = app.getString("last_name");
			middleName = app.getString("middle_name");
			status = app.getString("status");
			
			Statement stmt2;
			ResultSet r;
			Statement stmt3;
			ResultSet r3;
			stmt2 = con.createStatement();
			r = stmt2.executeQuery("select * from countries where id = " + app.getInt("citizenship"));
			r.next();
			citizenship = r.getString("name");
			stmt2.close();
			
			stmt2 = con.createStatement();
			r = stmt2.executeQuery("select * from countries where id = " + app.getInt("residence"));
			r.next();
			residence = r.getString("name");
			isUsResidence = residence.equals("United States");
			boolean residencyDb = app.getBoolean("residency");
			if (residencyDb)
				residency = "US Permanent Resident";
			else
				residency = "Non-Resident";
			stmt2.close();
			
			
			stmt2 = con.createStatement();
			r = stmt2.executeQuery("select * from specializations where id = " + app.getInt("specialization"));
			r.next();
			specialization = r.getString("name");
			stmt2.close();
			
			stmt2 = con.createStatement();
			r = stmt2.executeQuery("select * from address where id = " + app.getInt("address"));
			r.next();
			street = r.getString("street_address");
			city = r.getString("city");
			zipcode = r.getString("zip_code");
			areacode = r.getString("area_code");
			telephone = r.getString("tel_number");
			state = r.getString("state");
			countrycode = r.getString("country_code");
			
			stmt2.close();
			
			stmt2 = con.createStatement();
			r = stmt2.executeQuery("select * from degree_holder h, degree d where h.applicant = "
					+ id + "and h.degree = d.id");
			while (r.next()) {
				Degree d = new Degree();
				stmt3 = con.createStatement();
				r3 = stmt3.executeQuery("select * from universities where id = " + r.getInt("university"));
				r3.next();
				d.setUniversity(r3.getString("name"));
				d.setLocation(r3.getString("location"));
				stmt3.close();
				
				stmt3 = con.createStatement();
				r3 = stmt3.executeQuery("select * from disciplines where id = " + r.getInt("discipline"));
				r3.next();
				//System.out.println(r3.getString("name"));
				d.setDiscipline(r3.getString("name"));
				stmt3.close();
				
				stmt3 = con.createStatement();
				r3 = stmt3.executeQuery("select * from transcript where id = " + r.getInt("transcript"));
				r3.next();
				d.setTranscriptFile(r3.getString("name"));
				stmt3.close();
				
				d.setDegreeTitle(r.getString("degree_title"));
				d.setDegreeGpa(r.getString("gpa"));
				Date degDate = r.getDate("degree_date");
				d.setDegreeMonth(Integer.toString(degDate.getMonth()+1));
				d.setDegreeYear(Integer.toString(degDate.getYear()+1900));
				degreeVector.add(d);
			}
			
			stmt2.close();
		}
	}
	
	public void load(Connection con, String username) throws Exception{
		Statement stmt = con.createStatement();
		ResultSet app = stmt.executeQuery("select a.* from applicant a, users u where a.user_id = u.id and u.user_name = '" + username + "'");
		processApplicantResultSet(con, app);
		stmt.close();
	}
	
	public void load(Connection con, int id) throws Exception{
		Statement stmt = con.createStatement();
		ResultSet app = stmt.executeQuery("select * from applicant a where id = " + id);
		processApplicantResultSet(con, app);
		stmt.close();
	}
	
	public String toString() {
		String r = "";
		r += "\nfirstName = " + firstName;
		r += "\nlastName = " + lastName;
		r += "\nmiddleName = " + middleName;
		r += "\ncitizenship = " + citizenship;
		r += "\nresidence = " + residence;
		r += "\nresidency = " + residency;
		r += "\nstreet = " + street;
		r += "\ncity = " + city;
		r += "\nstate = " + state;
		r += "\nzipcode = " + zipcode;
		r += "\ncountrycode = " + countrycode;
		r += "\nareacode = " + areacode;
		r += "\ntelephone = " + telephone;
		r += "\nspecialization = " + specialization;
		r += "\nstatus = " + status;
		r += degreeVector;
		return r;
	}
}
