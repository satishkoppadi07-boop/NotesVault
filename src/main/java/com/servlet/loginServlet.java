package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.userDAO;
import com.Db.DBconnect;
import com.User.UserDetails;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("uname");
        String password = request.getParameter("upassword");

        UserDetails us = new UserDetails();
        us.setEmail(email);
        us.setPassword(password);

        userDAO dao = new userDAO(DBconnect.getConn());
        UserDetails user = dao.loginUser(us);

        if (user != null) {
            
            HttpSession session = request.getSession();
            session.setAttribute("userD", user);
            response.sendRedirect("Home.jsp");
        } else {
           
            request.getSession().setAttribute("fail-message", "Invalid email or password!");
            response.sendRedirect("login.jsp");
        }
    }
}
