<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>All Owner Files</title>

<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ include file = "connect.jsp" %>
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
	font-size: 16px;
	font-weight: bold;
	color: #000000;
}
.style7 {font-size: 18px}
.style8 {font-size: 20px}
.style10 {	font-size: 12px;
	color: #FF0000;
	font-weight: bold;
	font-style: italic;
}
.style12 {font-size: 14px; color: #FFFF00; font-weight: bold; }
.style14 {font-size: 14px; color: #FF0000; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="searchform">      </div>
      <div class="logo">
        <h1><a href="index.html"><span class="style10">Identity-Based Encryption with Cloud Revocation Authority and Its Applications</span></a></h1>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
         	<li ><a href="ohome.jsp"><span>Home Page</span></a></li>
          	<li><a href="viewusers.jsp">View users</a></li>
            <li class="active"><a href="viewfiles.jsp">View Files</a></li>
            <li><a href="viewkeys.jsp"><span>View Keys</span></a></li>
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
      
			<p align="center" class="style4 style8">View All Patient Details !!! </p>
			<table width="885" border=1 align="center" cellpadding="10" cellspacing="0">
				<tr>
				    <td width="42" bgcolor="#FF0000"><span class="style12">SNo</span></td>
					<td width="48" bgcolor="#FF0000"><span class="style12">Report</span></td>
					<td width="76" bgcolor="#FF0000"><span class="style12">Upload Date</span></td>	
					<td width="69" bgcolor="#FF0000"><span class="style12">Secret Key</span></td>				
					<td width="53" bgcolor="#FF0000"><span class="style12">Patient Name</span></td>
					<td width="33" bgcolor="#FF0000"><span class="style12">Age</span></td>
					<td width="107" bgcolor="#FF0000"><span class="style12">Address</span></td>
					<td width="48" bgcolor="#FF0000"><span class="style12">Mobile</span></td>
					<td width="62" bgcolor="#FF0000"><span class="style12">Symtoms</span></td>
					<td width="56" bgcolor="#FF0000"><span class="style12">Disease</span></td>
					<td width="30" bgcolor="#FF0000"><span class="style12">Test</span></td>
					<td width="70" bgcolor="#FF0000"><span class="style12">Result</span></td>
				</tr>
				<%
				try{
					String oname = (String)application.getAttribute("oname");
					Statement stat = conn.createStatement();
					
					String query = "";
					
						query = "SELECT * FROM webserver";
			
					ResultSet result = stat.executeQuery(query);
					int count=0;
					while(result.next()){
					count=count+1;
						String fname = result.getString(2);
						String fuloader = result.getString(1);
						String date = result.getString(6);
						
						String rank = result.getString(5);
						String sk = result.getString(4);
						String udat = result.getString(6);
						String pname = result.getString(7);
						String age = result.getString(8);
						String padd = result.getString(9);
						String mno = result.getString(10);
						String sym = result.getString(11);
						String disease = result.getString(12);
						String ptest = result.getString(13);
						String presult = result.getString(14);
						
						%>
						<tr>
							<td><span class="style14"><%=count%></span></td>
							<td><span class="style14"><%=fname%></span></td>
							<td><span class="style14"><%=date%></span></td>
							<td><span class="style14"><%=sk%></span></td>
							<td><span class="style14"><%=pname%></span></td>
							<td><span class="style14"><%=age%></span></td>
							<td><span class="style14"><textarea cols="15" rows="5"><%=padd%></textarea></span></td>
							<td><span class="style14"><%=mno%></span></td>
							<td><span class="style14"><%=sym%></span></td>
							<td><span class="style14"><%=disease%></span></td>
							<td><span class="style14"><%=ptest%></span></td>
							<td><span class="style14"><%=presult%></span></td>
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
      		 
      		  		<p><a href="ahome.jsp" class="style7">Home</a></p>
      		
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
