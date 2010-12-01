package form;

import javax.servlet.http.*;
import org.apache.struts.action.*;

public class ResidencyForm extends ActionForm {

	private String residency = null;

	public String getResidency() {
		return residency;
	}

	public void setResidency(String residency) {
		this.residency = residency;
	}
	
	
}
