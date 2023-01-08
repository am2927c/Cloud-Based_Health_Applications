<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.sql.Statement"%>
<%@include file="connect.jsp"%>

<%@page import="java.sql.ResultSet"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Owner Home</title>
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
.style4 {
	font-size: 16px;
	font-weight: bold;
	color: #000000;
}
.style6 {
	font-size: 14px;
	color: #000000;
	font-weight: bold;
}
.style7 {font-size: 18px}
.style8 {	font-size: 12px;
	color: #FF0000;
	font-weight: bold;
	font-style: italic;
}
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
      
			<p align="center" class="style4">Attacked Files and Revoked Users </p>
			<table align="center" cellspacing="3" cellpadding="10" border=1>
				<tr>
					<td><span class="style6">Filename</span></td>
					<td><span class="style6">Revoker Name </span></td>	
					<td><span class="style6">Attack Time</span></td>
					<td><span class="style6">Key Used</span></td>
				</tr>
				<%
				try{
					Statement stat = conn.createStatement();
					String task = "Attack";
					String query = "";
					query = "SELECT * FROM transactions WHERE task='"+task+"'";
					ResultSet result = stat.executeQuery(query);
					while(result.next()){
						String attacker = result.getString(1);
						String fname = result.getString(3);
						String date = result.getString(6);
						String kused = result.getString(4);
						%>
						<tr>
							<td><span class="style3"><%=fname%></span></td>
							
							<td><span class="style3"><%=attacker%></span></td>	
							
							<td><span class="style3"><%=date%></span></td>
							
							<td><span class="style3"><%=kused%></span></td>
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
      		  <p><a href="ahome.jsp" class="style7">Home</a> </p>
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
