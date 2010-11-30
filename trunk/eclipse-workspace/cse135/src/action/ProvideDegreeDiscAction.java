package action;

import java.sql.*;
import java.util.*;

import javax.servlet.http.*;
import model.*;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.struts.action.*;

import form.*;

public class ProvideDegreeDiscAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
								 HttpServletRequest request,
								 HttpServletResponse response) throws Exception {
		//System.out.println("excuting provide degree disc action");
		ProvideDegreeDiscForm f = (ProvideDegreeDiscForm) form;
		/*
		System.out.println("form = " + f);
		System.out.println("discipline = " + f.getDiscipline());
		System.out.println("otherDiscipline = " + f.getOtherDiscipline());
		System.out.println("degreeMonth = " + f.getDegreeMonth());
		System.out.println("degreeYear = " + f.getDegreeYear());
		System.out.println("degreeGpa = " + f.getDegreeGpa());
		System.out.println("degreeTitle = " + f.getDegreeTitle());
		System.out.println("transcriptFile = " + f.getTranscriptFile());
		*/
		HttpSession s = request.getSession();
		s.setAttribute(Constants.SESS_DISCIPLINE, f.getDiscipline());
		s.setAttribute(Constants.SESS_OTHER_DISCIPLINE, f.getOtherDiscipline());
		s.setAttribute(Constants.SESS_DEG_MONTH, f.getDegreeMonth());
		s.setAttribute(Constants.SESS_DEG_YEAR, f.getDegreeYear());
		s.setAttribute(Constants.SESS_DEG_GPA, f.getDegreeGpa());
		s.setAttribute(Constants.SESS_DEG_TITLE, f.getDegreeTitle());
		s.setAttribute(Constants.SESS_DEG_TRANSCRIPT, (String) f.getTranscriptFile());
		
		return mapping.findForward(Constants.FORWARD_SUCCESS);
	}
}
