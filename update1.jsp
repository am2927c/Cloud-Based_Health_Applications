 <%@ include file="connect.jsp" %>
 <%@ page import ="java.util.Date" %>
 <%@ page import ="java.security.Key" %>
 <%@ page import ="javax.crypto.Cipher" %> 
 <%@ page import ="javax.crypto.Cipher" %> 
 <%@ page import ="java.math.BigInteger" %>
 <%@ page import ="java.text.SimpleDateFormat" %>
 <%@ page import ="javax.crypto.spec.SecretKeySpec" %>
 <%@ page import ="org.bouncycastle.util.encoders.Base64" %>
 <%@ page import ="java.security.KeyPairGenerator,java.security.KeyPair,java.security.Key" %>
 <%@ page import ="java.security.MessageDigest,java.security.DigestInputStream" %>
 <%@ page import ="java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.io.BufferedInputStream" %>

<%

        String key = request.getParameter("key");
		String fname = request.getParameter("fname");
	
		
		
		
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		Date now = new Date();
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt = strDate/*+" "+strTime*/; //7
		
        KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
		Cipher encoder = Cipher.getInstance("RSA");
		KeyPair kp = kg.generateKeyPair();
		Key pubKey = kp.getPublic();
		byte[] pub = pubKey.getEncoded();
		System.out.println("PUBLIC KEY" + pub); // keyupdate='"+dt+"'
		
		String pk = String.valueOf(pub);
		
		
		String str =  "update webserver set sk='"+pk+"' where fname='"+fname+"' ";
		conn.createStatement().executeUpdate(str);
		
		String str2 =  "update webserver set keyupdate='"+dt+"' where fname='"+fname+"' ";
		conn.createStatement().executeUpdate(str2); 
		
		String str1 = "insert into stateless(fname,sk) values('"+fname+"','"+key+"')";
		conn.createStatement().executeUpdate(str1); 
		response.sendRedirect("update.jsp");
		
%>

