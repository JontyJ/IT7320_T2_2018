<%@ page import="java.sql.*,java.io.*,java.util.*" %> 
<%
  int id =  Integer.parseInt(request.getParameter("imgid"));
  InputStream inputStream;
  
  try{ 
	  
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_images","root","");
	  PreparedStatement stmt = con.prepareStatement("select image_file from images where id=" + id);
	  ResultSet rs = stmt.executeQuery();
	 
	  if( rs.next()) {
		  
		     String imageLength = rs.getString(1);
			 int len = imageLength.length();
			 byte[] bytes = new byte[len];
			 inputStream = rs.getBinaryStream(1);
			 stmt.close();
			 int index = inputStream.read(bytes, 0, len);
			 response.reset();
			 response.getOutputStream().write(bytes, 0, len);
		 }
  }
  
  catch (Exception e){
    e.printStackTrace();
  }
%>