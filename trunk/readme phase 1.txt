CSE 135 Phase 1 Submission
Putt Sakdhnagool	psakdhnagool@cs.ucsd.edu
Tassapol Athiapinya	tathiapinya@cs.ucsd.edu

==================================================

The folder webapps is web application folder for deployment with Apache Tomcat 6.0. 

For our web application, there are three folders as following:
1. /WEB-INF
      web.xml	deployment descriptor
      classes/support/
         countries.class	
	 support.class
	 universities.class
2. /support
	contains countries.txt, majors.txt, specializations.txt and universities.txt
3. /application
	contains our web application
	Each page corresponds to jsp file.
	There are two special pages:
		1. collect_session.jsp
			contains our modified Model 1 style
			It is also our page transition controller.
			For example, to go for name.jsp to citizenship.jsp, we submit the form data to this collect_session.jsp to set session attributes, then redirect user's browser to citizenship.jsp
		2. merge_degree_info.jsp
			contains a page to merge data for degree information before redirection to a page for user to enter more degree
			It collects many session attributes to HashMap object, which is a degree, and add this to degree vector.

=Usage instruction=
1. deploy to Tomcat ROOT folder
2. restart web server
3. point browser to web server root with .name.jsp page
	for example,
	http://localhost:8080/name.jsp


