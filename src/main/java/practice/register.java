package practice;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String username = (String) request.getParameter("username");
		 String email = (String) request.getParameter("email");
		 String pass = (String) request.getParameter("password");
		 String con_pass = (String) request.getParameter("confirm_password");
		 PrintWriter out = response.getWriter();
		 if(con_pass.equals(pass) == false)
		 {
			 out.print("<h2> Passwords do not match</h2>");
		 }else {
			 String password = security.hashPass(pass);
			 if(password != null)
			 {
				 User user = new User(username, email, password);
				 try {
					connection conn = new connection();
					conn.insertUser(user);
					response.sendRedirect("Login.jsp");
				} catch (Exception e) {
					out.println("Exception ocuured");
					out.println(e.getMessage());
//					out.println("<br>");
				}
				 
			 }else {
				 out.print("<h2> Please enter password </h2>"); 
			 }
		 }
		
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}

