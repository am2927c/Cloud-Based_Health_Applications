
<%@include file="connect.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String a="Attack";
	String uname = request.getParameter("name");
	String upass = request.getParameter("pass");
	
	if(uname.equalsIgnoreCase("cloud")){
		try{
			Statement stat = conn.createStatement();
			String query = "SELECT * FROM admin WHERE aname='"+uname+"' AND apass='"+upass+"'";
			ResultSet res = stat.executeQuery(query);
			if(res.next()){
				application.setAttribute("uname",uname);
				response.sendRedirect("ahome.jsp");

			}else{
				response.sendRedirect("wronglogin.html");
			}
		}catch(Exception e){
		
		}
	}else{
		try{
			Statement stat = conn.createStatement();
			String query = "SELECT * FROM users WHERE username='"+uname+"' AND pword='"+upass+"'";
			ResultSet res = stat.executeQuery(query);
			if(res.next()){
				String category = res.getString(9);
				String fullname = res.getString(1);
				
				
				application.setAttribute("category",category);
				application.setAttribute("fullname",fullname);
				
				if(category.equals("Owner")){
				    application.setAttribute("oname",uname);
					
					response.sendRedirect("ohome.jsp");
				}else{
				    application.setAttribute("uname",uname);
									
									

			String sql1="SELECT * FROM transactions where task='"+a+"' and  uname='"+uname+"' ";
			Statement stmt1 = conn.createStatement();
			ResultSet rs1 =stmt1.executeQuery(sql1);
			
			if(rs1.next()==true)
			{
			out.print("YOU ARE UNDER REVOKATATION !!! YOU CAN'T LOGIN NOW");
			%>
			<Br>
			<a href="user.html"> <<<<<<< Back </a>
             
			
			<%}
			else if(rs1.next()!=true)
			{
			
				response.sendRedirect("uhome.jsp");
			}


					


														

				}
			}else{
				response.sendRedirect("wronglogin.html");
			}
		}catch(Exception e){
		
		}
	}
%>
</body>
</html>