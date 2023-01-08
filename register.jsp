<title>Login |User</title>
<%@page	import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp"%>
<%@ include file="32bitkeygen.jsp"%>
<%@ page import="java.util.Date"%>
<%@	page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>

<%
	ArrayList list = new ArrayList();
	ServletContext context = getServletContext();
	String dirName = context.getRealPath("Gallery/");
	
	String file=null;
	String image=null;
	String bin = "";
	
	String paramname=null;
	String fullName=null,userName=null,passWord=null,eMail=null,mobile=null,address=null,dob=null,gender=null,oType=null,userPic=null,okeyup=null;
	String sk="Rejected";
	
	FileInputStream fs=null;
	File imagefile = null;	
	
	try{
		MultipartRequest multi = new MultipartRequest(request,dirName,10*1024*1024);//10MB
		Enumeration params = multi.getParameterNames();
		while(params.hasMoreElements()){
			paramname = (String)params.nextElement();
			if(paramname.equalsIgnoreCase("fullname")){
				fullName=multi.getParameter(paramname);
			}
			if(paramname.equalsIgnoreCase("username")){
				userName=multi.getParameter(paramname);
			}
			if(paramname.equalsIgnoreCase("password")){
				passWord=multi.getParameter(paramname);
			}
			if(paramname.equalsIgnoreCase("email")){
				eMail=multi.getParameter(paramname);
			}
			if(paramname.equalsIgnoreCase("mobile")){
				mobile=multi.getParameter(paramname);
			}
			if(paramname.equalsIgnoreCase("address")){
				address=multi.getParameter(paramname);
			} 
			if(paramname.equalsIgnoreCase("dob")){
				dob=multi.getParameter(paramname);
			}
			if(paramname.equalsIgnoreCase("gender")){
				gender=multi.getParameter(paramname);
			}
			if(paramname.equalsIgnoreCase("otype")){
				oType=multi.getParameter(paramname);
			}
			if(paramname.equalsIgnoreCase("userpic")){
				userPic=multi.getParameter(paramname);
			}
			
		}
							
		int flag = 0;
		Enumeration files = multi.getFileNames();	
		while(files.hasMoreElements()){
			paramname = (String)files.nextElement();
			
			if(paramname.equals("d1")){
				paramname = null;
			}
							
			if(paramname!=null){
				flag = 1;
				image = multi.getFilesystemName(paramname);
				String fPath = context.getRealPath("Gallery\\"+image);
				
				imagefile = new File(fPath);
				fs = new FileInputStream(imagefile);
				list.add(fs);	
			}		
		}
		
		FileInputStream fs1 = null;
		String query1="SELECT * FROM users WHERE username='"+userName+"'"; 
		
		Statement checkStat = conn.createStatement();
		ResultSet checkRes = checkStat.executeQuery(query1);
		
		if(checkRes.next()){
			response.sendRedirect("sorry.html");
		}
		
		else{
			PreparedStatement ps=conn.prepareStatement("INSERT INTO users(fullname,username,pword,email,mobile,address,dob,gender,otype,userpic) VALUES(?,?,?,?,?,?,?,?,?,?)");
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			Date now = new Date();
			String dt = sdf.format(now);
			String task = "New";
			String current = "Current";
			String keyQuery = "INSERT INTO okey values('"+userName+"','"+key+"','"+dt+"','"+task+"','"+current+"')";
			conn.createStatement().executeUpdate(keyQuery);
			ps.setString(1,fullName);
			ps.setString(2,userName);
			ps.setString(3,passWord);	
			ps.setString(4,eMail);
			ps.setString(5,mobile);
			ps.setString(6,address);
			ps.setString(7,dob);
			ps.setString(8,gender);
			ps.setString(9,oType);
			
			
			if(flag == 0)
				ps.setObject(10,null);
			else if(flag == 1){
				fs1 = (FileInputStream)list.get(0);
				ps.setBinaryStream(10,fs1,fs1.available());
			}	
						
			int x=ps.executeUpdate();
			if(x>0){
				response.sendRedirect("addsuccess.html");
			}
		}
	}catch(Exception e){
		out.println(e.getMessage());
	}
%>