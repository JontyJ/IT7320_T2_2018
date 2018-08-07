package Nogur;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetImageServlet
 */
public class GetImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("imgid"));
		InputStream inputStream = null;
		
		try {
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
				 response.reset();
				 response.getOutputStream().write(bytes, 0, len);
			 }
			  
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
