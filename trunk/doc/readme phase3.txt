CSE 135 Phase 3 Submission
Putt Sakdhnagool	psakdhnagool@cs.ucsd.edu
Tassapol Athiapinya	tathiapinya@cs.ucsd.edu

==================================================

Insructions
1. Copy .keystore over to $CATALINA_HOME/conf
2. Copy server.xml over to $CATALINA_HOME/conf
3. Create table users and user_roles with create_table_sql.sql
4. Insert chair users
5. Restart Tomcat

File contents
1. tomcat/
   a) .keystore               ; keystore
   b) server.xml              ; Tomcat's server.xml
2. sql/
     create_table_sql.sql     ; create table scripts
     insert_chair_users.sql   ; insert chair user and roles
3. webapps/
     application/             ; for applicant 
     chair/                   ; for chair
     registration/            ; for applicant user registration

