package action;

import java.sql.*;
import java.util.LinkedList;

import javax.servlet.http.*;
import model.*;

import org.apache.struts.action.*;

import form.*;

public class ProvideDegreeDiscAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception {
		System.out.println("excuting provide degree disc action");
		ProvideDegreeDiscForm f = (ProvideDegreeDiscForm) form;
		System.out.println("form = " + f);
		System.out.println("discipline = " + f.getDiscipline());
		System.out.println("otherDiscipline = " + f.getOtherDiscipline());
		System.out.println("degreeMonth = " + f.getDegreeMonth());
		System.out.println("degreeYear = " + f.getDegreeYear());
		System.out.println("degreeGpa = " + f.getDegreeGpa());
		System.out.println("degreeTitle = " + f.getDegreeTitle());
		System.out.println("transcriptFile = " + f.getTranscriptFile());
		return mapping.findForward(Constants.FORWARD_SUCCESS);
	}
}
