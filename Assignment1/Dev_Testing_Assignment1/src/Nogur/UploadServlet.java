package Nogur;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class UploadServlet
 */
@MultipartConfig(maxFileSize = 10177215)
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//getting values from the upload form
		String userName = request.getParameter("userName");
		String imageName = request.getParameter("imageName");
		int upvotes = 1;
		String result = "";
		InputStream inputStream = null;
		Part filePart = request.getPart("image");
		
		//gets the input stream if the file isn't empty
		if( filePart != null) {
			inputStream = filePart.getInputStream();
		}			
		
		try {
				//Connecting to database
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_images","root","");
				PreparedStatement stmt = con.prepareStatement("insert into images(user_name,image_name, image_file, upvotes) values(?,?,?,?)");
			
				//Uploading to the database
				stmt.setString(1, userName);
				stmt.setString(2, imageName);
				stmt.setBlob(3, inputStream);
				stmt.setInt(4, upvotes);
				stmt.executeUpdate();
				stmt.close();
				con.close();
				result = "Success"; 
			
				
		}catch(Exception e){ System.out.println(e);}  
	
         // forwards to the result 
		request.setAttribute("Result", result);
         getServletContext().getRequestDispatcher("/Success.jsp").forward(request, response);
	}

}
