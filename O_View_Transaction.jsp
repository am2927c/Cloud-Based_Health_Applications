<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.sql.Statement"%>
<%@include file="connect.jsp"%>

<%@page import="java.sql.ResultSet"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>C_View_Transaction</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/droid_sans_400-droid_sans_700.font.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 18}
.style2 {font-size: 24px; }
.style4 {
	font-size: 18px;
	font-weight: bold;
	color: #FF0000;
}
.style7 {font-size: 18px}
.style8 {	font-size: 12px;
	color: #FF0000;
	font-weight: bold;
	font-style: italic;
}
.style10 {font-size: 14px; color: #FFFF00; font-weight: bold; }
.style14 {font-size: 14px; color: #FF0000; font-weight: bold; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="searchform">      </div>
      <div class="logo">
        <h1><a href="index.html"><span class="style8">A Secure G-Cloud-Based Framework for Government Healthcare Services</span></a></h1>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          <li><a href="ohome.jsp"><span>Home Page</span></a></li>
          	<li><a href="viewusers.jsp">View users</a></li>
            <li><a href="viewfiles.jsp">View Files</a></li>
            <li class="active"><a href="viewattackers.jsp">View Attackers</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> 
          <p><a href="#"><img src="images/slide1.jpg" width="960" height="360" alt="" /></a></p>
          <p> <a href="#"><img src="images/slide2.jpg" width="960" height="360" alt="" /></a> <a href="#"><img src="images/slide3.jpg" width="960" height="360" alt="" /></a> </p>
        </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      
			<p align="center" class="style4">View Transactions Details !!! </p>
			<table align="center" cellspacing="3" cellpadding="10" border=1>
				<tr>
					<td bgcolor="#FF0000"><span class="style10">Username</span></td>
					<td bgcolor="#FF0000"><span class="style10">User Type </span></td>	
					<td bgcolor="#FF0000"><span class="style10">Report Name</span></td>
					<td bgcolor="#FF0000"><span class="style10">Key Used</span></td>
					<td bgcolor="#FF0000"><span class="style10">Task</span></td>
					<td bgcolor="#FF0000"><span class="style10">Date and Time</span></td>
				</tr>
				<%
				try{
				
				
				String oname=(String)application.getAttribute("oname");
					Statement stat = conn.createStatement();
					String task = "Attack";
					String query = "";
					query = "SELECT * FROM transactions where uname='"+oname+"'";
					ResultSet result = stat.executeQuery(query);
					while(result.next()){
						String s1 = result.getString(1);
						String s2 = result.getString(2);
						String s3 = result.getString(3);
						String s4 = result.getString(4);
						String s5 = result.getString(5);
						String s6 = result.getString(6);
						
						
						%>
						<tr>
							<td><span class="style14"><%=s1%></span></td>
							
							<td><span class="style14"><%=s2%></span></td>	
							
							<td><span class="style14"><%=s3%></span></td>
							
							<td><span class="style14"><%=s4%></span></td>
														<td><span class="style14"><%=s5%></span></td>
																					<td><span class="style14"><%=s6%></span></td>
						</tr>
						<% 
					}
				}catch(Exception e){
					
				}
				%>
	  </table>
			<div class="clr"></div>
      		<div align="center">
      		  <p>&nbsp;</p>
      		  <p><a href="ohome.jsp" class="style7">Home</a> </p>
      		</div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2 class="style2">&nbsp;</h2>
      </div>
      <div class="col c2 style1">
        <h2 class="style2">&nbsp;</h2>
      </div>
      <div class="col c3 style1">
        <h2 class="style2">&nbsp;</h2>
      </div>
      <div class="clr style1"></div>
    </div>
  </div>
  <div class="footer style1"></div>
</div>
</body>
</html>
