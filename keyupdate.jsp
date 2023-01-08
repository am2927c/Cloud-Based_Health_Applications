<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="connect.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ include file="32bitkeygen.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	try{		
		String uname = (String)application.getAttribute("uname");
		String category = (String)application.getAttribute("category");
		String query = "SELECT * FROM users WHERE username='"+uname+"'";
		String update = null;
		ResultSet res = conn.createStatement().executeQuery(query);
		while(res.next()){
			update=res.getString(12);
			//out.println(update);
		}
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		Date now = new Date();
		String dtt = sdf.format(now);
		//out.println(dtt);
		if(dtt.equals(update)){
			String upquery = "UPDATE users SET ownerkey='"+key+"' WHERE username='"+uname+"'";
			String task = "Updated";
			String old = "old";
			String current = "Current";
			String oldupdate = "UPDATE okey set current='"+old+"' WHERE oname='"+uname+"' AND okey!='"+key+"'";
			conn.createStatement().executeUpdate(oldupdate);
			String keyQuery = "INSERT INTO okey values('"+uname+"','"+key+"','"+dtt+"','"+task+"','"+current+"')";
			conn.createStatement().executeUpdate(keyQuery);
			int i = conn.createStatement().executeUpdate(upquery);
			if(i!=0){
				response.sendRedirect("keyupdation.jsp?flag=1");
			}
			
		}
		response.sendRedirect("keyupdation.jsp");
		
	}catch(Exception e){
		
	}
		
%>
</body>
</html>