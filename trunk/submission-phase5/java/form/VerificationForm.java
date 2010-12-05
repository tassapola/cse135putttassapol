package form;

import javax.servlet.http.*;
import org.apache.struts.action.*;

public class VerificationForm extends ActionForm {

	private String submit;


	public String getSubmit() {
		return submit;
	}

	public void setSubmit(String submit) {
		this.submit = submit;
	}
	
}
