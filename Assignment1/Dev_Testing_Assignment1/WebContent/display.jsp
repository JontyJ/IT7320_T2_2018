<%@ page import="java.sql.*,java.io.*,java.util.*" %> 
<HTML>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Nogur</title>
	<link rel="stylesheet" type="text/css" href="display.css" />
	<link rel="stylesheet" type="text/css" href="mainStyle.css" />
</head>

	<div id="NogurTitle">
		<h1>Nogur</h1>
		<p>The number 2 image sharing and voting site</p>
	</div>

 <table border="1">
 <tr><th id="idHeader">ID</th><th>Image</th><th>Upvotes</th><th>Image Name</th><th id="userNameHeader">Submitted by</th></tr>
   <%
  try{      
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_images","root","");
    	Statement stmt=con.createStatement();
    	String strQuery = "select * from images";
    	ResultSet rs = stmt.executeQuery(strQuery);
    	while(rs.next()){
       %>
      <tr>
      <td><%=rs.getInt("id")%></td>
       
      <td>
      <img src="GetImageServlet?imgid=<%=rs.getInt(1)%>" width="150" height="150">
      <td><%=rs.getInt("upvotes")%></td>
      <td><%=rs.getString("image_name")%></td>
      <td><%=rs.getString("user_name")%></td>
</a></td>
      </tr>
      <%
    }
    rs.close();
    con.close();
    stmt.close();
  }
  catch(Exception e)
  {
    e.getMessage();
  }
  %>
 </table>
</HTML>