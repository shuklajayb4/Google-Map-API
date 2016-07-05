<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

        
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<blockquote>Latitude1: <b> <%= request.getAttribute("latitude1") %> </b></blockquote>
<blockquote>Longitude1: <b> <%= request.getAttribute("longitude1") %> </b></blockquote>

<blockquote>Latitude2: <b> <%= request.getAttribute("latitude2") %> </b></blockquote>
<blockquote>Longitude2: <b> <%= request.getAttribute("longitude2") %> </b></blockquote>

<%
	RequestDispatcher reqdisp= request.getRequestDispatcher("newresult.jsp");
	reqdisp.forward(request, response);
%>
</body>
</html>