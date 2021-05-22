package practice;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deletePost")
public class deletePost extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int post_id = Integer.parseInt(request.getParameter("post_id"));
		String author = request.getParameter("postAuthor");
		postClass post_to_delete = new postClass(post_id, author);
		connection conn = null;
		try {
			 conn = new connection();
		} catch (Exception e) {
			out.println(e.getMessage());
		} 
		try {
			conn.deletePost(post_to_delete);
		} catch (Exception e) {
			out.println(e.getMessage());
		}
		response.sendRedirect("Post.jsp");
	}
	
}
