
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ include file = "connect.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Trusted Authority:: IBE</title>
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
.style10 {font-size: 12px;
	color: #FF0000;
	font-weight: bold;
	font-style: italic;
}
.style14 {color: #FFFFFF; font-weight: bold; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="searchform">      </div>
      <div class="logo">
        <h1><a href="index.html"><span class="style10">A Secure G-Cloud-Based Framework for Government Healthcare Services</span></a></h1>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          <li><a href="index.html"><span>Home Page</span></a></li>
          <li><a href="admin.html"><span>EGovt Cloud</span></a></li>
          <li><a href="dataowner.html"><span>HSP</span></a></li>
          <li><a href="user.html"><span>Patient</span></a></li>
          <li class="active"><a href="about.html"><span>Trusted Authority</span></a></li>
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
      
      <h2><strong>View all Patient Details !!! </strong></h2>
      <p>&nbsp;</p>
      <table width="885" border=1 align="center" cellpadding="10" cellspacing="0">
				<tr>
				    <td width="42" bgcolor="#FF0000"><span class="style14">SNo</span></td>
					<td width="48" bgcolor="#FF0000"><span class="style14">Report</span></td>
					<td width="76" bgcolor="#FF0000"><span class="style14">Upload Date</span></td>	
					<td width="69" bgcolor="#FF0000"><span class="style14">Secret Key</span></td>				
					<td width="53" bgcolor="#FF0000"><span class="style14">Patient Name</span></td>
					<td width="33" bgcolor="#FF0000"><span class="style14">Age</span></td>
					<td width="107" bgcolor="#FF0000"><span class="style14">Address</span></td>
					<td width="48" bgcolor="#FF0000"><span class="style14">Mobile</span></td>
					<td width="62" bgcolor="#FF0000"><span class="style14">Symtoms</span></td>
					<td width="56" bgcolor="#FF0000"><span class="style14">Disease</span></td>
					<td width="30" bgcolor="#FF0000"><span class="style14">Test</span></td>
					<td width="70" bgcolor="#FF0000"><span class="style14">Result</span></td>
				</tr>
				<%
				try{
					String oname = (String)application.getAttribute("oname");
					Statement stat = conn.createStatement();
					
					String query = "";
					
						query = "SELECT * FROM webserver";
			
					ResultSet result = stat.executeQuery(query);
					int count=0;
					while(result.next()){
					count=count+1;
						String fname = result.getString(2);
						String fuloader = result.getString(1);
						String date = result.getString(6);
						
						String rank = result.getString(5);
						String sk = result.getString(4);
						String udat = result.getString(6);
						String pname = result.getString(7);
						String age = result.getString(8);
						String padd = result.getString(9);
						String mno = result.getString(10);
						String sym = result.getString(11);
						String disease = result.getString(12);
						String ptest = result.getString(13);
						String presult = result.getString(14);
						
						%>
						<tr>
							<td bgcolor="#000000"><span class="style14"><%=count%></span></td>
							<td bgcolor="#000000"><span class="style14"><%=fname%></span></td>
							<td bgcolor="#000000"><span class="style14"><%=date%></span></td>
							<td bgcolor="#000000"><span class="style14"><%=sk%></span></td>
							<td bgcolor="#000000"><span class="style14"><%=pname%></span></td>
							<td bgcolor="#000000"><span class="style14"><%=age%></span></td>
							<td bgcolor="#000000"><span class="style14"><textarea cols="15" rows="5"><%=padd%></textarea></span></td>
							<td bgcolor="#000000"><span class="style14"><%=mno%></span></td>
							<td bgcolor="#000000"><span class="style14"><%=sym%></span></td>
							<td bgcolor="#000000"><span class="style14"><%=disease%></span></td>
							<td bgcolor="#000000"><span class="style14"><%=ptest%></span></td>
							<td bgcolor="#000000"><span class="style14"><%=presult%></span></td>
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
      		 
      		  		<p><a href="pkgmain.jsp" class="style7">Home</a></p>
      		</p>
      <p>&nbsp;</p>
      <p>&nbsp; </p>
      <p>&nbsp;</p>
      <div class="clr"></div>
        
      <div class="clr"></div>
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
