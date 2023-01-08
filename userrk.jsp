<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Obtained Keys</title>

<%@ include file = "connect.jsp" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>

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
.style8 {font-size: 12px;
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
        <h1><a href="index.html"><span class="style8">A Secure G-Cloud-Based Framework for Government Healthcare Services</span></a></h1>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          	<li><a href="uhome.jsp"><span>Home Page</span></a></li>
			<li><a href="search.html">Search</a></li>
           	<li><a href="request.html">Request Key</a></li>
           	<li><a href="reqfile.html">Request File</a></li>
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
      
			<p align="center" class="style4">Obtained Keys</p>
			<table align="center" cellspacing="0" cellpadding="10" border=1>
				<tr>
					<td><span class="style6">Filename</span></td>
					<td><span class="style6">Key</span></td>
				</tr>
				<%
				String uname = (String)application.getAttribute("uname");
				try{
					Statement stat = conn.createStatement();
					String status = "pending";
					String query = "SELECT * FROM requests WHERE reqby='"+uname+"'"; // AND stat='"+status+"'";
					ResultSet result = stat.executeQuery(query);
					while(result.next()){
						String fname = result.getString(3);
						String key = result.getString(4);
						%>
						<tr>
							<td><span class="style3"><%=fname%></span></td>
							<td><span class="style3"><%=key%></span></td>
						</tr>
						<% 
					}
				}catch(Exception e){
					
				}
				%>
			</table>
             <p>&nbsp;</p>
             <div align="center"><a href="uhome.jsp" class="style7">Home</a>                      </div>
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
