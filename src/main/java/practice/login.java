package practice;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 PrintWriter out = response.getWriter(); 
		 String username = (String) request.getParameter("username");
		 String pass = (String) request.getParameter("password");
		
		 String password = security.hashPass(pass);
		 String current_user = null;
		 if(password != null)
		 {
			 User user = new User(username, password);
			 try {
				connection conn = new connection();
				current_user = conn.getUser(user);
				HttpSession session = request.getSession();
				 session.setAttribute("username", current_user);
				 response.sendRedirect("post");
			} catch (Exception e) {
				out.println("Exception ocuured in doPost");
				out.println(e.getMessage());
				
			}
			 
		 }else {
			 out.print("<h2> Please enter password </h2>"); 
		 }
		 
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
 
		 String username = (String) request.getParameter("username");
		 if(username != null)
		 {
			 response.sendRedirect("Post.jsp");
		 }
		
	}
}
