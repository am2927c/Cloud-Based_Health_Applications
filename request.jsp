<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title> Request </title>
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
.style10 {
	font-size: 18px;
	color: #000000;
}
.style13 {font-size: 16px; color: #000000; }
.style15 {font-size: 14px; color: #000000; }
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
          <li><a href="uhome.jsp"><span>Home Page</span></a></li>
			<li><a href="search.html">Search</a></li>
           	<li class="active"><a href="request.html">Request Key</a></li>
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
		
		
			<%
			String rfname = request.getParameter("fname");
			String runame = (String)application.getAttribute("uname");
			try{
				Statement stat = conn.createStatement();
				String query = "SELECT * FROM webserver WHERE fname='"+rfname+"'";
				ResultSet res = stat.executeQuery(query);
				while(res.next())
				{
					String uname = res.getString(1);
					String fname = res.getString(2);
					String date = res.getString(6);
					
					if(fname.equals(rfname))
					{
						Statement istat = conn.createStatement();
						String iquery = "SELECT * FROM requests WHERE reqby='"+runame+"' AND reqto='"+uname+"' AND fname='"+rfname+"'";
						ResultSet ires = istat.executeQuery(iquery);
						if(ires.next())
						{
							response.sendRedirect("sorry.html");
						}else
						{
							String okey = null;
							String status="pending";
							Statement nstat = conn.createStatement();
							String insertQ = "INSERT INTO requests VALUES('"+runame+"','"+uname+"','"+rfname+"','"+status+"','"+okey+"')";
							nstat.executeUpdate(insertQ);
							response.sendRedirect("success.jsp");
						}
					}else{
						response.sendRedirect("sorry.html");
					}
				}
			}catch(Exception e){
			
			}
			%>
		
     
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