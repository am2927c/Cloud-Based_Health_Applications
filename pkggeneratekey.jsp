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
.style15 {color: #FFFF00; font-size: 16px; }
.style16 {color: #FF0000; font-size: 14px; }
.style17 {
	color: #FF0000;
	font-weight: bold;
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
      
      <h2 align="center" class="style17">View and Generate Public  Key!!!</h2>
      <p>&nbsp;</p>
      <table width="744" border="1" align="center">
              <tr>
                <td width="110" height="30" bgcolor="#FF0000"><div align="center" class="style15"><span class="style11">Owner name </span></div></td>
                <td width="126" bgcolor="#FF0000"><div align="center" class="style15"><span class="style11">Patient Name </span></div></td>
				<td width="110" bgcolor="#FF0000"><div align="center" class="style15"><span class="style11"><strong>Public </strong> Key</span></div></td>
                <td width="143" bgcolor="#FF0000"><div align="center" class="style15"><span class="style11">Rank</span></div></td>
                <td width="141" bgcolor="#FF0000"><div align="center" class="style15"><span class="style11">Uploaded date </span></div></td>
              </tr>
                <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;

      	try 
	{
        	
      		String query="select * from webserver"; 
           Statement st=conn.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		s1=rs.getString(1);
		s2=rs.getString(2);
		s3=rs.getString(4);
		s4=rs.getString(5);
		s5=rs.getString(6);
		
		%>
              
              <tr>
                <td height="53"><div align="center" class="style16"><%=s1%></div></td>
                <td><div align="center" class="style16"><%=s2%></div></td>
				<%
				if(s3.equalsIgnoreCase("Not Generated"))
			{%>
             
			    <td><div class="style16">
                  <div align="center"><a href="GenerateKey1.jsp?fname=<%=s2%>"><%=s3%></a></div>
                </div></td>
            
              <%
		
			}else
			{
		%>  <td><div class="style16"><div align="center"><%=s3%></div>
                </div></td>
              
			  <%
			  }

%>				
				<td><div align="center" class="style16"><%=s4%></div></td>
				<td width="74"><div align="center" class="style16"><%=s5%></div></td> </tr>
                <%	
				  }
           conn.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
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
