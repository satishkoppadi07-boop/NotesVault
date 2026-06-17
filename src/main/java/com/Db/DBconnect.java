package com.Db;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
    private static Connection conn;

    public static Connection getConn() {
        if (conn == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/noteshub", "root", "");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return conn;
    }
}
