<%@ page import="java.util.ArrayList"%>
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
	if(request.getAttribute("longitudeArr") != null && request.getAttribute("longitudeArr") != null)
	{
		
		String[] latitudeArr = (String[]) request.getAttribute("latitudeArr");
		String[] longitudeArr = (String[]) request.getAttribute("longitudeArr");
		 
				
		int countlatitudeArr = latitudeArr.length;
		int countlongitudeArr = longitudeArr.length;
		
		if(countlatitudeArr != 0 && countlongitudeArr != 0 && countlatitudeArr == countlongitudeArr)
		{
			for(int i = 0; i < countlatitudeArr; i++)
			{
				System.out.println("Lat : " + latitudeArr[i]);
				System.out.println("Lng : " + longitudeArr[i]);
			}
		}
	}
	

%>


<%
	RequestDispatcher reqdisp= request.getRequestDispatcher("newresult.jsp");
	reqdisp.forward(request, response);
%>
</body>
</html>