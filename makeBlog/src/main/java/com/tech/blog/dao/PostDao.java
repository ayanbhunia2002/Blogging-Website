package com.tech.blog.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

public class PostDao {

	Connection con;

	public PostDao(Connection con) {
		this.con = con;
	}

	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> list = new ArrayList<>();

		try {

			String q = "select * from categories";
			Statement st = this.con.createStatement();
			ResultSet set = st.executeQuery(q);

			while (set.next()) {
				int cid = set.getInt("cid");
				String name = set.getString("name");
				String description = set.getString("description");
				Category c = new Category(cid, name, description);
				list.add(c);
			}

		}
		catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(list);

		return list;
	}

	public boolean savePost(Post p) {
		boolean f = false;

		try {

			String q = "insert into posts(pTitle, pContent, pCode ,pPic, pDate, catId, userId) values(?, ?, ? ,?, ?, ?, ?)";

			PreparedStatement pstmt = con.prepareStatement(q);

			pstmt.setString(1, p.getpTitle());
			pstmt.setString(2, p.getpContent());
			pstmt.setString(3, p.getpCode());
			pstmt.setString(4, p.getpPic());
			pstmt.setString(5, p.getpDate());
			pstmt.setInt(6, p.getCatId());
			pstmt.setInt(7, p.getUserId());

			pstmt.executeUpdate();
			f = true;

		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	// get all the post
	public List<Post> getAllPost() {
		List<Post> list = new ArrayList<>();

		// fetch all the post
		try {

			String q = "select * from posts order by pid desc";

			PreparedStatement p = con.prepareStatement(q);
			ResultSet set = p.executeQuery();

			while (set.next()) {

				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				String date = set.getString("pDate");
				int catId = set.getInt("catId");
				int userId = set.getInt("userId");

				Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);

				list.add(post);

			}

		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// get all the post by id
	public List<Post> getPostByCatId(int catId) {
		List<Post> list = new ArrayList<>();

		try {

			String q = "select * from posts where catId = ?";

			PreparedStatement p = con.prepareStatement(q);
			p.setInt(1, catId);
			ResultSet set = p.executeQuery();

			while (set.next()) {

				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				String date = set.getString("pDate");
				int userId = set.getInt("userId");

				Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);

				list.add(post);

			}

		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	
	//fetch Category by cid
	public Category getCategoryBycid(int cid) {
		
		try {
			
			Category ct = new Category();
			ct.setCid(cid);
			
			String q = "select name from categories where cid = ?";

			PreparedStatement p = con.prepareStatement(q);
			p.setInt(1, ct.getCid());
			ResultSet set = p.executeQuery();

			set.next();
			
			String name = set.getString(1);
			
			ct.setName(name);
			
			return ct;

		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	// get full Post by postId
	public Post getPostByPostId(int postId) {
		
        Post post = null;
        String q = "select * from posts where pid=?";
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postId);

            ResultSet set = p.executeQuery();

            if (set.next()) {

            	int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				String date = set.getString("pDate");
				int userId = set.getInt("userId");
				int cid = set.getInt("catId");
				

				post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }

}
