package practice;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/deleteAccount")
public class deleteAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String username = request.getParameter("userToDelete");
		try {
			connection conn = new connection();
			
			conn.deleteAccount(username);
			response.sendRedirect("Login.jsp");
		} catch (Exception e) {
			out.println(e.getMessage());
		}
		
	}

}
