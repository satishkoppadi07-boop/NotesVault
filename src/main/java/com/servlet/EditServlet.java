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

@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	try {
		int noteid=Integer.parseInt(request.getParameter("noteid"));
		String Title =request.getParameter("title");
		String Content = request.getParameter("content");
		
		postDAO dao = new postDAO(DBconnect.getConn());
		boolean f = dao.postupdate(noteid,Title,Content);
		if(f) {
			System.out.println("Data updated ");
			HttpSession session = request.getSession();
			session.setAttribute("updatemsg", "Note updated sucessfully !");
			response.sendRedirect("ShowNotes.jsp");
		}
		else {
			System.out.println("Data not updated ");
		}
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	}

}
