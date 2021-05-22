package practice;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/makePost")
public class makePost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String author = (String) session.getAttribute("username");
		String postContent = request.getParameter("PostContent");
		postClass post = new postClass(author, postContent, 0, 0);
		connection conn;
		try {
			conn = new connection();
			conn.addPost(post);
			response.sendRedirect("Post.jsp");
		} catch (Exception e) {
			
			out.println(e.getMessage());
		} 
		
	}

}
