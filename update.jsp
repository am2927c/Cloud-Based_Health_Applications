<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>EGovt Cloud Home</title>
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
.style1 {font-size: 18}
.style2 {font-size: 24px; }
.style3 {font-size: 14px}
.style10 {font-size: 18px}
.style12 {font-size: 16px}
.style8 {	font-size: 12px;
	color: #FF0000;
	font-weight: bold;
	font-style: italic;
}
.style13 {color: #FFFFFF}
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
          <li class="active"><a href="ahome.html"><span>Home Page</span></a></li>
          <li><a href="viewusers.jsp"><span>View users</span></a></li>
          <li><a href="viewfiles.jsp"><span>View Files</span></a></li>
          <li><a href="viewattackers.jsp"><span>View Attackers</span></a></li>
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
    			
<h2 align="center">All User Time Key and Updated Current Keys</h2>
                <p> <table align="center" cellspacing="0" cellpadding="10" border=1>
				<tr>
				<td bgcolor="#FF00FF"><span class="style6 style12 style13">No</span></td>
				<td bgcolor="#FF00FF"><span class="style6 style12 style13">Username</span></td>
				<td bgcolor="#FF00FF"><span class="style6 style12 style13">Filename</span></td>
				<td bgcolor="#FF00FF"><span class="style6 style12 style13">Key</span></td>
				<td bgcolor="#FF00FF"><span class="style6 style12 style13">Key Date to Update </span></td>
			
				</tr>
				<%
				
				String query,dt,fname,key1,user;
				try{
					Statement stat = conn.createStatement();
					
						query = "SELECT * FROM webserver";
					
					ResultSet result = stat.executeQuery(query);
					int count=0;
					while(result.next()){
					count=count+1;
					        user=result.getString(1);
							fname = result.getString(2);
							key1 = result.getString(4);
							dt = result.getString(7);
									
				 SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				String dt11 = dt;
			    Date date1 =  new SimpleDateFormat("dd/MM/yyyy").parse(dt11);
				
				
			    Date now1 = new Date();
			    SimpleDateFormat sdf1 = new SimpleDateFormat ("dd/MM/yyyy");
                	    String strCurrDate = sdf1.format(now1);
	                   Date date2 =  new SimpleDateFormat("dd/MM/yyyy").parse(strCurrDate);			
						%>
						<tr>
						    <td><span class="style3"><%=count%></span></td>
							<td><span class="style3"><%=user%></span></td>
							<td><span class="style3"><%=fname%></span></td>
							<td><span class="style3"><%=key1%></span></td>
							<td><span class="style3"><%=dt%></span></td>
							
							<% if(date1.compareTo(date2)==0){
{
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		Date now11 = new Date();
		String strDate = sdfDate.format(now11);
		String strTime = sdfTime.format(now11);
		String dt1 = strDate/*+" "+strTime*/; //7
		
        KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
		Cipher encoder = Cipher.getInstance("RSA");
		KeyPair kp = kg.generateKeyPair();
		Key pubKey = kp.getPublic();
		byte[] pub = pubKey.getEncoded();
		System.out.println("PUBLIC KEY" + pub); // keyupdate='"+dt+"'
		
		String pk = String.valueOf(pub);
		
		
		String str =  "update webserver set sk='"+pk+"' where fname='"+fname+"' ";
		conn.createStatement().executeUpdate(str);
		
		String str2 =  "update webserver set keyupdate='"+dt1+"' where fname='"+fname+"' ";
		conn.createStatement().executeUpdate(str2); 
		
		String str1 = "insert into stateless(fname,sk) values('"+fname+"','"+key1+"')";
		conn.createStatement().executeUpdate(str1); 


							
							}
}
							%>
						</tr>
						<% 
					          }
					%>
						<tr>
						    <td><span class="style3"></span></td>
							<td><span class="style3"></span></td>
							<td><span class="style3"></span></td>
							<td><span class="style3"></span></td>
							<td><span class="style3"></span></td>
							<td><span class="style3"></span></td>
						</tr>
						<% 
				}catch(Exception e){
					out.print(e);
				}
				%>
			</table>
			</p>
				<div align="center"><a href="ahome.jsp" class="style10">Back</a> </div>
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
