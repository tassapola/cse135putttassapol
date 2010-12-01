package form;

import javax.servlet.http.*;
import org.apache.struts.action.*;

public class ProvideDegreeLocForm extends ActionForm {

	private String location;

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
}
