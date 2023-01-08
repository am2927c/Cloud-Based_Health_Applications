<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Upload Success</title>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@include file="connect.jsp"%>
<%@include file="32bitkeygen.jsp"%>
<%@page	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@page	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@page	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
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
.style1 {
	font-size: 18
}

.style2 {
	font-size: 24px;
}

.style3 {
	font-size: 14px
}

.style8 {
	font-size: 16px;
	color: #000000;
}
.style4 {	font-size: 18px;
	font-weight: bold;
	font-style: italic;
	color: #FF0000;
}
-->
</style>
<script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("uLoad").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}
</script>
</head>
<body>
<div class="main">
<div class="header">
<div class="header_resize">
<div class="searchform"></div>
<div class="logo">
<h1><a href="index.html" class="style4">A Secure G-Cloud-Based Framework for Government Healthcare Services</a><a href="index.html"></a></h1>
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
<p><a href="#"><img src="images/slide1.jpg" width="960"
	height="360" alt="" /></a></p>
<p><a href="#"><img src="images/slide2.jpg" width="960"
	height="360" alt="" /></a> <a href="#"><img src="images/slide3.jpg"
	width="960" height="360" alt="" /></a></p>
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

<%
	try{
		String file=request.getParameter("fname");
      	String cont=request.getParameter("text");
      	String keyupdate=request.getParameter("keyupdate");
      		
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

		Date now = new Date();

		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt = strDate+" "+strTime;
			
   		KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
		Cipher encoder = Cipher.getInstance("RSA");
		KeyPair kp = kg.generateKeyPair();

		Key pubKey = kp.getPublic();

		byte[] pub = pubKey.getEncoded();
		System.out.println("PUBLIC KEY" + pub);
		
		
		String rank = "0";
	
		String uname = (String)application.getAttribute("uname");
	 	String otype="Owner";
		String task="Upload";
		String skGen="User";	
		String pk="Not Generated";	
		String transQuery = "INSERT INTO transactions(uname,utype,fname,sk,task,dt) values('"+uname+"','"+otype+"','"+file+"','"+pk+"','"+task+"','"+dt+"')";
		conn.createStatement().executeUpdate(transQuery);
		String insertQuery = "INSERT INTO webserver(uname,fname,content,sk,rank,dt,keyupdate) values ('"+uname+"','"+file+"','"+cont+"','"+pk+"','"+rank+"','"+dt+"','"+keyupdate+"')";		
		conn.createStatement().executeUpdate(insertQuery);
		String keyQuery ="INSERT INTO secretkeys VALUES('"+file+"','"+dt+"','"+pk+"','"+skGen+"')";
		conn.createStatement().executeUpdate(keyQuery);
		//st.executeUpdate("insert into  cloudserver(fname,ct,trapdoor,sk,rank,dt) values ('"+uname+"','"+file+"','"+cont+"','"+mac+"','"+pk+"','"+rank+"','"+dt+"')"); 
		//out.println(strQuery2);
		//out.println(strQuery3);
%>

<p>
<h2 align="center">Data Uploaded Successfully!!</h2>
</p>
<p align="center" class="style7"><span class="style2"><span
	class="style6"> <a href="ohome.jsp">Home</a> </span></span></p>
<%
		conn.close();
	}catch(Exception e){
		out.println(e.getMessage());
    }
%>
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