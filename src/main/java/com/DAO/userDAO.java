package com.DAO;

import java.sql.Connection;
import java.util.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.User.UserDetails;

public class userDAO {
	private Connection conn;

	public userDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addUser(UserDetails us) {
		boolean f = false;
		try {
			String query = "INSERT INTO users(name, email, password) VALUES (?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(query);
			
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPassword());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public UserDetails loginUser(UserDetails us) {
		UserDetails user = null;
		try {
			String query = "SELECT * FROM users WHERE email = ? AND password = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, us.getEmail());
			ps.setString(2, us.getPassword());

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				user = new UserDetails();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	public boolean updateUser(UserDetails us)
	{
	    boolean f = false;

	    try {

	        String sql = "update users set name=?, email=?, password=? where id=?";

	        PreparedStatement ps = conn.prepareStatement(sql);

	        ps.setString(1, us.getName());
	        ps.setString(2, us.getEmail());
	        ps.setString(3, us.getPassword());
	        ps.setInt(4, us.getId());

	        int i = ps.executeUpdate();

	        if(i == 1)
	        {
	            f = true;
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return f;
	}
	public int getUserCount() {

	    int count = 0;

	    try {

	        String sql = "SELECT COUNT(*) FROM users";

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
	public List<UserDetails> getAllUsers() {

	    List<UserDetails> list = new ArrayList<>();

	    try {

	        String sql = "SELECT * FROM users";
	        PreparedStatement ps = conn.prepareStatement(sql);

	        ResultSet rs = ps.executeQuery();

	        while(rs.next()) {

	            UserDetails u = new UserDetails();

	            u.setId(rs.getInt("id"));
	            u.setName(rs.getString("name"));
	            u.setEmail(rs.getString("email"));
	            u.setPassword(rs.getString("password"));

	            list.add(u);
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
}
