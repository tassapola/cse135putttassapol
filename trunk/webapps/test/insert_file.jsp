<%@page import="
    org.apache.commons.fileupload.*, 
    org.apache.commons.fileupload.disk.*,
	org.apache.commons.fileupload.servlet.*, 
	java.util.*,
	java.io.*,
	java.sql.*
" %>

<%
//from http://commons.apache.org/fileupload/using.html


// Create a factory for disk-based file items
FileItemFactory factory = new DiskFileItemFactory();

// Create a new file upload handler
ServletFileUpload upload = new ServletFileUpload(factory);

// Parse the request
List /* FileItem */ items = upload.parseRequest(request);

// Process the uploaded items
Iterator iter = items.iterator();
while (iter.hasNext()) {
    FileItem item = (FileItem) iter.next();

    if (item.isFormField()) {
		String name = item.getFieldName();
		String value = item.getString();

        out.print(name + " " + value);
		out.print("<br>");
    } else {
        //out.print(item);
		String fileName = item.getName();
		out.print(fileName);
		InputStream u = item.getInputStream();
		/* //show contents to a browser
		int d;
		do {
			d = u.read();
			if (d == -1)
				break;
			else {
				out.print((char) d);
			}
		} while (d != -1);
		*/
		
		Class.forName("org.postgresql.Driver");

		Connection conn=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		conn.setAutoCommit(false);

		PreparedStatement ps = conn.prepareStatement("INSERT INTO file (name, content) values (?, ?);");
		ps.setString(1, fileName);
		ps.setBinaryStream(2, u, (int) item.getSize());
		ps.executeUpdate();
		conn.commit();
		u.close();
		conn.close();
		out.print("<br>");
    }
}

%>