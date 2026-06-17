package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO {

    private Connection conn;

    public AdminDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean login(String username, String password) {

        boolean f = false;

        try {

            String sql = "select * from admin where username=? and password=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
}