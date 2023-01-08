<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Random"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Random rr = new Random();
	String key = "";
	key = String.valueOf(rr.nextInt(10))+
	String.valueOf((char)(rr.nextInt(26)+'a'))+
	String.valueOf(rr.nextInt(10))+
	String.valueOf((char)(rr.nextInt(26)+'a'))+
	String.valueOf(rr.nextInt(10))+
	String.valueOf((char)(rr.nextInt(26)+'a'))+
	String.valueOf(rr.nextInt(10))+
	String.valueOf((char)(rr.nextInt(26)+'a'))+
	String.valueOf(rr.nextInt(10))+
	String.valueOf((char)(rr.nextInt(26)+'a'))+
	String.valueOf(rr.nextInt(10))+
	String.valueOf((char)(rr.nextInt(26)+'a'))+
	String.valueOf(rr.nextInt(10))+
	String.valueOf((char)(rr.nextInt(26)+'a'))+
	String.valueOf(rr.nextInt(10))+
	String.valueOf((char)(rr.nextInt(26)+'a'))+
	String.valueOf(rr.nextInt(10))+
	String.valueOf((char)(rr.nextInt(26)+'a'))+
	String.valueOf(rr.nextInt(10))+
	String.valueOf((char)(rr.nextInt(26)+'a'))+
	String.valueOf(rr.nextInt(10))+
	String.valueOf((char)(rr.nextInt(26)+'a'))+
	String.valueOf(rr.nextInt(10))+
	String.valueOf((char)(rr.nextInt(26)+'a'))+
	String.valueOf(rr.nextInt(10))+
	String.valueOf((char)(rr.nextInt(26)+'a'))+
	String.valueOf(rr.nextInt(10))+
	String.valueOf((char)(rr.nextInt(26)+'a'))+
	String.valueOf(rr.nextInt(10))+
	String.valueOf((char)(rr.nextInt(26)+'a'))+
	String.valueOf(rr.nextInt(10))+
	String.valueOf((char)(rr.nextInt(26)+'a'));
%>
</body>
</html>