package form;

import javax.servlet.http.*;
import org.apache.struts.action.*;

public class ProvideDegreeUniForm extends ActionForm {

	private String university;

	public String getUniversity() {
		return university;
	}

	public void setUniversity(String university) {
		this.university = university;
	}
	
}
