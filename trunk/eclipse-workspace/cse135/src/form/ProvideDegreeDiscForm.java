package form;

import javax.servlet.http.*;

import org.apache.struts.action.*;

public class ProvideDegreeDiscForm extends ActionForm {

	private String discipline;
	private String otherDiscipline;
	private String degreeMonth;
	private String degreeYear;
	private String degreeGpa;
	private String degreeTitle;
	private String transcriptFile;
	
	
	
	public String getDiscipline() {
		return discipline;
	}



	public void setDiscipline(String discipline) {
		this.discipline = discipline;
	}



	public String getOtherDiscipline() {
		return otherDiscipline;
	}



	public void setOtherDiscipline(String otherDiscipline) {
		this.otherDiscipline = otherDiscipline;
	}



	public String getDegreeMonth() {
		return degreeMonth;
	}



	public void setDegreeMonth(String degreeMonth) {
		this.degreeMonth = degreeMonth;
	}



	public String getDegreeYear() {
		return degreeYear;
	}



	public void setDegreeYear(String degreeYear) {
		this.degreeYear = degreeYear;
	}



	public String getDegreeGpa() {
		return degreeGpa;
	}



	public void setDegreeGpa(String degreeGpa) {
		this.degreeGpa = degreeGpa;
	}



	public String getDegreeTitle() {
		return degreeTitle;
	}



	public void setDegreeTitle(String degreeTitle) {
		this.degreeTitle = degreeTitle;
	}



	public String getTranscriptFile() {
		return transcriptFile;
	}



	public void setTranscriptFile(String transcriptFile) {
		this.transcriptFile = transcriptFile;
	}



	public ActionErrors validate(ActionMapping mappping,
			 HttpServletRequest request
			) 
	{
		ActionErrors errors = new ActionErrors();
		//System.out.println("validation provide disc form");
		//cover many cases
		if (!degreeGpa.matches("\\d+[.]*\\d*")) {
			errors.add("gpa", new ActionMessage("error.gpa.invalid"));
			//System.out.println("adding gpa invalid");
		}
		return errors;
	}
	
}

