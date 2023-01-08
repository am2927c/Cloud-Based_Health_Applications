<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Owner Home</title>

<%@ include file="connect.jsp" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

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
.style5 {
	font-size: 18px;
	color: #000000;
}
.style7 {font-size: 14px; color: #000000; }
.style9 {font-size: 14px; color: #000000; font-weight: bold; }
.style10 {color: #FF6600}
.style11 {font-size: 18px; }
.style12 {font-size: 12px;
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
        <h1><a href="index.html"><span class="style12">dentity-Based Encryption with Cloud Revocation Authority and Its Applications</span></a></h1>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="ohome.jsp"><span>Home Page</span></a></li>
          <li><a href="upload.html"><span>Upload</span></a></li>
          <li><a href="viewfiles.jsp"><span>View Files</span></a></li>
          <li><a href="viewkeys.jsp"><span>View Keys</span></a></li>
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
      <p align="center" class="style5">User Requests to Owner<span class="style10"> <%= (String)application.getAttribute("fullname")%></span></p>
      <table align="center" cellspacing="0" cellpadding="10" border="2">
      	<tr>
		    <td><span class="style9">SI No</span></td>
      		<td><span class="style9">Request By</span></td>
      		<td><span class="style9">Filename</span></td>
      		<td><span class="style9">Public Key </span></td>
      	</tr>
      	<%
      		String oname = (String)application.getAttribute("oname");
      		try{
      			Statement stat = conn.createStatement();
      			String query = "SELECT * FROM requests WHERE reqto='"+oname+"'";
      			ResultSet res = stat.executeQuery(query);
				int count=0;
      			while(res.next()){
				count=count+1;
      				String reqby = res.getString(1);
      				String fname = res.getString(3);
      				String status = res.getString(4);
      				%><tr>
					        <td><span class="style7"><%=count%></span></td>
      						<td><span class="style7"><%=reqby%></span></td>
      						<td><span class="style7"><%=fname%></span></td>
      						<% 
      						if(status.equals("pending")){%>
      							<td><a href="approve.jsp?reqby=<%=reqby%>&fname=<%=fname%>"><span class="style3"><%=status%></span></a></td>
      						<%}else{
 								%><td><span class="style7"><%=status%></span></td>
      						<%
      						}
							
							%>
      						
      					
      				</tr>
      				 
      			<% }
      		}catch(Exception e){
      			
      		}
      	%>
      </table>
    </div>
    <p align="center"><a href="pkgmain.jsp" class="style11">Home</a></p>
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
