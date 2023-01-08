<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="connect.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	try{
		String uname = (String)application.getAttribute("uname");
		String odate = request.getParameter("olddate");
		String date= request.getParameter("newdate");
		//out.println(odate+" "+date);
		String query = "UPDATE webserver SET keyupdate='"+date+"' where keyupdate='"+odate+"' and uname='"+uname+"'";
		out.println(query);
		conn.createStatement().executeUpdate(query);
		response.sendRedirect("ohome.jsp");
	}catch(Exception e){
		
	}
%>
</body>
</html>