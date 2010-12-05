package form;

import javax.servlet.http.*;
import org.apache.struts.action.*;

public class ReviewForm extends ActionForm {

	private int reviewer = 0;
	private int applicant = 0;
	private int grade = 0;
	private String comment = null;
		
	public int getReviewer() {
		return reviewer;
	}

	public void setReviewer(int id) {
		this.reviewer = id;
	}
	
	public int getApplicant() {
		return applicant;
	}

	public void setApplicant(int id) {
		this.applicant = id;
	}
	
	
	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public ActionErrors validate(ActionMapping mappping,
								 HttpServletRequest request
								) 
	{
		ActionErrors errors = new ActionErrors();
		if(grade == 0)
			errors.add("grade", new ActionMessage("error.grade.required"));
		else if (grade > 4 || grade < 1)
			errors.add("grade", new ActionMessage("error.grade.required"));
		return errors;
	}
	
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		setGrade(0);
		setApplicant(0);
		setReviewer(0);
		setComment(null);
	}
}
