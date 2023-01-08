<title>Insert File Details</title>
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

         long stime=System.currentTimeMillis();

                  String file = request.getParameter("fname");
                  String cont = request.getParameter("cont");
				   String rname = request.getParameter("fname");
				   String pname = request.getParameter("pname");
				   				   String age = request.getParameter("textfield");
				  				   String padd= request.getParameter("textfield2");
				  				   String pmno = request.getParameter("textfield3");
								   String sym = request.getParameter("textfield4");
								   String disease = request.getParameter("textfield5");
						           String ltest = request.getParameter("textfield6");
								   String presult = request.getParameter("textfield7");
																   
								   
								   
		    String content=cont;

      		String h1="";
      		String filename="filename.txt";
      		
      		String keys = "ef50a0ef2c3e3a5f";
			byte[] keyValue = keys.getBytes();
      		Key key = new SecretKeySpec(keyValue,"AES");
      		Cipher c = Cipher.getInstance("AES");
      		c.init(Cipher.ENCRYPT_MODE, key);
			String encryptedValue = new String(Base64.encode(content.getBytes()));
			String encryptedValue1 = new String(Base64.encode(age.getBytes()));
			String encryptedValue2 = new String(Base64.encode(padd.getBytes()));
			String encryptedValue3 = new String(Base64.encode(pmno.getBytes()));
			String encryptedValue4 = new String(Base64.encode(sym.getBytes()));
			String encryptedValue5 = new String(Base64.encode(disease.getBytes()));
			String encryptedValue6 = new String(Base64.encode(ltest.getBytes()));
			String encryptedValue7 = new String(Base64.encode(presult.getBytes()));
			
		
      		PrintStream p = new PrintStream(new FileOutputStream(filename));
			p.print(new String(cont));	
			MessageDigest md = MessageDigest.getInstance("SHA1");
			FileInputStream fis11 = new FileInputStream(filename);
			DigestInputStream dis1 = new DigestInputStream(fis11, md);
			BufferedInputStream bis1 = new BufferedInputStream(dis1);
 
			
			while(true){
				int b1 = bis1.read();
				if(b1==-1)
					break;
			}
 
			BigInteger bi1 = new BigInteger(md.digest());
			String spl1 = bi1.toString();
			h1 = bi1.toString(16);
			
			
      		
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

		Date now = new Date();

		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt = strDate+" "+strTime;
			
   		KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
		Cipher encoder = Cipher.getInstance("RSA");
		KeyPair kp = kg.generateKeyPair();

		Key pubKey = kp.getPublic();

		byte[] pub = pubKey.getEncoded();
		System.out.println("PUBLIC KEY" + pub);
		
		String rank = "0";
	
		String uname = (String)application.getAttribute("oname");
	 	String otype="Owner";
		String task="Upload";
		String skGen="User";	
        String pk="Not Generated";	

String transQuery = "INSERT INTO transactions(uname,utype,fname,sk,task,dt) values('"+uname+"','"+otype+"','"+file+"','"+pk+"','"+task+"','"+dt+"')";
	conn.createStatement().executeUpdate(transQuery);
		
String insertQuery = "INSERT INTO webserver(uname,fname,content,sk,rank,dt,pname,age,padd,pmno,psym,pdisease,ptest,presult) values ('"+uname+"','"+file+"','"+encryptedValue+"','"+pk+"','"+rank+"','"+dt+"','"+pname+"','"+encryptedValue1+"','"+encryptedValue2+"','"+encryptedValue3+"','"+encryptedValue4+"','"+encryptedValue5+"','"+encryptedValue6+"','"+encryptedValue7+"')";		

	conn.createStatement().executeUpdate(insertQuery);
		String keyQuery ="INSERT INTO secretkeys VALUES('"+file+"','"+dt+"','"+pk+"','"+skGen+"')";
		conn.createStatement().executeUpdate(keyQuery);
		
		
		long etime=System.currentTimeMillis();
					long ttime = etime-stime;
					long tpt=((cont.length())/ttime)*1024;
					
					Statement st1=conn.createStatement();
					st1.executeUpdate("insert into  results values ('"+file+"','"+ttime+"','"+tpt+"')"); 
			
		
		
		
		
		%>
		
		<h2> Patient Details Added To E Government Cloud Storage Server !!!</br><a href="ohome.jsp">Back</a></h2>
		
		<%
			
%>