package model;

public class Degree {
	private String location;
	private String university;
	//<%= (degree.get("discipline").equals("other"))? "-" + degree.get("other_discipline"):"" %> <br/>
	private String discipline;
	private String otherDiscipline;
	private String degreeTitle;
	private String degreeMonth;
	private String degreeYear;
	private String degreeGpa;
	private String transcriptFile;
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getUniversity() {
		return university;
	}
	public void setUniversity(String university) {
		this.university = university;
	}
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
	public String getDegreeTitle() {
		return degreeTitle;
	}
	public void setDegreeTitle(String degreeTitle) {
		this.degreeTitle = degreeTitle;
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
	public String getTranscriptFile() {
		return transcriptFile;
	}
	public void setTranscriptFile(String transcriptFile) {
		this.transcriptFile = transcriptFile;
	}
	
	public String toString() {
		String r = "\ndegree\n";
		r += "\nuniversity = " + university;
		r += "\ndiscipline = " + discipline;
		r += "\notherDiscipline = " + otherDiscipline;
		r += "\ndegreeTitle = " + degreeTitle;
		r += "\ndegreeMonth = " + degreeMonth;
		r += "\ndegreeYear = " + degreeYear;
		r += "\ndegreeGpa = " + degreeGpa;
		r += "\ntranscriptFile = " + transcriptFile;
		return r;
	}
}
