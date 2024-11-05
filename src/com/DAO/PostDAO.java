package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.User.Post;
import com.User.UserDetails;

public class PostDAO {
	private Connection conn;

	public PostDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean AddNotes(String ti,String co,int ui){
		boolean f=false;
		try {
			String qu="insert into post(title,content,uid) values(?,?,?)";
			
			PreparedStatement ps=conn.prepareStatement(qu);
			ps.setString(1,ti);
			ps.setString(2,co);
			ps.setInt(3,ui);
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public List<Post> getData(int id){
		List<Post> list = new ArrayList<Post>();
		Post po = null;
		try {
			String qu="select * from post where uid=? order by id DESC";
			PreparedStatement ps= conn.prepareStatement(qu);
			ps.setInt(1, id);
			
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				po=new Post();
				po.setId(rs.getInt(1));
				po.setTitle(rs.getString(2));
				po.setContent(rs.getString(3));
				po.setPdate(rs.getTimestamp(4));
				list.add(po);
				
			}
			
		} catch(Exception e) {
			
		}
		
		return list;
		
	}
	
	public Post getDataById(int noteid) {
		Post p=null;
		try {
			String qu="select * from post where id=?";
			PreparedStatement ps=conn.prepareStatement(qu);
			ps.setInt(1, noteid);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()) {
				p=new Post();
				p.setId(rs.getInt(1));
				p.setTitle(rs.getString(2));
				p.setContent(rs.getString(3));
				
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return p;
	}
	
	 public boolean PostUpdate(int nid,String ti,String co) {
		 boolean f=false;
		 
		 try {
			 String qu="update post set title=?,content=? where id=?";
			 PreparedStatement ps=conn.prepareStatement(qu);
			 ps.setString(1, ti);
			 ps.setString(2, co);
			 ps.setInt(3, nid);
			 int i=ps.executeUpdate();
			 
			 if(i==1) {
				 f=true;
			 }
		 } catch(Exception e) {
			 e.printStackTrace(); 
		 }
		 
		 return f;
	 }
	 
	 public boolean DeleteNotes(int nid) {
		 boolean f=false;
		 try {
			 String qu="delete from post where id=?";
			 PreparedStatement ps=conn.prepareStatement(qu);
			 ps.setInt(1, nid);
			 int x=ps.executeUpdate();
			 if(x==1) {
				 f=true;
			 }
		 } catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		 return f;
	 }
	
	 public List<Post> getAllNotes() {
		    List<Post> notesList = new ArrayList<>();
		    String sql = "SELECT p.id, p.title, p.content, p.date, u.id AS user_id, u.name AS user_name, u.email AS user_email " +
		                 "FROM post p JOIN user u ON p.uid = u.id order by id DESC";
		    
		    try (PreparedStatement ps = conn.prepareStatement(sql)) {
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            // Create and set up UserDetails object
		            UserDetails user = new UserDetails();
		            user.setId(rs.getInt("user_id"));
		            user.setName(rs.getString("user_name"));
		            user.setEmail(rs.getString("user_email"));

		            // Create and set up Post object
		            Post post = new Post();
		            post.setId(rs.getInt("id"));
		            post.setTitle(rs.getString("title"));
		            post.setContent(rs.getString("content"));
		            post.setPdate(rs.getDate("date"));
		            post.setUser(user); // Set the UserDetails object in the Post

		            // Add to list
		            notesList.add(post);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return notesList;
		}


}
