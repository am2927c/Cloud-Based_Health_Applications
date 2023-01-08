<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="connect.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>

<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<html xmlns="http://www.w3.org/1999/xhtml">
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
.style5 {font-size: 18px}
.style7 {font-size: 18px; color: #000000; }
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
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="searchform">      </div>
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
    
        
<%
	int count=0;
	try{		
		int flag = Integer.parseInt(request.getParameter("flag"));
		String uname = (String)application.getAttribute("uname");
		String query = "SELECT * FROM webserver WHERE uname='"+uname+"'";
		ResultSet res = conn.createStatement().executeQuery(query);
		%><table align="center" cellpadding="5">
		<%if(flag==1){%> 
		<tr>
			<td><div align="center"><span class="style7 style5">Owner Key Updated</span></div></td>
		</tr>
		<%}%>
		<p>&nbsp;</p>		
		<%
		while(res.next()){
			String file = res.getString(2);
			String update = res.getString(7);
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat stf = new SimpleDateFormat("HH:mm:ss");
			Date now = new Date();
			String dt = sdf.format(now);
			String dt1 = stf.format(now);
			String dt3 = dt+" "+dt1;
			//out.println("YOLO "+dt);
			if(update.equals(dt)){
				count++;
				%>
				<form method="post" action="newupdate.jsp">
				<input type="text" name="olddate" value=<%=update%> hidden></td>
				<%				
		   		KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
				Cipher encoder = Cipher.getInstance("RSA");
				KeyPair kp = kg.generateKeyPair();

				Key pubKey = kp.getPublic();

				byte[] pub = pubKey.getEncoded();
				System.out.println("PUBLIC KEY" + pub);
				String pk = String.valueOf(pub);
				
				String skGen = "Auto Updated";
				String updateQ = "UPDATE webserver SET sk='"+pk+"' WHERE fname='"+file+"'";
				String updatesk = "INSERT INTO secretkeys VALUES('"+file+"','"+dt3+"','"+pk+"','"+skGen+"')";
				conn.createStatement().executeUpdate(updateQ);
				%>	
					<tr>
						<td><div align="center">
						  <input type="text" name="file" value=<%=file%> disabled>
						  </div></td>
					</tr>
				<%
			}
		}
		//response.sendRedirect("ohome.jsp");
	}catch(Exception e){
		
	}
	
%>
<tr>
	<td><div align="center">
	  <input type="text" name="newdate" placeholder="DD/MM/YYYY">
	  </div></td>
</tr>
<tr>
	<td><div align="center">
	  <input type="submit" value="Submit">
	  </div></td>
</tr>
</form>
</table>
<p>&nbsp;</p>
<div align="center" class="style8">
	<%if(count>0){%>  
  		<p class="style5"><%=count%> files were updated! Enter new Date.</p>
  		<p>&nbsp;</p>
	<%}else{%>
		<p class="style5">No files were updated</p>
  		<p>&nbsp;</p>	
	<%}%>
	
</div>
<div align="center"><a href="ohome.jsp" class="style5">Home</a></div>
    </div>
  </div>
      <div class="clr"></div>
</div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2 class="style2">&nbsp;</h2>
      </div>
      <div class="col c2 style1">
        <h2 class="style2">.</h2>
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