<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Logged Out</title>
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
	color: #333333;
	font-size: 18px;
}
.style5 {font-size: 18px}
.style6 {font-size: 24}
.style7 {font-size: 18px; color: #000000; } 
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="searchform">      </div>
      <div class="logo">
        <h1><a href="index.html">Key Updating for Leakage Resiliency</a></h1>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="index.html"><span>Home Page</span></a></li>
          <li><a href="admin.html"><span>EGovt Cloud</span></a></li>
          <li><a href="dataowner.html"><span>HSP</span></a></li>
          <li><a href="user.html"><span>Patient</span></a></li>
          <li><a href="about.html"><span>About</span></a></li>
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
      <div class="clr">
        <p>&nbsp;</p>
        <p>&nbsp;</p><%
	String uname = (String)application.getAttribute("uname");
	String empty=null;
	if(uname.equals("admin")){
		application.setAttribute("uname",empty);
		%><p align="center" class="style4">Logout Successful
        <p>
		<p>&nbsp;</p>
      	<p>&nbsp;</p>
      	<p align="center" class="style7"><span class="style5"><span class="style1"><span class="style2"><a href="index.html">Home</a></span></span></span></p>
      	<p align="center" class="style7">&nbsp;</p>
      	
		<% 
	}else{
		application.setAttribute("uname",empty);
		application.setAttribute("category",empty);
		application.setAttribute("fullname",empty);
		%><p align="center" class="style7">Logout Successful<p>
		<p>&nbsp;</p>
      	<p>&nbsp;</p>
      	<p align="center" class="style7"><span class="style2"><span class="style6"><a href="index.html">Home</a></span></span></p>
      	<p align="center" class="style7">&nbsp;</p>
      	
		<% 
	}
	%>
      </div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2 class="style2">Stateless Key-Updating</h2>
        <span class="style3">Stateless key-updating assumes that the two communicating parties share only the secret key and a public variable (nonce)
i.e. there is no shared secret state between them. This updating mechanism is required whenever there is no synchronization between the two communicating parties e.g. during initialization of a secret channel. </span></div>
      <div class="col c2 style1">
        <h2 class="style2">Stateful Key-Updating</h2>
        <p>Stateful key-updating assumes that the two communicating parties share a common secret state (other than the key). They
          both can update the secret key into a new key without requiring
          any external variables. This scheme can provide a complete
        solution for synchronized applications e.g. key-fobs.</p>
      </div>
      <div class="col c3 style1">
        <h2 class="style2">Related Work</h2>
        <p>One of the early works that used key-updating is the work of
          Kocher], which is entirely based on DES. Unfortunately,
        the scheme has two drawbacks: it does not incorporate a nonce,and every key update requires two executions of the underlying
        DES. Without using nonce, the running keys will be
        generated in the same sequence in every session, which makes
        it vulnerable to SCA over different sessions.</p>
      </div>
      <div class="clr style1"></div>
    </div>
  </div>
  <div class="footer style1"></div>
</div>
</body>
</html>
