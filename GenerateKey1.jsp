<%@ page import="java.sql.*,java.util.Random,java.security.KeyPair,java.security.KeyPairGenerator,java.security.NoSuchAlgorithmException,java.security.PublicKey,javax.crypto.Cipher,javax.crypto.NoSuchPaddingException" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ include file = "connect.jsp" %>




<html><style type="text/css">
<!--
body {
	background-color: #FFFFFF;
}
-->
</style>
<body>
<center>&nbsp;</center>
<br><br><br>
  <%
  		   String fname = request.getParameter("fname");
		  
          
  
  
   try {
	   
		 KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA"); 
		 Cipher encoder = Cipher.getInstance("RSA"); 
		 KeyPair kp = kg.generateKeyPair(); 
		 PublicKey pubKey = kp.getPublic(); 
		 
		 // RSA produces 1024 bits Key
		 
		byte[] pub = pubKey.getEncoded();
		String s = pub.toString();
		
     	String str="Yes";

       Statement st1 = conn.createStatement();
       String query1 ="update webserver set sk='"+s+"' where fname='"+fname+"' ";
       st1.executeUpdate (query1);
	  
	 Statement st11 = conn.createStatement();
       String query11 ="update transactions set sk='"+s+"' where fname='"+fname+"' ";
       st11.executeUpdate (query11);
	  
	Statement st111 = conn.createStatement();
       String query111 ="update secretkeys set aeskey='"+s+"' where fname='"+fname+"' ";
       st111.executeUpdate (query111);
	  
	   
           
	   conn.close();




	       
          
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());

          }
   
   
   response.sendRedirect("pkggeneratekey.jsp");
		 
		  
		  
%>



</body></html>