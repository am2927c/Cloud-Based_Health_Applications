<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>File Keys</title>
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
.style8 {font-size: 20px}
.style9 {color: #FF6600}
.style10 {	font-size: 18px;
	font-weight: bold;
	font-style: italic;
	color: #FF0000;
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
        <h1><a href="index.html" class="style10">A Secure G-Cloud-Based Framework for Government Healthcare Services</a><a href="index.html"></a></h1>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          <li ><a href="ohome.jsp"><span>Home Page</span></a></li>
          <li><a href="upload.html"><span>Upload</span></a></li>
          <li><a href="viewfiles.jsp"><span>View Files</span></a></li>
          <li class="active"><a href="viewkeys.jsp"><span>View Keys</span></a></li>
          <li><a href="logout.jsp"><span>Logout</span></a></li>
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
      
			<p align="center" class="style4 style8">All Uploaded File Keys</p>
			    <table align="center" cellspacing="0" cellpadding="10" border=1>
				<tr>
				<td><span class="style6">No</span></td>
				<td><span class="style6">Filename</span></td>
				<td><span class="style6">Key</span></td>
				<td><span class="style6">Date</span></td>
				</tr>
				<%
				String oname = (String)application.getAttribute("oname");
				String query,dt,fname,key;
				try{
					Statement stat = conn.createStatement();
					
						query = "SELECT * FROM webserver";
					
					ResultSet result = stat.executeQuery(query);
					int count=0;
					while(result.next()){
					count=count+1;
							fname = result.getString(2);
							key = result.getString(4);
							dt = result.getString(6);
									
						%>
						<tr>
						    <td><span class="style3"><%=count%></span></td>
							<td><span class="style3"><%=fname%></span></td>
							<td><span class="style3"><%=key%></span></td>
							<td><span class="style3"><%=dt%></span></td>
						</tr>
						<% 
					}
					%>
						<tr>
						    <td><span class="style3"></span></td>
							<td><span class="style3"></span></td>
							<td><span class="style3"></span></td>
							<td><span class="style3"></span></td>
						</tr>
						<% 
				}catch(Exception e){
					
				}
				%>
			</table>
			
				 <p align="center"><a href="ahome.html" class="style7">Home</a></p>
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
