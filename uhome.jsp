<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Patient Main</title>
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
.style4 {color: #333333}
.style8 {font-size: 12px;
	color: #FF0000;
	font-weight: bold;
	font-style: italic;
}
.style9 {
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
      <div class="searchform"></div>
      <div class="logo">
        <h1><a href="index.html"><span class="style8">A Secure G-Cloud-Based Framework for Government Healthcare Services</span></a></h1>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          	<li class="active"><a href="uhome.jsp"><span>Home Page</span></a></li>
			<li class="active"><a href="search.html">Search</a></li>
           	<li class="active"><a href="request.html">Request Key</a></li>
           	<li class="active"><a href="reqfile.html">Request File</a></li>
          	<li class="active"><a href="index.html"><span>Logout</span></a></li>
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
      <div class="mainbar">
        <div class="article">
		<%String fullname = (String)application.getAttribute("fullname"); %>
          <h2 class="style4">Welcome <%=fullname%>, </h2>
         
          <div class="clr style4"></div>
          <div align="justify">
            <p><img src="images/Patient.jpeg" width="625" height="202" /></p>
          </div>
          <p class="style4">&nbsp;</p>
            <div class="clr"></div>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span>Patient Menu </span></h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="search.html">Search</a></li>
            <li><a href="request.html">Request Key</a></li>
            <li><a href="reqfile.html">Request File</a></li>
            <li><a href="userrk.jsp">View Keys</a></li>
            
          </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg"></div>
  <div class="footer style1"></div>
</div>
</body>
</html>
