  package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import java.util.List;

import com.User.UserDetails;
import com.User.post;

public class postDAO {
	private Connection conn;

	public postDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean Addnotes(post po) {
		boolean f = false;
		try {
			String query = "insert into post (title,category,college,branch,semester,content,uid,pdf_file) values (?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, po.getTitle());
			ps.setString(2, po.getCategory());
			ps.setString(3, po.getCollege());
			ps.setString(4, po.getBranch());
			ps.setString(5, po.getSemester());
			ps.setString(6, po.getContent());
			ps.setInt(7, po.getUser().getId());
			ps.setString(8, po.getPdfFile());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace(); // Log the exception
		}
		return f;
	}

	public List<post> getData(int uid) {
		List<post> list = new ArrayList<>();
		try {
			String query = "SELECT * FROM post WHERE uid = ? order by id DESC";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, uid);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				post po = new post();
				po.setId(rs.getInt("id"));				po.setCategory(rs.getString("category"));
				po.setCollege(rs.getString("college"));
				po.setBranch(rs.getString("branch"));
				po.setSemester(rs.getString("semester"));
				po.setContent(rs.getString("content"));
				po.setPdate(rs.getTimestamp("date"));
				po.setPdfFile(rs.getString("pdf_file"));

				UserDetails user = new UserDetails();
				user.setId(rs.getInt("uid"));
				po.setUser(user);

				list.add(po);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<post> searchByCategory(int uid, String category) {

	    List<post> list = new ArrayList<>();

	    try {

	        String query =
	        "SELECT * FROM post WHERE uid=? AND LOWER(category) LIKE LOWER(?) ORDER BY id DESC";

	        PreparedStatement ps = conn.prepareStatement(query);

	        ps.setInt(1, uid);

	        ps.setString(2, "%" + category.trim() + "%");

	        ResultSet rs = ps.executeQuery();

	        while(rs.next()) {

	            post po = new post();

	            po.setId(rs.getInt("id"));
	            po.setTitle(rs.getString("title"));
	            po.setContent(rs.getString("content"));
	            po.setPdate(rs.getTimestamp("date"));
	            po.setCategory(rs.getString("category"));
	            po.setPdfFile(rs.getString("pdf_file"));

	            UserDetails user = new UserDetails();

	            user.setId(rs.getInt("uid"));

	            po.setUser(user);

	            list.add(po);
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}

	public post getDataById(int noteid) {
		post p = null;
		try {
			String qu = "select * from post where id =? ";
			PreparedStatement ps = conn.prepareStatement(qu);
			ps.setInt(1, noteid);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				p = new post();
				p.setId(rs.getInt(1));
				p.setTitle(rs.getString(2));
				p.setContent(rs.getString(3));
				p.setPdfFile(rs.getString("pdf_file"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;

	}

	public boolean postupdate(int nid, String title, String co) {
		boolean f = false;

		try {
			String update = "update post set title = ?,content =? where id = ?";
			PreparedStatement ps = conn.prepareStatement(update);
			ps.setString(1, title);
			ps.setString(2, co);
			ps.setInt(3, nid);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean Deletenote(int nid) {
		boolean f = false;
		try {
			String qu = "delete from post where id = ?";
			PreparedStatement ps = conn.prepareStatement(qu);
			ps.setInt(1, nid);
			int x = ps.executeUpdate();
			if (x == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public int getNotesCount() {

	    int count = 0;

	    try {

	        String sql = "SELECT COUNT(*) FROM post";

	        PreparedStatement ps = conn.prepareStatement(sql);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()) {
	            count = rs.getInt(1);
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return count;
	}
	public List<post> getAllNotes() {

	    List<post> list = new ArrayList<>();

	    try {

	        String sql = "SELECT * FROM post ORDER BY id DESC";

	        PreparedStatement ps = conn.prepareStatement(sql);

	        ResultSet rs = ps.executeQuery();

	        while(rs.next()) {

	            post p = new post();

	            p.setId(rs.getInt("id"));
	            p.setTitle(rs.getString("title"));
	            p.setContent(rs.getString("content"));
	            p.setCategory(rs.getString("category"));
	            p.setPdfFile(rs.getString("pdf_file"));

	            list.add(p);
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
}
