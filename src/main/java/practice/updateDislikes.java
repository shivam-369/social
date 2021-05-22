package practice;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateDislikes")
public class updateDislikes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int postId = Integer.parseInt(request.getParameter("post_id"));
		String user = request.getParameter("disliker");
		connection conn;
		try {
			 conn = new connection();
			 conn.updateDislike(postId, user);
			 response.sendRedirect("Post.jsp");
		} catch (Exception e) {
//			out.println("inside error");
			out.println(e.getMessage());
		} 

	}

}
