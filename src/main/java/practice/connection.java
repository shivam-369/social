package practice;
import java.sql.*;

public class connection {

	Connection conn;
	static final String username = "root";
	static final  String pass = "";
	static final  String url = "jdbc:mysql://localhost:3306/social";
	public connection() throws ClassNotFoundException, SQLException {
		super();
		Class.forName("com.mysql.cj.jdbc.Driver");
		this.conn = DriverManager.getConnection(url, username, pass);
	}
	
	public void insertUser(User user) throws Exception
	{
		String query = "Insert into users(username, email, password) values(?,?,?)";
		PreparedStatement st = conn.prepareStatement(query);
		st.setString(1, user.getUsername());
		st.setString(2, user.getEmail());
		st.setString(3, user.getPassword());
		int count = st.executeUpdate();
		System.out.println(count + " rows affected");
		st.close();
	}
	
	public String getUser(User user) throws Exception
	{
		String query = "Select * from users where username = ? and password = ?";
		PreparedStatement st = conn.prepareStatement(query);
		st.setString(1, user.getUsername());
		st.setString(2, user.getPassword());
		ResultSet rs = st.executeQuery();
		String username = null;
		if(rs.next()) {
			username = rs.getString("username");
			st.close();
		}
		return username;
	}
	
	public void addPost(postClass post) throws Exception
	{
		String query = "insert into posts(author, date, likes, dislikes, content) values (?, ?, ?, ?, ?)";
		PreparedStatement st = conn.prepareStatement(query);
		st.setString(1, post.getAuthor());
		st.setDate(2, post.getPostDate());
		st.setInt(3, 0);
		st.setInt(4, 0);
		st.setString(5, post.getContent());
		st.executeUpdate();
		st.close();
	}
	
	public void deletePost(postClass post) throws Exception
	{
		String query = "DELETE FROM posts WHERE post_id = " + post.getPost_id();
		Statement st = conn.createStatement();
		st.executeUpdate(query);
		st.close();
	}
	
	public void deleteAccount(String user) throws Exception
	{	
		String idQuery = "DELETE FROM Users WHERE username = ?"; 
		PreparedStatement st = conn.prepareStatement(idQuery);
		st.setString(1, user);
		st.executeUpdate();
		st.close();
	}
	
	public void updateLike(int postId, String user) throws Exception
	{
		String call = "{CALL UpdateLikes(?, ?)}";
		CallableStatement st = conn.prepareCall(call);
		st.setInt(1, postId);
		st.setString(2, user);
		st.executeUpdate();
	}
	public void updateDislike(int postId, String user) throws Exception
	{
		String call = "{CALL UpdateDislikes(?, ?)}";
		CallableStatement st = conn.prepareCall(call);
		st.setInt(1, postId);
		st.setString(2, user);
		st.executeUpdate();
	}
}
