package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.AdminDAO;
import com.Db.DBconnect;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        AdminDAO dao = new AdminDAO(DBconnect.getConn());

        boolean f = dao.login(username, password);

        if (f) {

            HttpSession session = req.getSession();
            session.setAttribute("admin", username);

            resp.sendRedirect("adminHome.jsp");

        } else {

            resp.sendRedirect("adminLogin.jsp");

        }
    }
}