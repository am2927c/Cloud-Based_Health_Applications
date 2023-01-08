<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%><html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="connect.jsp"%>
<head>
<title>Admin Home</title>
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
.style3 {font-size: 14px}
.style10 {font-size: 18px}
.style12 {font-size: 18px; color: #000000; }
.style8 {	font-size: 12px;
	color: #FF0000;
	font-weight: bold;
	font-style: italic;
}
.style13 {color: #FFFF00}
.style14 {font-weight: bold; font-size: 16px;}
.style15 {color: #FF0000}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="searchform">      </div>
      <div class="logo">
        <h1><a href="index.html"><span class="style8">Identity-Based Encryption with Cloud Revocation Authority and Its Applications</span></a></h1>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
        	<li ><a href="ahome.html"><span>Home Page</span></a></li>
          	<li class="active"><a href="viewusers.jsp">View users</a></li>
            <li><a href="viewfiles.jsp">View Files</a></li>
            <li><a href="viewattackers.jsp">View Attackers</a></li>
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
    	<div align="center">
    	  <p align="left" class="style12">HSP Details....!  	    </p>
    	  <p class="style10">&nbsp;  </p>
   	  </div>
    	<table border=1 align="center" cellpadding="10" cellspacing="0" callspacing="0">
		<tr>
		  <td bgcolor="#FF0000"><div align="center" class="style13"><span class="style14">Name</span></div></td>
		  <td bgcolor="#FF0000"><div align="center" class="style13"><span class="style14">Username</span></div></td>
		  <td bgcolor="#FF0000"><div align="center" class="style13"><span class="style14">Usertype</span></div></td>
		  <td bgcolor="#FF0000"><div align="center" class="style13"><span class="style14">Email</span></div></td>
		  <td bgcolor="#FF0000"><div align="center" class="style13"><span class="style14">Mobile</span></div></td>
		  <td bgcolor="#FF0000"><div align="center" class="style13"><span class="style14">DOB</span></div></td>
		  <td bgcolor="#FF0000"><div align="center" class="style13"><span class="style14">Gender</span></div></td>
		</tr>	
			<%
				try{
					String otype="Owner";
					String query = "SELECT * FROM users WHERE otype='"+otype+"'";
					
					Statement stat = conn.createStatement();
					ResultSet res = stat.executeQuery(query);
					while(res.next()){
						String fname = res.getString(1);
						String uname = res.getString(2);
						String email = res.getString(4);
						String mobile = res.getString(5);
						String dob = res.getString(7);
						String gender = res.getString(8);
						
						%><tr>
							<td><div align="center" class="style15"><span class="style3"><%=fname %></span></div></td>
							<td><div align="center" class="style15"><span class="style3"><%=uname %></span></div></td>
							<td><div align="center" class="style15"><span class="style3"><%=otype %></span></div></td>
							<td><div align="center" class="style15"><span class="style3"><%=email %></span></div></td>
							<td><div align="center" class="style15"><span class="style3"><%=mobile %></span></div></td>
							<td><div align="center" class="style15"><span class="style3"><%=dob %></span></div></td>
							<td><div align="center" class="style15"><span class="style3"><%=gender %></span></div></td>
							
						</tr><% 					
					}
				}catch(Exception e){
					
				}
			%>
	  </table>
		 
		<p>&nbsp;</p>
		<div align="center">
		  <p align="left" class="style12">Patient Details....!	    </p>
		  <p class="style12">&nbsp;</p>
		</div>
		<table border=1 align="center" cellpadding="10" cellspacing="0" callspacing="0">
		<tr>
		  <td bgcolor="#FF0000"><div align="center" class="style13"><span class="style14">Name</span></div></td>
		  <td bgcolor="#FF0000"><div align="center" class="style13"><span class="style14">Username</span></div></td>
		  <td bgcolor="#FF0000"><div align="center" class="style13"><span class="style14">Usertype</span></div></td>
		  <td bgcolor="#FF0000"><div align="center" class="style13"><span class="style14">Email</span></div></td>
		  <td bgcolor="#FF0000"><div align="center" class="style13"><span class="style14">Mobile</span></div></td>
		  <td bgcolor="#FF0000"><div align="center" class="style13"><span class="style14">DOB</span></div></td>
		  <td bgcolor="#FF0000"><div align="center" class="style13"><span class="style14">Gender</span></div></td>
		</tr>
		<%
				try{
					String otype="User";
					String query = "SELECT * FROM users WHERE otype='"+otype+"'";
					
					Statement stat = conn.createStatement();
					ResultSet res = stat.executeQuery(query);
					while(res.next()){
						String fname = res.getString(1);
						String uname = res.getString(2);
						String email = res.getString(4);
						String mobile = res.getString(5);
						String dob = res.getString(7);
						String gender = res.getString(8);
						%><tr>
							<td><div align="center" class="style15"><span class="style3"><%=fname %></span></div></td>
							<td><div align="center" class="style15"><span class="style3"><%=uname %></span></div></td>
							<td><div align="center" class="style15"><span class="style3"><%=otype %></span></div></td>
							<td><div align="center" class="style15"><span class="style3"><%=email %></span></div></td>
							<td><div align="center" class="style15"><span class="style3"><%=mobile %></span></div></td>
							<td><div align="center" class="style15"><span class="style3"><%=dob %></span></div></td>
							<td><div align="center" class="style15"><span class="style3"><%=gender %></span></div></td>
						</tr><% 					
					}
				}catch(Exception e){
					
				}
			%>
	  </table>  
      
      <div class="clr"></div>
      <div align="center">
        <p>&nbsp;</p>
        <p><a href="ahome.jsp" class="style10">Home</a> </p>
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
