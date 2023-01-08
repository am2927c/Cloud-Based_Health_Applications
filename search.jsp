<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Search Result</title>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@ include file="connect.jsp" %>
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
.style10 {
	font-size: 18px;
	color: #000000;
}
.style16 {font-size: 18px}
.style8 {font-size: 12px;
	color: #FF0000;
	font-weight: bold;
	font-style: italic;
}
.style17 {color: #FF0000}
.style20 {font-size: 16px}
.style21 {font-size: 16px; color: #FF0000; }
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
          <li ><a href="uhome.jsp"><span>Home Page</span></a></li>
			<li class="active"><a href="search.html">Search</a></li>
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
     
        <p>&nbsp;</p>
        <p align="center" class="style10">Search Results</p>
		
		    <table border=1 align="center" cellpadding="10" cellspacing="0" callspacing="3">
			<tr>
			<td bgcolor="#00FF00"><div align="center" class="style16 style17"><strong>Report Name</strong></div></td>
			<td bgcolor="#00FF00"><div align="center" class="style16 style17"><strong>Upload Date</strong></div></td>
			<td width="33" bgcolor="#00FF00"><span class="style16 style17 style12"><strong>Age</strong></span></td>
					<td width="107" bgcolor="#00FF00"><span class="style16 style17 style12"><strong>Address</strong></span></td>
					<td width="48" bgcolor="#00FF00"><span class="style16 style17 style12"><strong>Mobile</strong></span></td>
					<td width="62" bgcolor="#00FF00"><span class="style16 style17 style12"><strong>Symtoms</strong></span></td>
					<td width="56" bgcolor="#00FF00"><span class="style16 style17 style12"><strong>Disease</strong></span></td>
					<td width="30" bgcolor="#00FF00"><span class="style16 style17 style12"><strong>Test</strong></span></td>
					<td width="70" bgcolor="#00FF00"><span class="style16 style17 style12"><strong>Result</strong></span></td>
			</tr>
			
			<%
			String sterm = request.getParameter("sterm");
			try{
				Statement stat = conn.createStatement();
				String query = "SELECT * FROM webserver";
				ResultSet res = stat.executeQuery(query);
				while(res.next())
				{
					String fname = res.getString(2);
					String cont = res.getString(3);
					
					String date = res.getString(6);
					String pname = res.getString(7);
					String age = res.getString(8);
						String padd = res.getString(9);
						String mno = res.getString(10);
						String sym = res.getString(11);
						String disease = res.getString(12);
						String ptest = res.getString(13);
						String presult = res.getString(14);
						
						String keys = "ef50a0ef2c3e3a5f";
										byte[] keyValue1 = keys.getBytes();
										Key key1 = new SecretKeySpec(keyValue1,"AES");
										Cipher c1 = Cipher.getInstance("AES");
										c1.init(Cipher.DECRYPT_MODE, key1);
							String decryptedValue = new String(Base64.decode(cont.getBytes()));
							String decryptedValue1 = new String(Base64.decode(age.getBytes()));
							String decryptedValue2 = new String(Base64.decode(padd.getBytes()));
							String decryptedValue3 = new String(Base64.decode(mno.getBytes()));
							String decryptedValue4 = new String(Base64.decode(sym.getBytes()));
							String decryptedValue5 = new String(Base64.decode(disease.getBytes()));
							String decryptedValue6 = new String(Base64.decode(ptest.getBytes()));
							String decryptedValue7 = new String(Base64.decode(presult.getBytes()));
						
					
					if(fname.toLowerCase().contains(sterm.toLowerCase())|| decryptedValue.toLowerCase().contains(sterm.toLowerCase())|| pname.toLowerCase().contains(sterm.toLowerCase()))
					{
						%>
						<tr>
						<td><span class="style21"><%=fname%></span></td>
						<td><span class="style21"><%=date%></span></td>
						<td><span class="style14 style20 style17"><%=decryptedValue1%></span></td>
							<td><span class="style14 style20 style17"><textarea cols="15" rows="5"><%=decryptedValue2%></textarea></span></td>
							<td><span class="style14 style20 style17"><%=decryptedValue3%></span></td>
							<td><span class="style14 style20 style17"><%=decryptedValue4%></span></td>
							<td><span class="style14 style20 style17"><%=decryptedValue5%></span></td>
							<td><span class="style14 style20 style17"><%=decryptedValue6%></span></td>
							<td><span class="style14 style20 style17"><%=decryptedValue7%></span></td>
						</tr>
						<% 
					}
				}
			}catch(Exception e)
			{
			out.print(e);
			}
			%>
	  </table>
        <p>&nbsp;</p>
      <div align="center"><a href="uhome.jsp" class="style16">Back</a></div>
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
