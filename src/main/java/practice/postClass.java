package practice;

import java.sql.Date;

public class postClass{
	private int post_id;
	private String author;
	private Date postDate ;
	String content;
	int likes, dislikes;
	public postClass(String author, String content, int likes, int dislikes) {
		super();
		this.author = author;
		this.postDate = convertDate(new java.util.Date());
		this.content = content;
		this.likes = likes;
		this.dislikes = dislikes;
	}
	
	public postClass(int post_id, String author) {
		super();
		this.post_id = post_id;
		this.author = author;
	}
	
	public int getPost_id() {
		return post_id;
	}
	
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public String getAuthor() {
		return author;
	}
	public Date getPostDate() {
		return postDate;
	}
	public String getContent() {
		return content;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes += likes;
	}
	public int getDislikes() {
		return dislikes;
	}
	public void setDislikes(int dislikes) {
		this.dislikes += dislikes;
	}
	
	private java.sql.Date convertDate(java.util.Date date)
	{
		return new java.sql.Date(date.getTime());
	}
	
}