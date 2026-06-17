package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.User.UserDetails;
import com.DAO.userDAO;
import com.Db.DBconnect;

@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();

        UserDetails user = (UserDetails) session.getAttribute("userD");

        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);

        

        userDAO dao = new userDAO(DBconnect.getConn());

        boolean f = dao.updateUser(user);

        if(f)
        {
            session.setAttribute("userD", user);
            response.sendRedirect("Home.jsp");
        }
        else
        {
            response.sendRedirect("Home.jsp");
        }
    }
}