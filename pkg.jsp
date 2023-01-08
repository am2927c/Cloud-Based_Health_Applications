<title>Authentication Page</title>


<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@include file="connect.jsp"%>


<%
   	String name=request.getParameter("user");      
   	String pass=request.getParameter("pass");
	
    try{
			String sql="SELECT * FROM pkg where username='"+name+"' and password='"+pass+"'";
			Statement stmt = conn.createStatement();
			ResultSet rs =stmt.executeQuery(sql);
			String utype="";
			if(rs.next()){
				response.sendRedirect("pkgmain.jsp");
			}
			else
			{
				response.sendRedirect("WrongLogin.html");
			}
		
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>