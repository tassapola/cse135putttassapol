<%@page import="
    org.apache.commons.fileupload.*, 
    org.apache.commons.fileupload.disk.*,
	org.apache.commons.fileupload.servlet.*, 
	java.util.*,
	java.io.*,
	java.sql.*
" %>

<%
	// from http://commons.apache.org/fileupload/using.html
	// Create a factory for disk-based file items
	FileItemFactory factory = new DiskFileItemFactory();

	// Create a new file upload handler
	ServletFileUpload upload = new ServletFileUpload(factory);
	
	String nextPage = "";
	if(!ServletFileUpload.isMultipartContent(request))
	{
		nextPage = request.getParameter("next");
		for (Enumeration param = request.getParameterNames(); param.hasMoreElements();)
		{
			String paramName = (String)param.nextElement();
				
			if (paramName.equals("next") || paramName.equals("submit"))
				continue;
				
			String paramValue = (String)request.getParameter(paramName);
			session.setAttribute(paramName, paramValue);
		}
	}
	else
	{
		// Parse the request
		List items = upload.parseRequest(request);
		
		// Process the uploaded items
		Iterator iter = items.iterator();
		while (iter.hasNext()) 
		{
			FileItem item = (FileItem) iter.next();
			if (item.isFormField()) 
			{
				String name = item.getFieldName();
				if (name.equals("submit")) continue;
				
				if (name.equals("next"))
					nextPage = item.getString();
				else
				{
					String value = item.getString();
					session.setAttribute(name, value);
				}
			}
			else 
			{
				String name = item.getFieldName();
				String fileName = item.getName();
				
				session.setAttribute(name , item);
			}
		}
	}
%>

<html>
	<head>
	<meta http-equiv="REFRESH" content="0;url=<%= nextPage %>"/>
	</head>
	<body>
	</body>
</html>
