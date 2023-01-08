<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream,java.math.*"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String okey = (String)application.getAttribute("okey");	
	String uname = (String)application.getAttribute("oname");
	String rby = request.getParameter("reqby");
	String fname = request.getParameter("fname");
	try{
	
	
	KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
		Cipher encoder = Cipher.getInstance("RSA");
		KeyPair kp = kg.generateKeyPair();

		Key pubKey = kp.getPublic();

		byte[] pub = pubKey.getEncoded();
		//				System.out.println("PUBLIC KEY" + pub);

		String pk = String.valueOf(pub);
	
	
		String query = "SELECT * FROM webserver WHERE fname='"+fname+"' AND uname='"+uname+"'";
		ResultSet res = conn.createStatement().executeQuery(query);
		if(res.next()){			
			String skey = res.getString(4);		
			out.println("try");
			out.println(skey+" "+okey);
			try{
				String approveQ1 = "UPDATE requests SET stat='"+pk+"' WHERE reqby='"+rby+"' and fname='"+fname+"'";
				
				conn.createStatement().executeUpdate(approveQ1);
				
				
				String approveQ11 = "UPDATE webserver SET sk='"+pk+"' WHERE fname='"+fname+"'";
				
				conn.createStatement().executeUpdate(approveQ11);
				
				response.sendRedirect("orequests.jsp");
			}catch(Exception e){
				
			}
		}
	}catch(Exception e){
		
	}
%>
</body>
</html>