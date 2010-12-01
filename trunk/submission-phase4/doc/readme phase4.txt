CSE 135 Phase 4 Submission
Putt Sakdhnagool	psakdhnagool@cs.ucsd.edu
Tassapol Athiapinya	tathiapinya@cs.ucsd.edu

==================================================

=Environment=
Tomcat 7.0
JRE 6
Struts 1.3 

File contents
1. doc/
     cse135_diagram.pptx      : MVC diagram
2. tomcat/
   a) .keystore               ; keystore
   b) server.xml              ; Tomcat's server.xml
3. sql/
     create_table_sql.sql     ; create table scripts
     insert_chair_users.sql   ; insert chair user and roles
     reset_review_process.sql ; reset review process 
4. webapps/
     registration/            ; for applicant user registration
     mvc/            	      ; for mvc web application
       application/           ; for applicant
       chair/                 ; for chair
       reviewer/              ; for reviewer
     WEB-INF/
       lib/                   ; jar libraries
       classes/               ; classes
         MessageResources.properties   ; error messages
5. java/
     action/
     form/


Usage
https://localhost:8443/cse135/registration/registration.jsp
http://localhost:8080/cse135/application/myApplication.do
https://localhost:8443/cse135/mvc/chair/ChairHome.do
https://localhost:8443/cse135/mvc/reviewer/reviewersHome.do

