CSE 135 Phase 2 Submission
Putt Sakdhnagool	psakdhnagool@cs.ucsd.edu
Tassapol Athiapinya	tathiapinya@cs.ucsd.edu

==================================================

Environment
- PostgreSQL v.9

Instructions
1. Create database called cse135 in PostgreSQL.
2. Inside that, execute sql/create_table_sql.sql to create tables.
3. Copy webapps to Tomcat root
4. Restart Tomcat
5. Setup database data from support file by pointing your web browser to http://localhost:8080/application/setup_database.jsp
6. Use web application
   a) application/name.jsp  ; for applicant
   b) chair/discipline_analytics.jsp
      chair/speicialization_analytics.jsp
      chair/applications.jsp ; for chair


File contents
1. doc/
   a) doc/er.jpeg             ; for ER diagram
   b) doc/readme phase2.txt   ; for readme
2. sql/
   for sql scripts
3. webapps/
     application/             ; for applicant 
     chair/                   ; for chair

