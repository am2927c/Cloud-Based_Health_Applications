<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.bouncycastle.util.encoders.Base64"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Search</title>
<%@include file="connect.jsp"%>
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
.style16 {font-size: 16px}
.style18 {font-size: 18px}
.style8 {font-size: 12px;
	color: #FF0000;
	font-weight: bold;
	font-style: italic;
}
-->
</style>
<script type='text/javascript'>

function saveTextAsFile()
{
	var textToWrite = document.getElementById("textarea").value;
	var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
	var fileNameToSaveAs = "File.txt";

	var downloadLink = document.createElement("a");
	downloadLink.download = fileNameToSaveAs;
	downloadLink.innerHTML = "Download File";
	if (window.webkitURL != null)
	{
		// Chrome allows the link to be clicked
		// without actually adding it to the DOM.
		downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
	}
	else
	{
		// Firefox requires the link to be added to the DOM
		// before it can be clicked.
		downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
		downloadLink.onclick = destroyClickedElement;
		downloadLink.style.display = "none";
		document.body.appendChild(downloadLink);
	}

	downloadLink.click();
}

function destroyClickedElement(event)
{
	document.body.removeChild(event.target);
}
</script>
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
			<li><a href="search.html">Search</a></li>
           	<li><a href="request.html">Request Key</a></li>
           	<li class="active"><a href="reqfile.html">Request File</a></li>
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
        <p align="center" class="style10">Search Result</p>
		
			<%
			
			String rfname = request.getParameter("rfname");
			String rskey = request.getParameter("rskey");
			
			String rutype = (String)application.getAttribute("category");
			String runame = (String)application.getAttribute("uname");
		
			String okey;
			try{
			
		
				String query;
				query = "SELECT * FROM requests WHERE reqby='"+runame+"' and fname='"+rfname+"' and stat='"+rskey+"'";
				ResultSet res;
				res = conn.createStatement().executeQuery(query);
				if(res.next()){
					
				
				
				query = "SELECT * FROM webserver WHERE fname='"+rfname+"' AND sk='"+rskey+"'";
				ResultSet res1;
				res = conn.createStatement().executeQuery(query);
				if(res.next()){
					String cont = res.getString(3);
					String decryptedcont = new String(Base64.decode(cont.getBytes()));
					
					
					
					int rank = Integer.valueOf(res.getString(5));
					rank++;
					
					SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
					SimpleDateFormat stf = new SimpleDateFormat("HH:mm:ss");
					Date now = new Date();
					String sdate = sdf.format(now);
					String stime = stf.format(now);
					String date = sdate+" "+stime;
					
					String task="Download";
					String insertT = "INSERT INTO transactions VALUES('"+runame+"','"+rutype+"','"+rfname+"','"+rskey+"','"+task+"','"+date+"')";
					String updateR = "UPDATE webserver SET rank='"+String.valueOf(rank)+"' WHERE fname='"+rfname+"' AND sk='"+rskey+"'";
					
					Statement istat = conn.createStatement();
					Statement ustat = conn.createStatement();
					
					istat.executeUpdate(insertT);
					ustat.executeUpdate(updateR);
					
					%><p align="center" class="style10">File Contents</p>
					  <label>
				      	<div align="center">
				        <textarea name="text" id="textarea" cols="45" rows="17"><%=decryptedcont%></textarea>
				        <p><a href="reqfile.html" class="style16">Back</a></p>
				        <br/>
				      	<button onClick="saveTextAsFile()"><span class="style3">Download</span></button>
			            </div>
			          </label><%	
				}else{
					SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
					SimpleDateFormat stf = new SimpleDateFormat("HH:mm:ss");
					Date now = new Date();
					String sdate = sdf.format(now);
					String stime = stf.format(now);
					String date = sdate+" "+stime;
					
					String task="Attack";
					String insertT = "INSERT INTO transactions VALUES('"+runame+"','"+rutype+"','"+rfname+"','"+rskey+"','"+task+"','"+date+"')";
					
					Statement astat = conn.createStatement();
					astat.executeUpdate(insertT);
					%><p>
					  	<h1 align="center" class="style1 style10">File Does Not Exist!</h1>
					  </p>
					  <br/>
					  <p align="center"><a href="reqfile.html" class="style18">Back</a></p>
					  <%
				}
				
				}
				
				else
				{
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
					SimpleDateFormat stf = new SimpleDateFormat("HH:mm:ss");
					Date now = new Date();
					String sdate = sdf.format(now);
					String stime = stf.format(now);
					String date = sdate+" "+stime;
					
					String task="Attack";
					String insertT = "INSERT INTO transactions VALUES('"+runame+"','"+rutype+"','"+rfname+"','"+rskey+"','"+task+"','"+date+"')";
					
					Statement astat = conn.createStatement();
					astat.executeUpdate(insertT);
					%><p>
					  	<h1 align="center" class="style1 style10">You Are Attacker!!! OR REQUEST SECRET KEY </h1>
					  </p>
					  <br/>
					  <p align="center"><a href="reqfile.html" class="style18">Back</a></p>
					  <%
				
				
				
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