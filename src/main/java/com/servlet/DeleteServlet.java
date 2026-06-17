package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.postDAO;
import com.Db.DBconnect;


@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int noteid = Integer.parseInt(request.getParameter("note_id"));
        postDAO dao = new postDAO(DBconnect.getConn());
        boolean f = dao.Deletenote(noteid);

        HttpSession session = request.getSession();
        if (f) {
            session.setAttribute("deletemsg", "Note deleted Successfully!");
        } else {
            session.setAttribute("wrongmsg", "Something went wrong.");
        }
        response.sendRedirect("ShowNotes.jsp");
    }
}

