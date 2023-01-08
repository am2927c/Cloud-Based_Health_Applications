<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%
	Connection conn = null;
 	try {

	  	Class.forName("com.mysql.jdbc.Driver");	
		conn = DriverManager.getConnection("jdbc:mysql://172.31.38.25:3306/mycloud","root","123456");
      	String sql="";

	}
	catch(Exception e)
	{
		System.out.println(e);
	}
%>