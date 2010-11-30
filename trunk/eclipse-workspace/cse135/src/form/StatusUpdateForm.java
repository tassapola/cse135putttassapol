package form;

import javax.servlet.http.*;
import org.apache.struts.action.*;

public class StatusUpdateForm extends ActionForm {

	private int id = 0;
	private String status = null;
		
	public int getId() {
		return id;
	}
	
	public String getStatus() {
		return status;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public ActionErrors validate(ActionMapping mappping,
								 HttpServletRequest request
								) 
	{
		ActionErrors errors = new ActionErrors();
		return errors;
	}
	
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		setId(0);
		setStatus(null);
	}
}
