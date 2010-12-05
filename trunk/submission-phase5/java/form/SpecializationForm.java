package form;

import javax.servlet.http.*;
import org.apache.struts.action.*;

public class SpecializationForm extends ActionForm {

	private String specialization;

	public String getSpecialization() {
		return specialization;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}

}
